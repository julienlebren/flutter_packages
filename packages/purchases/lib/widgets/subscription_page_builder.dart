part of '../purchases.dart';

class SubscriptionPage extends ConsumerWidget {
  const SubscriptionPage({
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

    return PlatformModalScaffold(
      appBar: PlatformNavigationBar(
        title: title,
        trailing: isCupertino() && canDiscount
            ? PlatformNavigationBarButton(
                onPressed: () => _openOffers(ref),
                icon: Icons.redeem,
              )
            : null,
      ),
      body: Container(
          decoration: theme.backgroundImage != null
              ? BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(theme.backgroundImage!),
                    fit: BoxFit.cover,
                  ),
                )
              : null,
          child: /*Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SubscriptionAppBar(),*/
              SubscriptionPageContents(
            header: header,
            body: body,
            footer: footer,
            hasStoreIssue: state.isReady && state.price == null,
            isPurchasing: state.isLoading,
          )
          /*],
        ),*/
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
                  ? const PurchasesIssue()
                  : SliverToBoxAdapter(child: footer),
            ],
          ),
        ),
      ),
    );
  }
}
