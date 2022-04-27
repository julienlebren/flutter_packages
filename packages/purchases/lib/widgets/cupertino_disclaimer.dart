part of '../purchases.dart';

class PurchasesCupertinoDisclaimer extends ConsumerWidget {
  const PurchasesCupertinoDisclaimer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(purchasesLocalizationsProvider);
    final textColor = ref.watch(
      purchasesThemeProvider.select((theme) => theme.cupertinoDisclaimerColor),
    );

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Text(
        l10n.cupertinoDisclaimer,
        style: TextStyle(
          color: textColor,
          fontSize: 12,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
