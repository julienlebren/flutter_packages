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
            scaffoldBackgroundColor: Colors.purpleAccent,
          ),
        ),
      ],
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
          child: PlatformModalScaffold(
            appBar: PlatformNavigationBar(
              title: title,
              trailing: isCupertino() && canDiscount
                  ? PlatformNavigationBarButton(
                      onPressed: () => _openOffers(ref),
                      icon: Icons.redeem,
                    )
                  : null,
            ),
            body: SubscriptionPageContents(
              header: header,
              body: body,
              footer: footer,
              hasStoreIssue: state.isReady && state.price == null,
              isPurchasing: state.isLoading,
            ),
          ),
        ),
      ),
    );
  }
}

/*
class SubscriptionAppBar extends StatelessWidget {
  const SubscriptionAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          children: [
            PlatformTextButton(
              title: MaterialLocalizations.of(context)
                  .closeButtonLabel
                  .toLowerCase()
                  .capitalize(),
              onPressed: () => Navigator.pop(context),
              color: Colors.white,
              padding: 14.0,
            ),
          ],
        ),
      ),
    );
  }
}
*/

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
    return Expanded(
      child: FormWithOverlay(
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
