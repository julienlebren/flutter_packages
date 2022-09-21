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
    this.title,
    this.child,
  }) : super(key: key);

  final String? title;
  final Widget? child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _PurchasesPurchaseButton(
      type: PackageType.weekly,
      title: title,
      child: child,
    );
  }
}

class PurchasesMonthlyButton extends ConsumerWidget {
  const PurchasesMonthlyButton({
    Key? key,
    this.title,
    this.child,
  }) : super(key: key);

  final String? title;
  final Widget? child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _PurchasesPurchaseButton(
      type: PackageType.monthly,
      title: title,
      child: child,
    );
  }
}

class PurchasesTwoMonthButton extends ConsumerWidget {
  const PurchasesTwoMonthButton({
    Key? key,
    this.title,
    this.child,
  }) : super(key: key);

  final String? title;
  final Widget? child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _PurchasesPurchaseButton(
      type: PackageType.twoMonth,
      title: title,
      child: child,
    );
  }
}

class PurchasesThreeMonthButton extends ConsumerWidget {
  const PurchasesThreeMonthButton({
    Key? key,
    this.title,
    this.child,
  }) : super(key: key);

  final String? title;
  final Widget? child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _PurchasesPurchaseButton(
      type: PackageType.threeMonth,
      title: title,
      child: child,
    );
  }
}

class PurchasesSixMonthButton extends ConsumerWidget {
  const PurchasesSixMonthButton({
    Key? key,
    this.title,
    this.child,
  }) : super(key: key);

  final String? title;
  final Widget? child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _PurchasesPurchaseButton(
      type: PackageType.sixMonth,
      title: title,
      child: child,
    );
  }
}

class PurchasesAnnualButton extends ConsumerWidget {
  const PurchasesAnnualButton({
    Key? key,
    this.title,
    this.child,
  }) : super(key: key);

  final String? title;
  final Widget? child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _PurchasesPurchaseButton(
      type: PackageType.annual,
      title: title,
      child: child,
    );
  }
}

class _PurchasesPurchaseButton extends ConsumerWidget {
  const _PurchasesPurchaseButton({
    Key? key,
    this.title,
    this.child,
    required this.type,
  }) : super(key: key);

  final String? title;
  final Widget? child;
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
    final color = ref.watch(purchasesThemeProvider.select(
      (value) => value.purchaseButtonBackgroundColor,
    ));

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white60),
      ),
      child: SizedBox(
        width: double.infinity,
        child: PlatformElevatedButton(
          onPressed: isPurchasing ? null : () => _purchase(ref),
          title: title,
          color: color,
          child: child,
        ),
      ),
    );
  }
}
