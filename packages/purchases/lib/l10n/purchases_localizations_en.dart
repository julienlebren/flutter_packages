


import 'purchases_localizations.dart';

/// The translations for English (`en`).
class PurchasesLocalizationsEn extends PurchasesLocalizations {
  PurchasesLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get cupertinoDisclaimer => 'Payment will be charged to iTunes Account and subscription automatically renews unless auto-renew is turned off at least 24-hours before the end of the current period. Account will be charged for renewal within 24-hours prior to the end of the current period. Manage auto-renewal by going to the user\'s Account Settings.';

  @override
  String get priceNotLoaded => 'Unable to contact Store at the moment.';

  @override
  String get privacyPolicyButton => 'Privacy policy';

  @override
  String get restoreButton => 'Restore purchases';

  @override
  String get retryButton => 'Retry';

  @override
  String get termsButton => 'Terms of Use';

  @override
  String yearPrice(String price) {
    return '$price/year';
  }
}
