library subscription_service;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

part 'controllers/purchases_controller.dart';
part 'core/models/purchases_event.dart';
part 'core/models/purchases_settings.dart';
part 'core/models/purchases_state.dart';
part 'services/purchases_service.dart';
part 'purchases.freezed.dart';

final purchasesSettingsProvider = Provider<PurchasesSettings>(
  (_) => throw UnimplementedError(
      "You need to override purchasesSettingsProvider before calling subscriptionServiceProvider!"),
);

final purchasesServiceProvider = Provider<PurchasesService>(
  (ref) {
    final settings = ref.watch(purchasesSettingsProvider);
    return PurchasesService(settings: settings);
  },
  dependencies: [purchasesSettingsProvider],
);

final purchasesControllerProvider =
    StateNotifierProvider.autoDispose<PurchasesController, PurchasesState>(
        (ref) {
  final service = ref.watch(purchasesServiceProvider);
  return PurchasesController(service);
});
