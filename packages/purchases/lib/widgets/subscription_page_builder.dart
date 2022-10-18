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
    final controller = ref.read(purchasesControllerProvider.notifier);
    controller.handleEvent(const PurchasesEvent.openOffers());
  }

  _closePage(BuildContext context, WidgetRef ref) {
    final isPurchasing = ref.read(purchasesControllerProvider.select(
      (state) => state.isPurchasing,
    ));

    if (isPurchasing) {
      final l10n = ref.watch(purchasesLocalizationsProvider);
      showAlertDialog(
        context,
        ref,
        title: l10n.closeAlertTitle,
        actions: [
          PlatformDialogAction(
            buttonText: l10n.closeAlertCloseButton,
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
            },
          ),
          PlatformDialogAction(
            buttonText: l10n.closeAlertCancelButton,
            isDefaultAction: true,
          )
        ],
        displayCancelButton: false,
      );
    } else {
      Navigator.of(context, rootNavigator: true).pop();
    }
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
            child: SizedBox.shrink(),

            /*PlatformScaffold(
              appBar: PlatformNavigationBar(
                leading: PlatformNavigationBarCloseButton(
                  onPressed: () => _closePage(context, ref),
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
                  hasStoreIssue: state.isReady && !state.hasPackage,
                  isPurchasing: state.isPurchasing,
                ),
              ),
            ),*/
          ),
        ),
      ),
    );
  }
}

/*
class SubscriptionScaffold extends ConsumerWidget {
  const SubscriptionScaffold({
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(purchasesControllerProvider);
    final appTheme = ref.watch(appThemeProvider);
    final theme = ref.watch(purchasesThemeProvider);
    final cupertinoTheme = ref.watch(cupertinoThemeProvider);


    return PlatformScaffold(
              appBar: PlatformNavigationBar(
                leading: PlatformNavigationBarCloseButton(
                  onPressed: () => _closePage(context, ref),
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
                  hasStoreIssue: state.isReady && !state.hasPackage,
                  isPurchasing: state.isPurchasing,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
*/

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

class SubscriptionPageContents extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return FormWithOverlay(
      isSaving: isPurchasing,
      overlay: const SubscriptionPurchaseOverlay(),
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

class SubscriptionPurchaseOverlay extends ConsumerWidget {
  const SubscriptionPurchaseOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(purchasesLocalizationsProvider);

    return Container(
      padding: const EdgeInsets.all(30),
      width: 220,
      decoration: const BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const PlatformActivityIndicator(
            color: Colors.white,
          ),
          const SizedBox(height: 16),
          Text(
            l10n.purchaseInProgress,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ],
      ),
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
    final textColor = ref.watch(
      purchasesThemeProvider.select((theme) => theme.textColor),
    );

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              l10n.priceNotLoaded,
              textAlign: TextAlign.center,
              style: TextStyle(color: textColor),
            ),
            const SizedBox(height: 15),
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
