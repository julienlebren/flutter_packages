import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'sign_in_localizations_en.dart';
import 'sign_in_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of SignInLocalizations
/// returned by `SignInLocalizations.of(context)`.
///
/// Applications need to include `SignInLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
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
/// be consistent with the languages listed in the SignInLocalizations.supportedLocales
/// property.
abstract class SignInLocalizations {
  SignInLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static SignInLocalizations? of(BuildContext context) {
    return Localizations.of<SignInLocalizations>(context, SignInLocalizations);
  }

  static const LocalizationsDelegate<SignInLocalizations> delegate =
      _SignInLocalizationsDelegate();

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

  /// No description provided for @emailResetTitle.
  ///
  /// In en, this message translates to:
  /// **'Forgot your password'**
  String get emailResetTitle;

  /// No description provided for @emailResetSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your email and we\'ll send you a link to reset your password.'**
  String get emailResetSubtitle;

  /// No description provided for @emailResetSubmitButton.
  ///
  /// In en, this message translates to:
  /// **'Reset your password'**
  String get emailResetSubmitButton;

  /// No description provided for @emailResetSuccessTitle.
  ///
  /// In en, this message translates to:
  /// **'Please check your email'**
  String get emailResetSuccessTitle;

  /// No description provided for @emailResetSuccessDescription.
  ///
  /// In en, this message translates to:
  /// **'We just sent a link at {email} to reset your password.'**
  String emailResetSuccessDescription(String email);

  /// No description provided for @errorTitle.
  ///
  /// In en, this message translates to:
  /// **'Oops! Something went wrong...'**
  String get errorTitle;

  /// No description provided for @passwordRequirements.
  ///
  /// In en, this message translates to:
  /// **'The password must meet the following conditions:'**
  String get passwordRequirements;

  /// No description provided for @passwordRequirementMinLength.
  ///
  /// In en, this message translates to:
  /// **'Aleast 6 characters'**
  String get passwordRequirementMinLength;

  /// No description provided for @passwordRequirementUppercase.
  ///
  /// In en, this message translates to:
  /// **'At least one capital letter'**
  String get passwordRequirementUppercase;

  /// No description provided for @passwordRequirementLowercase.
  ///
  /// In en, this message translates to:
  /// **'At least a lowercase'**
  String get passwordRequirementLowercase;

  /// No description provided for @passwordRequirementDigits.
  ///
  /// In en, this message translates to:
  /// **'At least one number'**
  String get passwordRequirementDigits;

  /// No description provided for @passwordRequirementSpecialChars.
  ///
  /// In en, this message translates to:
  /// **'At least one special character'**
  String get passwordRequirementSpecialChars;

  /// No description provided for @passwordRequirementMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords match'**
  String get passwordRequirementMatch;

  /// No description provided for @settingsAccountTitle.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get settingsAccountTitle;

  /// No description provided for @settingsCreateAccountButton.
  ///
  /// In en, this message translates to:
  /// **'Create an account'**
  String get settingsCreateAccountButton;

  /// No description provided for @settingsCreateAccountWith.
  ///
  /// In en, this message translates to:
  /// **'Create an account with {supplier}'**
  String settingsCreateAccountWith(String supplier);

  /// No description provided for @settingsNoAccount.
  ///
  /// In en, this message translates to:
  /// **'You are currently not logged in, your settings and other data are not saved and may be lost. Tap here to create an account.'**
  String get settingsNoAccount;

  /// No description provided for @settingsDeleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete account'**
  String get settingsDeleteTitle;

  /// No description provided for @settingsDeleteCaption.
  ///
  /// In en, this message translates to:
  /// **'Your account information, profile, and all data stored in the app will be deleted.'**
  String get settingsDeleteCaption;

  /// No description provided for @settingsDeleteButton.
  ///
  /// In en, this message translates to:
  /// **'Delete account'**
  String get settingsDeleteButton;

  /// No description provided for @settingsDeleteAlertTitle.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to continue ? This action is irreversible.'**
  String get settingsDeleteAlertTitle;

