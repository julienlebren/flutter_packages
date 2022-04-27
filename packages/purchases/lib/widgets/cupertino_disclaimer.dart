part of '../purchases.dart';

class PurchasesCupertinoDisclaimer extends ConsumerWidget {
  const PurchasesCupertinoDisclaimer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(purchasesLocalizationsProvider);
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Text(
        l10n.subscriptionCupertinoCaption,
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 12,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class PurchasesTermsButtons extends ConsumerWidget {
  const PurchasesTermsButtons({
    Key? key,
  }) : super(key: key);

  Future<void> _openUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (await canLaunchUrl(_url)) {
      await launchUrl(_url);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(purchasesLocalizationsProvider);
    final settings = ref.watch(purchasesSettingsProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PlatformTextButton(
          title: l10n.subscriptionTermsButton,
          onPressed: () => _openUrl(settings.termsUrl),
          fontSize: 12,
        ),
        PlatformTextButton(
          title: l10n.subscriptionPrivacyPolicyButton,
          onPressed: () => _openUrl(settings.privacyPolicyUrl),
          fontSize: 12,
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
    return PlatformTextButton(
      title: l10n.subscriptionRestoreButton,
      onPressed: isPurchasing ? null : () => _restorePurchases(ref),
    );
  }
}
