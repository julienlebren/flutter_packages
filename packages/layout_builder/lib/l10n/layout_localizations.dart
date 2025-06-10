import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'layout_localizations_en.dart';
import 'layout_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of LayoutLocalizations
/// returned by `LayoutLocalizations.of(context)`.
///
/// Applications need to include `LayoutLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/layout_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: LayoutLocalizations.localizationsDelegates,
///   supportedLocales: LayoutLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the LayoutLocalizations.supportedLocales
/// property.
abstract class LayoutLocalizations {
  LayoutLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static LayoutLocalizations? of(BuildContext context) {
    return Localizations.of<LayoutLocalizations>(context, LayoutLocalizations);
  }

  static const LocalizationsDelegate<LayoutLocalizations> delegate =
      _LayoutLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
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

  /// No description provided for @dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// No description provided for @light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// No description provided for @system.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get system;

  /// No description provided for @errorTitle.
  ///
  /// In en, this message translates to:
  /// **'Oops! Something went wrong...'**
  String get errorTitle;

  /// No description provided for @errorDescription.
  ///
  /// In en, this message translates to:
  /// **'We are unable to handle your request at the moment.'**
  String get errorDescription;

  /// No description provided for @networkErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'You are currently not connected to the internet'**
  String get networkErrorTitle;

  /// No description provided for @networkErrorCaption.
  ///
  /// In en, this message translates to:
  /// **'The app requires an internet connection to work, please check your connection settings'**
  String get networkErrorCaption;

  /// No description provided for @networkErrorWaiting.
  ///
  /// In en, this message translates to:
  /// **'Waiting for connection...'**
  String get networkErrorWaiting;
}

class _LayoutLocalizationsDelegate
    extends LocalizationsDelegate<LayoutLocalizations> {
  const _LayoutLocalizationsDelegate();

  @override
  Future<LayoutLocalizations> load(Locale locale) {
    return SynchronousFuture<LayoutLocalizations>(
        lookupLayoutLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_LayoutLocalizationsDelegate old) => false;
}

LayoutLocalizations lookupLayoutLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return LayoutLocalizationsEn();
    case 'fr':
      return LayoutLocalizationsFr();
  }

  throw FlutterError(
      'LayoutLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
