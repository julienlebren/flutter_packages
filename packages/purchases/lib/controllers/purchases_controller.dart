part of '../purchases.dart';

class PurchasesController extends StateNotifier<PurchasesState> {
  PurchasesController(
    this._service,
  ) : super(const PurchasesState()) {
    _fetchOfferings();
  }

  final PurchasesService _service;

  void handleEvent(PurchasesEvent event) {
    event.when(
      fetchOfferings: _fetchOfferings,
      purchase: _purchase,
      restorePurchases: _restorePurchases,
      openOffers: _openOffers,
    );
  }

  Future<void> _fetchOfferings() async {
    try {
      await _service.fetchOfferings();
      state = state.copyWith(
        isReady: true, //_service.subscription != null,
        price: _service.subscription?.product.priceString,
      );
    } catch (e) {
      state = state.copyWith(errorText: e.toString());
    }
  }

  Future<void> _purchase() async {
    state = state.copyWith(isLoading: true);
    try {
      await _service.purchase();
      state = state.copyWith(isSuccess: true);
    } on PlatformException catch (e) {
      if (PurchasesErrorHelper.getErrorCode(e) ==
          PurchasesErrorCode.purchaseCancelledError) {
        state = state.copyWith(
          isLoading: false,
        );
      } else {
        state = state.copyWith(
          isLoading: false,
          errorText: e.toString(),
        );
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorText: e.toString(),
      );
    }
  }

  Future<void> _restorePurchases() async {
    state = state.copyWith(isLoading: true);
    try {
      await _service.purchase();
      state = state.copyWith(isSuccess: true);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorText: e.toString(),
      );
    }
  }

  Future<void> _openOffers() async {
    await _service.openOffers();
  }
}
