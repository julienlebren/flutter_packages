


import 'sign_in_localizations.dart';

/// The translations for English (`en`).
class SignInLocalizationsEn extends SignInLocalizations {
  SignInLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get continueButton => 'Continue';

  @override
  String get countriesTitle => 'Country / Region';

  @override
  String get errorTitle => 'Oops! Something went wrong...';

  @override
  String get signInAnonymously => 'Continue without registration';

  @override
  String get signInWithApple => 'Sign in with Apple';

  @override
  String get signInWithEmail => 'Sign in with e-mail';

  @override
  String get signInWithEmailCreateAccount => 'Not yet registered? Create an account.';

  @override
  String get signInWithEmailLinkCaption => 'No password required, we just send you an email with a link to log in to the app.';

  @override
  String get signInWithEmailLinkSuccess => 'Check your email, we have sent a sign-in link.';

  @override
  String get signInWithEmailPlaceholder => 'Email address';

  @override
  String get signInWithEmailPasswordPlaceholder => 'Password';

  @override
  String get signInWithEmailForgotPassword => 'Forgot your password?';

  @override
  String get signInWithEmailRetry => 'You did not receive it? Try again or try another identification method.';

  @override
  String get signInWithEmailTitle => 'Sign-in with an email';

  @override
  String get signInWithFacebook => 'Sign in with Facebook';

  @override
  String get signInWithGoogle => 'Sign in with Google';

  @override
  String get signInPhoneTitle => 'Phone Number';

  @override
  String get signInPhoneSubtitle => 'We will send an SMS to confirm your number, it won\'t cost you nothing.';

  @override
  String signInPhonePlaceholder(String example) {
    return 'Example: $example';
  }

  @override
  String get signInPhoneAutoRetrieve => 'You may not need to enter the code as the app will attempt to detect it automatically.';

  @override
  String get signInPhoneLoadingDialog => 'Waiting for automatic code detection ...';

  @override
  String get signInPhoneErrorMobile => 'You must enter a mobile phone number.';

  @override
  String get signInVerificationTitle => 'Number verification';

  @override
  String signInVerificationSubtitle(String phoneNumber) {
    return 'Enter the 6-digit code we sent to $phoneNumber';
  }

  @override
  String get signInVerificationWrongNumber => 'Wrong number';

  @override
  String signInVerificationNotReceived(String seconds) {
    return 'Did not receive the code?\nWait $seconds seconds...';
  }

  @override
  String get signInVerificationResend => 'Resend the code';

  @override
  String get signInVerificationInvalid => 'Invalid verification code!';
}