  /// No description provided for @settingsEmailSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Login information'**
  String get settingsEmailSectionTitle;

  /// No description provided for @settingsEmailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email address'**
  String get settingsEmailLabel;

  /// No description provided for @settingsEmailTitle.
  ///
  /// In en, this message translates to:
  /// **'Email address'**
  String get settingsEmailTitle;

  /// No description provided for @settingsEmailPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'New email address'**
  String get settingsEmailPlaceholder;

  /// No description provided for @settingsPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get settingsPasswordTitle;

  /// No description provided for @settingsPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get settingsPasswordLabel;

  /// No description provided for @settingsPasswordPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get settingsPasswordPlaceholder;

  /// No description provided for @settingsPasswordConfirmationPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get settingsPasswordConfirmationPlaceholder;

  /// No description provided for @settingsPasswordEdit.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get settingsPasswordEdit;

  /// No description provided for @settingsPasswordUndefinedCaption.
  ///
  /// In en, this message translates to:
  /// **'You haven\'t set a password yet, so you won\'t be able to log in to your account using your email address and password. Only login with third-party account will work.'**
  String get settingsPasswordUndefinedCaption;

  /// No description provided for @settingsThirdPartySectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Login with a third-party account'**
  String get settingsThirdPartySectionTitle;

  /// No description provided for @settingsThirdPartyConnected.
  ///
  /// In en, this message translates to:
  /// **'Connected'**
  String get settingsThirdPartyConnected;

  /// No description provided for @settingsThirdPartyNotConnected.
  ///
  /// In en, this message translates to:
  /// **'Not connected'**
  String get settingsThirdPartyNotConnected;

  /// No description provided for @settingsThirdPartyCaption.
  ///
  /// In en, this message translates to:
  /// **'You can combine several connection methods to secure access to your account.'**
  String get settingsThirdPartyCaption;

  /// No description provided for @settingsLogoutButton.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get settingsLogoutButton;

  /// No description provided for @settingsLogoutConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to logout?'**
  String get settingsLogoutConfirmation;

  /// No description provided for @settingsUndefined.
  ///
  /// In en, this message translates to:
  /// **'Not set'**
  String get settingsUndefined;

  /// No description provided for @signInAnonymously.
  ///
  /// In en, this message translates to:
  /// **'Continue without registration'**
  String get signInAnonymously;

  /// No description provided for @signInWith.
  ///
  /// In en, this message translates to:
  /// **'Continue with {supplier}'**
  String signInWith(String supplier);

  /// No description provided for @signInWithEmail.
  ///
  /// In en, this message translates to:
  /// **'e-mail'**
  String get signInWithEmail;

  /// No description provided for @signInWithEmailLink.
  ///
  /// In en, this message translates to:
  /// **'e-mail'**
  String get signInWithEmailLink;

  /// No description provided for @signInWithEmailLinkTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign in with e-mail'**
  String get signInWithEmailLinkTitle;

  /// No description provided for @signInWithEmailLinkSubtitle.
  ///
  /// In en, this message translates to:
  /// **'No password required, we just send you an email with a link to log in to the app.'**
  String get signInWithEmailLinkSubtitle;

  /// No description provided for @signInWithEmailLinkSuccess.
  ///
  /// In en, this message translates to:
  /// **'Check your email, we have sent a sign-in link.'**
  String get signInWithEmailLinkSuccess;

  /// No description provided for @signInWithEmailLinkRetry.
  ///
  /// In en, this message translates to:
  /// **'You did not receive it? Try again or try another identification method.'**
  String get signInWithEmailLinkRetry;

  /// No description provided for @signInWithEmailCreateAccount.
  ///
  /// In en, this message translates to:
  /// **'Not yet registered? Create an account here.'**
  String get signInWithEmailCreateAccount;

  /// No description provided for @signInWithEmailForgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot your password?'**
  String get signInWithEmailForgotPassword;

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

