part of '../purchases.dart';

enum SubscriptionDuration { monthly, annual }

class PurchasesService {
  PurchasesService({
    required this.settings,
  });

  final PurchasesSettings settings;

  Package? monthlySubscription;
  Package? annualSubscription;

  Future<void> setup() async {
    if (Platform.isAndroid) {
      if (settings.publicGoogleKey == null) {
        throw UnimplementedError();
      }
      await Purchases.configure(
          PurchasesConfiguration(settings.publicGoogleKey!)
            ..appUserID = settings.userId
            ..observerMode = false);
    } else if (Platform.isIOS) {
      if (settings.publicAppleKey == null) {
        throw UnimplementedError();
      }
      await Purchases.configure(PurchasesConfiguration(settings.publicAppleKey!)
        ..appUserID = settings.userId
        ..observerMode = false);
    }
  }

  Future<void> fetchOfferings() async {
    //if (subscription != null) return;
    Offerings offerings = await Purchases.getOfferings();
    final offering = offerings.current;
    print(offering);
    /*if (offering != null) {
      if (offering.annual != null) {
        subscription = offering.annual!;
      }
    }*/
  }

  Future<void> purchase(SubscriptionDuration duration) async {
    /*if (subscription == null) return;
    CustomerInfo purchaserInfo = await Purchases.purchasePackage(subscription!);
    _processInfo(purchaserInfo);*/
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
