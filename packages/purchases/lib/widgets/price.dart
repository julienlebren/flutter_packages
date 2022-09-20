part of '../purchases.dart';

String priceString(
    PackageType type, String price, PurchasesLocalizations l10n) {
  switch (type) {
    case PackageType.annual:
      return l10n.annualPrice(price);
    case PackageType.sixMonth:
      return l10n.sixMonthPrice(price);
    case PackageType.threeMonth:
      return l10n.threeMonthPrice(price);
    case PackageType.twoMonth:
      return l10n.twoMonthPrice(price);
    case PackageType.monthly:
      return l10n.monthlyPrice(price);
    case PackageType.weekly:
      return l10n.weeklyPrice(price);
    default:
      return "";
  }
}

class SubscriptionWeeklyPrice extends ConsumerWidget {
  const SubscriptionWeeklyPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(purchasesLocalizationsProvider);
    final price = ref.watch(purchasesControllerProvider.select(
      (value) => value.weeklyPrice,
    ));
    return SubscriptionPrice(
        price: price != null ? l10n.weeklyPrice(price) : null);
  }
}

class SubscriptionMonthlyPrice extends ConsumerWidget {
  const SubscriptionMonthlyPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(purchasesLocalizationsProvider);
    final price = ref.watch(purchasesControllerProvider.select(
      (value) => value.monthlyPrice,
    ));
    return SubscriptionPrice(
        price: price != null ? l10n.monthlyPrice(price) : null);
  }
}

class SubscriptionTwoMonthPrice extends ConsumerWidget {
  const SubscriptionTwoMonthPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(purchasesLocalizationsProvider);
    final price = ref.watch(purchasesControllerProvider.select(
      (value) => value.twoMonthPrice,
    ));
    return SubscriptionPrice(
        price: price != null ? l10n.twoMonthPrice(price) : null);
  }
}

class SubscriptionThreeMonthPrice extends ConsumerWidget {
  const SubscriptionThreeMonthPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(purchasesLocalizationsProvider);
    final price = ref.watch(purchasesControllerProvider.select(
      (value) => value.threeMonthPrice,
    ));
    return SubscriptionPrice(
        price: price != null ? l10n.threeMonthPrice(price) : null);
  }
}

class SubscriptionSixMonthPrice extends ConsumerWidget {
  const SubscriptionSixMonthPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(purchasesLocalizationsProvider);
    final price = ref.watch(purchasesControllerProvider.select(
      (value) => value.sixMonthPrice,
    ));
    return SubscriptionPrice(
        price: price != null ? l10n.sixMonthPrice(price) : null);
  }
}

class SubscriptionAnnualPrice extends ConsumerWidget {
  const SubscriptionAnnualPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(purchasesLocalizationsProvider);
    final price = ref.watch(purchasesControllerProvider.select(
      (value) => value.annualPrice,
    ));
    return SubscriptionPrice(
        price: price != null ? l10n.annualPrice(price) : null);
  }
}

class SubscriptionPrice extends ConsumerWidget {
  const SubscriptionPrice({
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
