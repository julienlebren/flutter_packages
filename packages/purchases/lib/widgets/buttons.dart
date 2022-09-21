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
  }) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(purchasesLocalizationsProvider);

    return _PurchasesButton(
      type: PackageType.weekly,
      title: title,
      caption: l10n.weeklyCaption,
    );
  }
}

class PurchasesMonthlyButton extends ConsumerWidget {
  const PurchasesMonthlyButton({
    Key? key,
    this.title,
  }) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(purchasesLocalizationsProvider);

    return _PurchasesButton(
      type: PackageType.monthly,
      title: title,
      caption: l10n.monthlyCaption,
    );
  }
}

class PurchasesTwoMonthButton extends ConsumerWidget {
  const PurchasesTwoMonthButton({
    Key? key,
    this.title,
  }) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(purchasesLocalizationsProvider);

    return _PurchasesButton(
      type: PackageType.twoMonth,
      title: title,
      caption: l10n.twoMonthCaption,
    );
  }
}

class PurchasesThreeMonthButton extends ConsumerWidget {
  const PurchasesThreeMonthButton({
    Key? key,
    this.title,
  }) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(purchasesLocalizationsProvider);

    return _PurchasesButton(
      type: PackageType.threeMonth,
      title: title,
      caption: l10n.threeMonthCaption,
    );
  }
}

class PurchasesSixMonthButton extends ConsumerWidget {
  const PurchasesSixMonthButton({
    Key? key,
    this.title,
  }) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(purchasesLocalizationsProvider);

    return _PurchasesButton(
      type: PackageType.sixMonth,
      title: title,
      caption: l10n.sixMonthCaption,
    );
  }
}

class PurchasesAnnualButton extends ConsumerWidget {
  const PurchasesAnnualButton({
    Key? key,
    this.title,
  }) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(purchasesLocalizationsProvider);

    return _PurchasesButton(
      type: PackageType.annual,
      title: title,
      caption: l10n.annualCaption,
    );
  }
}

class _PurchasesButton extends ConsumerWidget {
  const _PurchasesButton({
    Key? key,
    this.title,
    this.caption,
    required this.type,
  }) : super(key: key);

  final String? title;
  final String? caption;
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
    final appTheme = ref.watch(appThemeProvider);
    final purchasesTheme = ref.watch(purchasesThemeProvider);

    return ProviderScope(
      overrides: [
        if (caption != null)
          appThemeProvider.overrideWithValue(
            appTheme.copyWith(
              elevatedButtonPadding: 8,
            ),
          ),
      ],
      child: Container(
        decoration:
            !isPurchasing && purchasesTheme.purchaseButtonBorderColor != null
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        purchasesTheme.purchaseButtonBorderRadius),
                    border: Border.all(
                        color: purchasesTheme.purchaseButtonBorderColor!),
                  )
                : null,
        child: SizedBox(
          width: double.infinity,
          child: PlatformElevatedButton(
            onPressed: isPurchasing ? null : () => _purchase(ref),
            title: title,
            color: color,
            child: title == null
                ? _PurchaseButtonContents(
                    type: type,
                    caption: caption!,
                  )
                : null,
          ),
        ),
      ),
    );
  }
}

class _PurchaseButtonContents extends ConsumerWidget {
  const _PurchaseButtonContents({
    required this.type,
    required this.caption,
    Key? key,
  }) : super(key: key);

  final PackageType type;
  final String caption;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textColor = ref.watch(purchasesThemeProvider.select(
      (theme) => theme.textColor,
    ));
    final price = priceString(type, ref);

    return Column(
      children: [
        if (price != null) ...[
          Text(
            price,
            style: TextStyle(
              fontSize: 22,
              color: textColor,
            ),
          ),
          Text(
            caption,
            style: TextStyle(
              fontSize: 13,
              color: textColor,
            ),
          ),
        ] else ...[
          const PlatformActivityIndicator(),
        ]
      ],
    );
  }
}
