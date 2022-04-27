part of '../purchases.dart';

class PurchasesService {
  PurchasesService({
    required this.settings,
  });

  final PurchasesSettings settings;

  Package? subscription;

  Future<void> setup() async {
    if (Platform.isAndroid) {
      if (settings.publicGoogleKey == null) {
        throw UnimplementedError();
      }
      await Purchases.setup(settings.publicGoogleKey!);
    } else if (Platform.isIOS) {
      if (settings.publicAppleKey == null) {
        throw UnimplementedError();
      }
      await Purchases.setup(settings.publicAppleKey!);
    }
  }

  Future<void> fetchOfferings() async {
    if (subscription != null) return;
    Offerings offerings = await Purchases.getOfferings();
    final offering = offerings.current;
    if (offering != null) {
      if (offering.annual != null) {
        subscription = offering.annual!;
      }
    }
  }

  Future<void> purchase() async {
    if (subscription == null) return;
    PurchaserInfo purchaserInfo =
        await Purchases.purchasePackage(subscription!);
    _processInfo(purchaserInfo);
  }

  Future<void> refreshSubscription() async {
    PurchaserInfo purchaserInfo = await Purchases.getPurchaserInfo();
    _processInfo(purchaserInfo);
  }

  Future<void> restorePurchase() async {
    PurchaserInfo purchaserInfo = await Purchases.restoreTransactions();
    _processInfo(purchaserInfo);
  }

  Future<void> openOffers() async {
    await Purchases.presentCodeRedemptionSheet();
  }

  Future<void> _processInfo(PurchaserInfo info) async {
    final entitlementInfo = info.entitlements.all[settings.entitlementId];
    if (entitlementInfo == null) return;

    final isSubscribed = entitlementInfo.isActive;
    DateTime? expirationDate = entitlementInfo.expirationDate != null
        ? DateTime.parse(entitlementInfo.expirationDate!)
        : null;

    settings.processHandler(isSubscribed, expirationDate);
  }
}
