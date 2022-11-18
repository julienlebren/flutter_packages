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
      restorePurchases: _restorePurchases,
      openOffers: _openOffers,
      purchase: _purchase,
    );
  }

  Future<void> _fetchOfferings() async {
    try {
      await _service.fetchOfferings();

      int? annualDiscount;
      if (_service.subscription?.annual?.storeProduct.price != null &&
          _service.subscription?.monthly?.storeProduct.price != null) {
        annualDiscount = ((1 -
                    (_service.subscription!.annual!.storeProduct.price /
                        (_service.subscription!.monthly!.storeProduct.price *
                            12))) *
                100)
            .ceil();
      }

      state = state.copyWith(
        isReady: true,
        hasPackage: _service.subscription != null,
        monthlyPrice: _service.subscription?.monthly?.storeProduct.priceString,
        twoMonthPrice:
            _service.subscription?.twoMonth?.storeProduct.priceString,
        threeMonthPrice:
            _service.subscription?.threeMonth?.storeProduct.priceString,
        sixMonthPrice:
            _service.subscription?.sixMonth?.storeProduct.priceString,
        annualPrice: _service.subscription?.annual?.storeProduct.priceString,
        annualDiscount: annualDiscount,
      );
    } catch (e) {
      state = state.copyWith(
        isReady: true,
        errorText: e.toString(),
      );
    }
  }

  Future<void> _purchase([PackageType? type]) async {
    state = state.copyWith(isPurchasing: true);
    try {
      if (type == null) {
        await _service.restorePurchase();
      } else if (type == PackageType.weekly) {
        await _service.purchaseWeekly();
      } else if (type == PackageType.monthly) {
        await _service.purchaseMonthly();
      } else if (type == PackageType.twoMonth) {
        await _service.purchaseTwoMonth();
      } else if (type == PackageType.threeMonth) {
        await _service.purchaseThreeMonth();
      } else if (type == PackageType.sixMonth) {
        await _service.purchaseSixMonth();
      } else if (type == PackageType.annual) {
        await _service.purchaseAnnual();
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

  Future<void> _restorePurchases() => _purchase();

  Future<void> _openOffers() async {
    await _service.openOffers();
  }
}
