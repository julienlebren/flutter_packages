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
        hasPackage: true,
        //price: _service.subscription?.storeProduct.priceString,
      );
    } catch (e) {
      state = state.copyWith(errorText: e.toString());
    }
  }

  Future<void> _purchase({
    bool restore = false,
  }) async {
    state = state.copyWith(isPurchasing: true);
    try {
      if (restore) {
        await _service.restorePurchase();
      } else {
        //await _service.purchase();
      }
      state = state.copyWith(isSuccess: true);
    } on PlatformException catch (e) {
      if (PurchasesErrorHelper.getErrorCode(e) ==
          PurchasesErrorCode.purchaseCancelledError) {
        state = state.copyWith(
          isPurchasing: false,
        );
      } else {
        state = state.copyWith(
          isPurchasing: false,
          errorText: e.message,
        );
      }
    } catch (e) {
      state = state.copyWith(
        isPurchasing: false,
        errorText: e.toString(),
      );
    }
  }

  Future<void> _restorePurchases() => _purchase(restore: true);

  Future<void> _openOffers() async {
    await _service.openOffers();
  }
}