  /// No description provided for @signInWithEmailAlreadyAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? Sign in here.'**
  String get signInWithEmailAlreadyAccount;

  /// No description provided for @signInWithEmailRegisterButton.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get signInWithEmailRegisterButton;

  /// No description provided for @signInWithEmailRegisterTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign up with e-mail'**
  String get signInWithEmailRegisterTitle;

  /// No description provided for @signInWithEmailTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign in with e-mail'**
  String get signInWithEmailTitle;

  /// No description provided for @signInWithEmailSubtitle.
  ///
  /// In en, this message translates to:
  /// **'No password required, we just send you an email with a link to log in to the app.'**
  String get signInWithEmailSubtitle;

  /// No description provided for @signInWithEmailInvalidPasswordConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get signInWithEmailInvalidPasswordConfirmation;

  /// No description provided for @signInWithPhone.
  ///
  /// In en, this message translates to:
  /// **'phone number'**
  String get signInWithPhone;

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

  /// No description provided for @errorExpiredActionCode.
  ///
  /// In en, this message translates to:
  /// **'This link is no longer valid.'**
  String get errorExpiredActionCode;

  /// No description provided for @errorInvalidEmail.
  ///
  /// In en, this message translates to:
  /// **'This email address is not valid.'**
  String get errorInvalidEmail;

  /// No description provided for @errorInvalidVerificationCode.
  ///
  /// In en, this message translates to:
  /// **'Invalid verification code!'**
  String get errorInvalidVerificationCode;

  /// No description provided for @errorUserDisabled.
  ///
  /// In en, this message translates to:
  /// **'This account has been disabled.'**
  String get errorUserDisabled;

  /// No description provided for @errorUserNotFound.
  ///
  /// In en, this message translates to:
  /// **'There is no account registered with this email address.'**
  String get errorUserNotFound;

  /// No description provided for @errorWrongPassword.
  ///
  /// In en, this message translates to:
  /// **'Wrong password.'**
  String get errorWrongPassword;

  /// No description provided for @errorEmailAlreadyInUse.
  ///
  /// In en, this message translates to:
  /// **'An account is already registered with this email address.'**
  String get errorEmailAlreadyInUse;

  /// No description provided for @errorCredentialAlreadyInUse.
  ///
  /// In en, this message translates to:
  /// **'An account is already linked to this {provider} account.'**
  String errorCredentialAlreadyInUse(String provider);

  /// No description provided for @errorWeakPassword.
  ///
  /// In en, this message translates to:
  /// **'This password is not strong enough.'**
  String get errorWeakPassword;

  /// No description provided for @errorOperationNotAllowed.
  ///
  /// In en, this message translates to:
  /// **'This operation is not allowed.'**
  String get errorOperationNotAllowed;

  /// No description provided for @errorPhoneNotMobile.
  ///
  /// In en, this message translates to:
  /// **'You must enter a mobile phone number.'**
  String get errorPhoneNotMobile;

  /// No description provided for @errorUnknown.
  ///
  /// In en, this message translates to:
  /// **'An unknown error has occurred.'**
  String get errorUnknown;

  /// No description provided for @unlinkTitle.
  ///
  /// In en, this message translates to:
  /// **'What do you want to do?'**
  String get unlinkTitle;

  /// No description provided for @unlinkProvider.
  ///
  /// In en, this message translates to:
  /// **'Disconnect {provider}'**
  String unlinkProvider(String provider);
}

class _SignInLocalizationsDelegate
    extends LocalizationsDelegate<SignInLocalizations> {
  const _SignInLocalizationsDelegate();

  @override
  Future<SignInLocalizations> load(Locale locale) {
    return SynchronousFuture<SignInLocalizations>(
        lookupSignInLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_SignInLocalizationsDelegate old) => false;
}

SignInLocalizations lookupSignInLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return SignInLocalizationsEn();
    case 'fr':
      return SignInLocalizationsFr();
  }

  throw FlutterError(
      'SignInLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
