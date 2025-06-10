part of '../purchases.dart';

class PurchasesService {
  PurchasesService({
    required this.settings,
  });

  final PurchasesSettings settings;

  Offering? subscription;

  Future<void> setup() async {
    if (Platform.isIOS) {
      if (settings.publicGoogleKey == null) {
        throw UnimplementedError();
      }
      await Purchases.configure(
          PurchasesConfiguration(settings.publicGoogleKey!)
            ..appUserID = settings.userId);
    } else if (Platform.isIOS) {
      if (settings.publicAppleKey == null) {
        throw UnimplementedError();
      }
      print("settings: ${settings}");
      await Purchases.configure(PurchasesConfiguration(settings.publicAppleKey!)
        ..appUserID = settings.userId);
    }
  }

  Future<void> fetchOfferings() async {
    print("fetchOfferings");
    if (subscription != null) return;
    Offerings offerings = await Purchases.getOfferings();
    print("offerings ${offerings}");
    final offering = offerings.current;
    if (offering != null) {
      subscription = offering;
    }
  }

  Future<void> purchaseWeekly() => _purchase(subscription?.weekly);

  Future<void> purchaseMonthly() => _purchase(subscription?.monthly);

  Future<void> purchaseTwoMonth() => _purchase(subscription?.twoMonth);

  Future<void> purchaseThreeMonth() => _purchase(subscription?.threeMonth);

  Future<void> purchaseSixMonth() => _purchase(subscription?.sixMonth);

  Future<void> purchaseAnnual() => _purchase(subscription?.annual);

  Future<void> _purchase(Package? package) async {
    if (package == null) return;
    CustomerInfo purchaserInfo = await Purchases.purchasePackage(package);
    _processInfo(purchaserInfo);
  }

  Future<void> refreshSubscription() async {
    CustomerInfo purchaserInfo = await Purchases.getCustomerInfo();
    _processInfo(purchaserInfo);
  }

  Future<void> restorePurchase() async {
    CustomerInfo purchaserInfo = await Purchases.restorePurchases();
    _processInfo(purchaserInfo);
  }

  Future<void> openOffers() async {
    await Purchases.presentCodeRedemptionSheet();
  }

  Future<void> _processInfo(CustomerInfo info) async {
    final entitlementInfo = info.entitlements.all[settings.entitlementId];
    if (entitlementInfo == null) return;

    final isSubscribed = entitlementInfo.isActive;
    DateTime? expirationDate = entitlementInfo.expirationDate != null
        ? DateTime.parse(entitlementInfo.expirationDate!)
        : null;

    settings.processHandler(isSubscribed, expirationDate);
  }
}
