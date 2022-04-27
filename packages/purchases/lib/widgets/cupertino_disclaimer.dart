part of '../purchases.dart';

class PurchasesCupertinoDisclaimer extends ConsumerWidget {
  const PurchasesCupertinoDisclaimer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(purchasesLocalizationsProvider);

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Text(
        l10n.cupertinoDisclaimer,
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 12,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
