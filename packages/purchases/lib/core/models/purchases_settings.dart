part of '../../purchases.dart';

@freezed
class PurchasesSettings with _$PurchasesSettings {
  @Assert('publicGoogleKey != null || publicAppleKey != null',
      'At least one public key is required')
  factory PurchasesSettings({
    String? publicGoogleKey,
    String? publicAppleKey,
    required String entitlementId,
    required String userId,
    required Function(
      bool isSubscribed,
      DateTime? expirationDate,
    )
        processHandler,
  }) = _PurchasesSettings;
}
