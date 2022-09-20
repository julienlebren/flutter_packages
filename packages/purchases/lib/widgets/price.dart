part of '../purchases.dart';

String priceString(
    PackageType type, String price, PurchasesLocalizations l10n) {
  switch (type) {
    case PackageType.annual:
      return l10n.yearPrice(price);
    case PackageType.sixMonth:
      return l10n.sixMonthPrice(price);
    case PackageType.threeMonth:
      return l10n.threeMonthPrice(price);
    case PackageType.twoMonth:
      return l10n.twoMonthPrice(price);
    case PackageType.monthly:
      return l10n.monthPrice(price);
    case PackageType.weekly:
      return l10n.weekPrice(price);
    default:
      return "";
  }
}

class SubscriptionYearPrice extends StatelessWidget {
  const SubscriptionYearPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SubscriptionPrice(type: PackageType.annual);
  }
}

class SubscriptionMonthlyPrice extends StatelessWidget {
  const SubscriptionMonthlyPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SubscriptionPrice(type: PackageType.monthly);
  }
}

class SubscriptionThreeMonthPrice extends StatelessWidget {
  const SubscriptionThreeMonthPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SubscriptionPrice(type: PackageType.threeMonth);
  }
}

class SubscriptionTwoMonthPrice extends StatelessWidget {
  const SubscriptionTwoMonthPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SubscriptionPrice(type: PackageType.twoMonth);
  }
}

class SubscriptionSixMonthPrice extends StatelessWidget {
  const SubscriptionSixMonthPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SubscriptionPrice(type: PackageType.sixMonth);
  }
}

class SubscriptionWeeklyPrice extends StatelessWidget {
  const SubscriptionWeeklyPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SubscriptionPrice(type: PackageType.weekly);
  }
}

class SubscriptionPrice extends ConsumerWidget {
  const SubscriptionPrice({
    required this.type,
    Key? key,
  }) : super(key: key);

  final PackageType type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(purchasesLocalizationsProvider);
    final price = ref.watch(purchasesControllerProvider).price;
    final theme = ref.watch(purchasesThemeProvider);

    return Container(
      height: 65,
      padding: const EdgeInsets.only(
        bottom: 20,
        top: 15,
      ),
      child: price != null
          ? Text(
              priceString(type, price, l10n),
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                letterSpacing: -1,
                color: theme.textColor,
              ),
              textAlign: TextAlign.center,
            )
          : const FormLoader(),
    );
  }
}
