part of '../purchases.dart';

String? priceString(PackageType type, WidgetRef ref) {
  final l10n = ref.watch(purchasesLocalizationsProvider);
  final controller = ref.watch(purchasesControllerProvider);
  switch (type) {
    case PackageType.annual:
      return controller.annualPrice != null
          ? l10n.annualPrice(controller.annualPrice!)
          : null;
    case PackageType.sixMonth:
      return controller.sixMonthPrice != null
          ? l10n.sixMonthPrice(controller.sixMonthPrice!)
          : null;
    case PackageType.threeMonth:
      return controller.threeMonthPrice != null
          ? l10n.threeMonthPrice(controller.threeMonthPrice!)
          : null;
    case PackageType.twoMonth:
      return controller.twoMonthPrice != null
          ? l10n.twoMonthPrice(controller.twoMonthPrice!)
          : null;
    case PackageType.monthly:
      return controller.monthlyPrice != null
          ? l10n.monthlyPrice(controller.monthlyPrice!)
          : null;
    case PackageType.weekly:
      return controller.weeklyPrice != null
          ? l10n.weeklyPrice(controller.weeklyPrice!)
          : null;
    default:
      return null;
  }
}

class SubscriptionWeeklyPrice extends ConsumerWidget {
  const SubscriptionWeeklyPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      _SubscriptionPrice(price: priceString(PackageType.weekly, ref));
}

class SubscriptionMonthlyPrice extends ConsumerWidget {
  const SubscriptionMonthlyPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      _SubscriptionPrice(price: priceString(PackageType.monthly, ref));
}

class SubscriptionTwoMonthPrice extends ConsumerWidget {
  const SubscriptionTwoMonthPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      _SubscriptionPrice(price: priceString(PackageType.twoMonth, ref));
}

class SubscriptionThreeMonthPrice extends ConsumerWidget {
  const SubscriptionThreeMonthPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      _SubscriptionPrice(price: priceString(PackageType.threeMonth, ref));
}

class SubscriptionSixMonthPrice extends ConsumerWidget {
  const SubscriptionSixMonthPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      _SubscriptionPrice(price: priceString(PackageType.sixMonth, ref));
}

class SubscriptionAnnualPrice extends ConsumerWidget {
  const SubscriptionAnnualPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      _SubscriptionPrice(price: priceString(PackageType.annual, ref));
}

class _SubscriptionPrice extends ConsumerWidget {
  const _SubscriptionPrice({
    this.price,
    Key? key,
  }) : super(key: key);

  final String? price;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textColor = ref.watch(purchasesThemeProvider.select(
      (theme) => theme.textColor,
    ));

    return Container(
      height: 65,
      padding: const EdgeInsets.only(
        bottom: 20,
        top: 15,
      ),
      child: price != null
          ? Text(
              price!,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                letterSpacing: -1,
                color: textColor,
              ),
              textAlign: TextAlign.center,
            )
          : const FormLoader(),
    );
  }
}
