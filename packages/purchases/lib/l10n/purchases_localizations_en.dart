import 'purchases_localizations.dart';

/// The translations for English (`en`).
class PurchasesLocalizationsEn extends PurchasesLocalizations {
  PurchasesLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get cupertinoDisclaimer => 'Payment will be charged to iTunes Account and subscription automatically renews unless auto-renew is turned off at least 24-hours before the end of the current period. Account will be charged for renewal within 24-hours prior to the end of the current period. Manage auto-renewal by going to the user\'s Account Settings.';

  @override
  String get errorTitle => 'Oops! Something went wrong...';

  @override
  String monthPrice(String price) {
    return '$price/month';
  }

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
  String sixMonthPrice(String price) {
    return '$price/6 months';
  }

  @override
  String threeMonthPrice(String price) {
    return '$price/3 months';
  }

  @override
  String twoMonthPrice(String price) {
    return '$price/2 months';
  }

  @override
  String weekPrice(String price) {
    return '$price/week';
  }

  @override
  String yearPrice(String price) {
    return '$price/year';
  }

  @override
  String get noSubscriptionToRestore => 'There is no active subscription to restore.';
}
