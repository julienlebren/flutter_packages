part of '../../purchases.dart';

@freezed
class PurchasesState with _$PurchasesState {
  const factory PurchasesState({
    String? price,
    @Default(false) bool isReady,
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    String? errorText,
  }) = _PurchasesState;
}
