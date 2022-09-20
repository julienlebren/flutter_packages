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
          fontSize: 11,
          color: theme.textButtonColor,
        ),
        PlatformTextButton(
          title: l10n.privacyPolicyButton,
          onPressed: () => _openUrl(settings.privacyPolicyUrl),
          fontSize: 11,
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

class PurchasesWeeklyButton extends ConsumerWidget {
  const PurchasesWeeklyButton({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _PurchasesPurchaseButton(
      title: title,
      type: PackageType.weekly,
    );
  }
}

class PurchasesMonthlyButton extends ConsumerWidget {
  const PurchasesMonthlyButton({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _PurchasesPurchaseButton(
      title: title,
      type: PackageType.monthly,
    );
  }
}

class PurchasesTwoMonthButton extends ConsumerWidget {
  const PurchasesTwoMonthButton({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _PurchasesPurchaseButton(
      title: title,
      type: PackageType.twoMonth,
    );
  }
}

class PurchasesThreeMonthButton extends ConsumerWidget {
  const PurchasesThreeMonthButton({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _PurchasesPurchaseButton(
      title: title,
      type: PackageType.threeMonth,
    );
  }
}

class PurchasesSixMonthButton extends ConsumerWidget {
  const PurchasesSixMonthButton({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _PurchasesPurchaseButton(
      title: title,
      type: PackageType.sixMonth,
    );
  }
}

class PurchasesAnnualButton extends ConsumerWidget {
  const PurchasesAnnualButton({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _PurchasesPurchaseButton(
      title: title,
      type: PackageType.annual,
    );
  }
}

class _PurchasesPurchaseButton extends ConsumerWidget {
  const _PurchasesPurchaseButton({
    Key? key,
    required this.title,
    required this.type,
  }) : super(key: key);

  final String title;
  final PackageType type;

  void _purchase(WidgetRef ref) {
    final controller = ref.watch(purchasesControllerProvider.notifier);
    controller.handleEvent(PurchasesEvent.purchase(type));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPurchasing = ref.watch(purchasesControllerProvider.select(
      (value) => value.isPurchasing,
    ));

    return SizedBox(
      width: double.infinity,
      child: PlatformElevatedButton(
        title: title,
        onPressed: isPurchasing ? null : () => _purchase(ref),
      ),
    );
  }
}
