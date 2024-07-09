part of '../../purchases.dart';

@freezed
class PurchasesEvent with _$PurchasesEvent {
  const factory PurchasesEvent.fetchOfferings() = _FetchOfferings;
  const factory PurchasesEvent.purchase(PackageType type) = _Purchase;
  const factory PurchasesEvent.restorePurchases() = _RestorePurchases;
  const factory PurchasesEvent.openOffers() = _OpenOffers;
}
