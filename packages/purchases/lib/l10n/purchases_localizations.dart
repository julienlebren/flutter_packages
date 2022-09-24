import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'purchases_localizations_en.dart';
import 'purchases_localizations_fr.dart';

/// Callers can lookup localized strings with an instance of PurchasesLocalizations
/// returned by `PurchasesLocalizations.of(context)`.
///
/// Applications need to include `PurchasesLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/purchases_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: PurchasesLocalizations.localizationsDelegates,
///   supportedLocales: PurchasesLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the PurchasesLocalizations.supportedLocales
/// property.
abstract class PurchasesLocalizations {
  PurchasesLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static PurchasesLocalizations? of(BuildContext context) {
    return Localizations.of<PurchasesLocalizations>(context, PurchasesLocalizations);
  }

  static const LocalizationsDelegate<PurchasesLocalizations> delegate = _PurchasesLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('fr')
  ];

  /// No description provided for @annualCaption.
  ///
  /// In en, this message translates to:
  /// **'Annual subscription'**
  String get annualCaption;

  /// No description provided for @annualPrice.
  ///
  /// In en, this message translates to:
  /// **'{price}/year'**
  String annualPrice(String price);

  /// No description provided for @closeAlertTitle.
  ///
  /// In en, this message translates to:
  /// **'A purchase is currently in progress, are you sure you want to leave now?'**
  String get closeAlertTitle;

  /// No description provided for @closeAlertCloseButton.
  ///
  /// In en, this message translates to:
  /// **'Yes, leave this view'**
  String get closeAlertCloseButton;

  /// No description provided for @closeAlertCancelButton.
  ///
  /// In en, this message translates to:
  /// **'No, wait for the end of the purchase'**
  String get closeAlertCancelButton;

  /// No description provided for @cupertinoDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'Payment will be charged to iTunes Account and subscription automatically renews unless auto-renew is turned off at least 24-hours before the end of the current period. Account will be charged for renewal within 24-hours prior to the end of the current period. Manage auto-renewal by going to the user\'s Account Settings.'**
  String get cupertinoDisclaimer;

  /// No description provided for @errorTitle.
  ///
  /// In en, this message translates to:
  /// **'Oops! Something went wrong...'**
  String get errorTitle;

  /// No description provided for @monthlyCaption.
  ///
  /// In en, this message translates to:
  /// **'Monthly subscription'**
  String get monthlyCaption;

  /// No description provided for @monthlyPrice.
  ///
  /// In en, this message translates to:
  /// **'{price}/month'**
  String monthlyPrice(String price);

  /// No description provided for @priceNotLoaded.
  ///
  /// In en, this message translates to:
  /// **'Unable to contact Store at the moment.'**
  String get priceNotLoaded;

  /// No description provided for @privacyPolicyButton.
  ///
  /// In en, this message translates to:
  /// **'Privacy policy'**
  String get privacyPolicyButton;

  /// No description provided for @purchaseInProgress.
  ///
  /// In en, this message translates to:
  /// **'Purchase in progress, please wait...'**
  String get purchaseInProgress;

  /// No description provided for @restoreButton.
  ///
  /// In en, this message translates to:
  /// **'Restore purchases'**
  String get restoreButton;

  /// No description provided for @retryButton.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retryButton;

  /// No description provided for @termsButton.
  ///
  /// In en, this message translates to:
  /// **'Terms of Use'**
  String get termsButton;

  /// No description provided for @sixMonthCaption.
  ///
  /// In en, this message translates to:
  /// **'6 months subscription'**
  String get sixMonthCaption;

  /// No description provided for @sixMonthPrice.
  ///
  /// In en, this message translates to:
  /// **'{price}/6 months'**
  String sixMonthPrice(String price);

  /// No description provided for @threeMonthCaption.
  ///
  /// In en, this message translates to:
  /// **'3 months subscription'**
  String get threeMonthCaption;

  /// No description provided for @threeMonthPrice.
  ///
  /// In en, this message translates to:
  /// **'{price}/3 months'**
  String threeMonthPrice(String price);

  /// No description provided for @twoMonthCaption.
  ///
  /// In en, this message translates to:
  /// **'2 months subscription'**
  String get twoMonthCaption;

  /// No description provided for @twoMonthPrice.
  ///
  /// In en, this message translates to:
  /// **'{price}/2 months'**
  String twoMonthPrice(String price);

  /// No description provided for @weeklyCaption.
  ///
  /// In en, this message translates to:
  /// **'Weekly subscription'**
  String get weeklyCaption;

  /// No description provided for @weeklyPrice.
  ///
  /// In en, this message translates to:
  /// **'{price}/week'**
  String weeklyPrice(String price);

  /// No description provided for @noSubscriptionToRestore.
  ///
  /// In en, this message translates to:
  /// **'There is no active subscription to restore.'**
  String get noSubscriptionToRestore;
}

class _PurchasesLocalizationsDelegate extends LocalizationsDelegate<PurchasesLocalizations> {
  const _PurchasesLocalizationsDelegate();

  @override
  Future<PurchasesLocalizations> load(Locale locale) {
    return SynchronousFuture<PurchasesLocalizations>(lookupPurchasesLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_PurchasesLocalizationsDelegate old) => false;
}

PurchasesLocalizations lookupPurchasesLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return PurchasesLocalizationsEn();
    case 'fr': return PurchasesLocalizationsFr();
  }

  throw FlutterError(
    'PurchasesLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
