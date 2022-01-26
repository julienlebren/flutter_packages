part of '../../purchases.dart';

@freezed
class PurchasesSettings with _$PurchasesSettings {
  factory PurchasesSettings({
    required String purchasesApiKey,
    required String entitlementId,
    required String userId,
    required Function(
      bool isSubscribed,
      DateTime? expirationDate,
    )
        processHandler,
  }) = _PurchasesSettings;
}
