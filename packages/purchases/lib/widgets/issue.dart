part of '../purchases.dart';

class PurchasesIssue extends ConsumerWidget {
  const PurchasesIssue({Key? key}) : super(key: key);

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
