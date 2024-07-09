part of '../../purchases.dart';

@freezed
class PurchasesState with _$PurchasesState {
  const factory PurchasesState({
    String? weeklyPrice,
    String? monthlyPrice,
    String? twoMonthPrice,
    String? threeMonthPrice,
    String? sixMonthPrice,
    String? annualPrice,
    int? annualDiscount,
    @Default(false) bool isReady,
    @Default(false) bool hasPackage,
    @Default(false) bool isPurchasing,
    @Default(false) bool isSuccess,
    String? errorText,
  }) = _PurchasesState;
}
