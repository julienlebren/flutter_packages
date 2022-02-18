
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'sign_in_localizations_en.dart';

/// Callers can lookup localized strings with an instance of SignInLocalizations returned
/// by `SignInLocalizations.of(context)`.
///
/// Applications need to include `SignInLocalizations.delegate()` in their app's
/// localizationDelegates list, and the locales they support in the app's
/// supportedLocales list. For example:
///
/// ```
/// import 'l10n/sign_in_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: SignInLocalizations.localizationsDelegates,
///   supportedLocales: SignInLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # rest of dependencies
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
/// be consistent with the languages listed in the SignInLocalizations.supportedLocales
/// property.
abstract class SignInLocalizations {
  SignInLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static SignInLocalizations? of(BuildContext context) {
    return Localizations.of<SignInLocalizations>(context, SignInLocalizations);
  }

  static const LocalizationsDelegate<SignInLocalizations> delegate = _SignInLocalizationsDelegate();

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
    Locale('en')
  ];

  /// No description provided for @continueButton.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// No description provided for @countriesTitle.
  ///
  /// In en, this message translates to:
  /// **'Country / Region'**
  String get countriesTitle;

  /// No description provided for @errorTitle.
  ///
  /// In en, this message translates to:
  /// **'Oops! Something went wrong...'**
  String get errorTitle;

  /// No description provided for @signInAnonymously.
  ///
  /// In en, this message translates to:
  /// **'Continue without registration'**
  String get signInAnonymously;

  /// No description provided for @signInWithApple.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Apple'**
  String get signInWithApple;

  /// No description provided for @signInWithEmail.
  ///
  /// In en, this message translates to:
  /// **'Sign in with e-mail'**
  String get signInWithEmail;

  /// No description provided for @signInWithEmailCreateAccount.
  ///
  /// In en, this message translates to:
  /// **'Not yet registered? Create an account.'**
  String get signInWithEmailCreateAccount;

  /// No description provided for @signInWithEmailLinkCaption.
  ///
  /// In en, this message translates to:
  /// **'No password required, we just send you an email with a link to log in to the app.'**
  String get signInWithEmailLinkCaption;

  /// No description provided for @signInWithEmailLinkSuccess.
  ///
  /// In en, this message translates to:
  /// **'Check your email, we have sent a sign-in link.'**
  String get signInWithEmailLinkSuccess;

  /// No description provided for @signInWithEmailPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Email address'**
  String get signInWithEmailPlaceholder;

  /// No description provided for @signInWithEmailPasswordPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get signInWithEmailPasswordPlaceholder;

  /// No description provided for @signInWithEmailForgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot your password?'**
  String get signInWithEmailForgotPassword;

  /// No description provided for @signInWithEmailRetry.
  ///
  /// In en, this message translates to:
  /// **'You did not receive it? Try again or try another identification method.'**
  String get signInWithEmailRetry;

  /// No description provided for @signInWithEmailTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign-in with an email'**
  String get signInWithEmailTitle;

  /// No description provided for @signInWithFacebook.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Facebook'**
  String get signInWithFacebook;

  /// No description provided for @signInWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Google'**
  String get signInWithGoogle;

  /// No description provided for @signInPhoneTitle.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get signInPhoneTitle;

  /// No description provided for @signInPhoneSubtitle.
  ///
  /// In en, this message translates to:
  /// **'We will send an SMS to confirm your number, it won\'t cost you nothing.'**
  String get signInPhoneSubtitle;

  /// No description provided for @signInPhonePlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Example: {example}'**
  String signInPhonePlaceholder(String example);

  /// No description provided for @signInPhoneAutoRetrieve.
  ///
  /// In en, this message translates to:
  /// **'You may not need to enter the code as the app will attempt to detect it automatically.'**
  String get signInPhoneAutoRetrieve;

  /// No description provided for @signInPhoneLoadingDialog.
  ///
  /// In en, this message translates to:
  /// **'Waiting for automatic code detection ...'**
  String get signInPhoneLoadingDialog;

  /// No description provided for @signInPhoneErrorMobile.
  ///
  /// In en, this message translates to:
  /// **'You must enter a mobile phone number.'**
  String get signInPhoneErrorMobile;

  /// No description provided for @signInVerificationTitle.
  ///
  /// In en, this message translates to:
  /// **'Number verification'**
  String get signInVerificationTitle;

  /// No description provided for @signInVerificationSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter the 6-digit code we sent to {phoneNumber}'**
  String signInVerificationSubtitle(String phoneNumber);

  /// No description provided for @signInVerificationWrongNumber.
  ///
  /// In en, this message translates to:
  /// **'Wrong number'**
  String get signInVerificationWrongNumber;

  /// No description provided for @signInVerificationNotReceived.
  ///
  /// In en, this message translates to:
  /// **'Did not receive the code?\nWait {seconds} seconds...'**
  String signInVerificationNotReceived(String seconds);

  /// No description provided for @signInVerificationResend.
  ///
  /// In en, this message translates to:
  /// **'Resend the code'**
  String get signInVerificationResend;

  /// No description provided for @signInVerificationInvalid.
  ///
  /// In en, this message translates to:
  /// **'Invalid verification code!'**
  String get signInVerificationInvalid;
}

class _SignInLocalizationsDelegate extends LocalizationsDelegate<SignInLocalizations> {
  const _SignInLocalizationsDelegate();

  @override
  Future<SignInLocalizations> load(Locale locale) {
    return SynchronousFuture<SignInLocalizations>(lookupSignInLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_SignInLocalizationsDelegate old) => false;
}

SignInLocalizations lookupSignInLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return SignInLocalizationsEn();
  }

  throw FlutterError(
    'SignInLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
