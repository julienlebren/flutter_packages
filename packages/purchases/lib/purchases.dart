library subscription_service;

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:layout_builder/layout_builder.dart';
import 'package:localization/localization.dart';
import 'package:purchases/l10n/purchases_localizations.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

part 'controllers/purchases_controller.dart';
part 'core/models/purchases_event.dart';
part 'core/models/purchases_settings.dart';
part 'core/models/purchases_state.dart';
part 'services/purchases_service.dart';
part 'widgets/cupertino_disclaimer.dart';
part 'widgets/buttons.dart';
part 'widgets/issue.dart';
part 'purchases.freezed.dart';

const googlePlayURL = "https://play.google.com/store/account/subscriptions";
const appStoreURL = "https://apps.apple.com/account/subscriptions";

final purchasesSettingsProvider = Provider<PurchasesSettings>(
  (_) => throw UnimplementedError(
    "You need to override purchasesSettingsProvider before calling purchasesServiceProvider!",
  ),
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
}, dependencies: [purchasesServiceProvider]);

final purchasesLocalizationsProvider = Provider<PurchasesLocalizations>(
  (ref) {
    final locale = ref.watch(localeProvider);
    return lookupPurchasesLocalizations(locale);
  },
  dependencies: [localeProvider],
);
