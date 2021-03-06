part of '../purchases.dart';

class SubscriptionPageBuilder extends ConsumerWidget {
  const SubscriptionPageBuilder({
    Key? key,
    this.title,
    required this.header,
    required this.body,
    required this.footer,
    this.canDiscount = false,
  }) : super(key: key);

  final String? title;
  final Widget header;
  final Widget body;
  final Widget footer;
  final bool canDiscount;

  _openOffers(WidgetRef ref) {
    final controller = ref.watch(purchasesControllerProvider.notifier);
    controller.handleEvent(const PurchasesEvent.openOffers());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(purchasesControllerProvider);
    final appTheme = ref.watch(appThemeProvider);
    final theme = ref.watch(purchasesThemeProvider);
    final cupertinoTheme = ref.watch(cupertinoThemeProvider);

    ref.listen<PurchasesState>(purchasesControllerProvider, (_, state) {
      if (state.errorText != null) {
        final l10n = ref.watch(purchasesLocalizationsProvider);
        showErrorDialog(
          context,
          ref,
          title: l10n.errorTitle,
          content: state.errorText!,
        );
      } else if (state.isSuccess) {
        final navigator = Navigator.of(context, rootNavigator: true);
        navigator.pop(context);
      }
    });

    return ProviderScope(
      overrides: [
        appThemeProvider.overrideWithValue(
          appTheme.copyWith(
            scaffoldBackgroundColor: Colors.transparent,
          ),
        ),
      ],
      child: CupertinoTheme(
        data: cupertinoTheme.copyWith(primaryColor: theme.textColor),
        child: SafeArea(
          top: false,
          bottom: false,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: theme.backgroundColor,
              image: theme.backgroundImage != null
                  ? DecorationImage(
                      image: AssetImage(theme.backgroundImage!),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: PlatformScaffold(
              appBar: PlatformNavigationBar(
                leading: PlatformNavigationBarCloseButton(
                  onPressed: () =>
                      Navigator.of(context, rootNavigator: true).pop(),
                ),
                trailing: isCupertino() && canDiscount
                    ? PlatformNavigationBarButton(
                        onPressed: () => _openOffers(ref),
                        icon: Icons.redeem,
                      )
                    : null,
              ),
              body: CupertinoTheme(
                data: cupertinoTheme.copyWith(
                  primaryColor: appTheme.primaryColor,
                ),
                child: SubscriptionPageContents(
                  header: header,
                  body: body,
                  footer: footer,
                  hasStoreIssue: state.isReady && state.price == null,
                  isPurchasing: state.isLoading,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SubscriptionAppBar extends ConsumerWidget {
  const SubscriptionAppBar({
    Key? key,
    this.canDiscount = false,
  }) : super(key: key);

  final bool canDiscount;

  _openOffers(WidgetRef ref) {
    final controller = ref.watch(purchasesControllerProvider.notifier);
    controller.handleEvent(const PurchasesEvent.openOffers());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = CupertinoTheme.of(context);
    final textColor = ref.watch(
      purchasesThemeProvider.select((theme) => theme.textColor),
    );

    return CupertinoTheme(
      data: theme.copyWith(primaryColor: textColor),
      child: SizedBox(
        height: 50,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            children: [
              PlatformNavigationBarCloseButton(
                onPressed: () => Navigator.pop(context),
              ),
              if (isCupertino() && canDiscount)
                PlatformNavigationBarButton(
                  onPressed: () => _openOffers(ref),
                  icon: Icons.redeem,
                )
            ],
          ),
        ),
      ),
    );
  }
}

class SubscriptionPageContents extends ConsumerWidget {
  const SubscriptionPageContents({
    Key? key,
    required this.header,
    required this.body,
    required this.footer,
    this.hasStoreIssue = false,
    this.isPurchasing = false,
  }) : super(key: key);

  final Widget header;
  final Widget body;
  final Widget footer;
  final bool hasStoreIssue;
  final bool isPurchasing;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FormWithOverlay(
      isSaving: isPurchasing,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: CustomScrollView(
          clipBehavior: Clip.none,
          physics: isCupertino()
              ? const AlwaysScrollableScrollPhysics()
              : const ClampingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: header),
            SliverToBoxAdapter(child: body),
            hasStoreIssue
                ? const SubscriptionStoreIssue()
                : SliverToBoxAdapter(child: footer),
          ],
        ),
      ),
    );
  }
}

class SubscriptionYearPrice extends ConsumerWidget {
  const SubscriptionYearPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(purchasesLocalizationsProvider);
    final price = ref.watch(purchasesControllerProvider).price;
    final theme = ref.watch(purchasesThemeProvider);

    return Container(
      height: 65,
      padding: const EdgeInsets.only(
        bottom: 20,
        top: 15,
      ),
      child: price != null
          ? Text(
              l10n.yearPrice(price),
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                letterSpacing: -1,
                color: theme.textColor,
              ),
              textAlign: TextAlign.center,
            )
          : const FormLoader(),
    );
  }
}

class SubscriptionStoreIssue extends ConsumerWidget {
  const SubscriptionStoreIssue({Key? key}) : super(key: key);

  _getOfferings(WidgetRef ref) {
    final controller = ref.watch(purchasesControllerProvider.notifier);
    controller.handleEvent(const PurchasesEvent.fetchOfferings());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(purchasesLocalizationsProvider);

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(l10n.priceNotLoaded),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: PlatformElevatedButton(
                title: l10n.retryButton,
                onPressed: () => _getOfferings(ref),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
