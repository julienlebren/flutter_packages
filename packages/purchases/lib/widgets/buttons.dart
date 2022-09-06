part of '../purchases.dart';

class PurchasesTermsButtons extends ConsumerWidget {
  const PurchasesTermsButtons({
    Key? key,
  }) : super(key: key);

  Future<void> _openUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(purchasesLocalizationsProvider);
    final settings = ref.watch(purchasesSettingsProvider);
    final theme = ref.watch(purchasesThemeProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PlatformTextButton(
          title: l10n.termsButton,
          onPressed: () => _openUrl(settings.termsUrl),
          fontSize: 12,
          color: theme.textButtonColor,
        ),
        PlatformTextButton(
          title: l10n.privacyPolicyButton,
          onPressed: () => _openUrl(settings.privacyPolicyUrl),
          fontSize: 12,
          color: theme.textButtonColor,
        ),
      ],
    );
  }
}

class PurchasesRestoreButton extends ConsumerWidget {
  const PurchasesRestoreButton({
    Key? key,
    this.isPurchasing = false,
  }) : super(key: key);

  final bool isPurchasing;

  void _restorePurchases(WidgetRef ref) {
    final controller = ref.watch(purchasesControllerProvider.notifier);
    controller.handleEvent(const PurchasesEvent.restorePurchases());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(purchasesLocalizationsProvider);
    final theme = ref.watch(purchasesThemeProvider);

    return PlatformTextButton(
      title: l10n.restoreButton,
      onPressed: isPurchasing ? null : () => _restorePurchases(ref),
      color: theme.textButtonColor,
    );
  }
}

class PurchasesPurchaseButton extends ConsumerWidget {
  const PurchasesPurchaseButton({
    Key? key,
    required this.title,
    this.isPurchasing = false,
  }) : super(key: key);

  final bool isPurchasing;
  final String title;

  void _purchase(WidgetRef ref) {
    final controller = ref.watch(purchasesControllerProvider.notifier);
    controller.handleEvent(const PurchasesEvent.purchase());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      child: PlatformElevatedButton(
        title: title,
        onPressed: isPurchasing ? null : () => _purchase(ref),
      ),
    );
  }
}
