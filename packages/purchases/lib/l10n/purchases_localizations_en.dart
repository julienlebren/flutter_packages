


import 'purchases_localizations.dart';

/// The translations for English (`en`).
class PurchasesLocalizationsEn extends PurchasesLocalizations {
  PurchasesLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String subscriptionYearPrice(String price) {
    return '$price/year';
  }

  @override
  String get subscriptionCupertinoCaption => 'Payment will be charged to iTunes Account and subscription automatically renews unless auto-renew is turned off at least 24-hours before the end of the current period. Account will be charged for renewal within 24-hours prior to the end of the current period. Manage auto-renewal by going to the user\'s Account Settings.';

  @override
  String get subscriptionPrivacyPolicyButton => 'Privacy policy';

  @override
  String get subscriptionTermsButton => 'Terms of Use';

  @override
  String get subscriptionRestoreButton => 'Restore purchases';

  @override
  String get subscriptionRetryButton => 'Retry';
}
