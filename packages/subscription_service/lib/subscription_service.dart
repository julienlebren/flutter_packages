library subscription_service;

import 'package:purchases_flutter/purchases_flutter.dart';

class SubscriptionService {
  SubscriptionService({
    required this.purchasesApiKey,
    required this.entitlementId,
    required this.userId,
    required this.processHandler,
  });

  final String purchasesApiKey;
  final String entitlementId;
  final String userId;

  final Function(
    bool isSubscribed,
    DateTime? expirationDate,
  ) processHandler;

  Package? subscription;

  Future<void> setup() async {
    await Purchases.setup(
      purchasesApiKey,
      appUserId: userId,
      observerMode: false,
    );
  }

  Future<void> fetchOfferings() async {
    if (subscription != null) return;
    Offerings offerings = await Purchases.getOfferings();
    print("offerings: $offerings");
    final offering = offerings.current;
    if (offering != null) {
      if (offering.annual != null) {
        subscription = offering.annual!;
        print("subscription: $subscription");
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
    final entitlementInfo = info.entitlements.all[entitlementId];
    if (entitlementInfo == null) return;

    final isSubscribed = entitlementInfo.isActive;
    DateTime? expirationDate = entitlementInfo.expirationDate != null
        ? DateTime.parse(entitlementInfo.expirationDate!)
        : null;

    processHandler(isSubscribed, expirationDate);
  }
}
