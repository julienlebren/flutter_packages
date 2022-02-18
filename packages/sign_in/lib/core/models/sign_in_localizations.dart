part of '../../sign_in.dart';

@freezed
class SignInLocalizations with _$SignInLocalizations {
  const factory SignInLocalizations({
    @Default("Continue without registration") String signInAnonymously,
    @Default("Sign in with Google") String signInWithApple,
    @Default("Sign in with Apple") String signInWithGoogle,
    @Default("Sign in with Facebook") String signInWithFacebook,
    @Default("Sign in with e-mail") String signInWithEmail,
    @Default("Oops! Something went wrong...") String errorTitle,
    @Default("Sign-in with an email") String signInWithEmailTitle,
    @Default("No password required, we just send you an email with a link to log in to the app.")
        String signInWithEmailCaption,
    @Default("Check your email, we have sent a sign-in link.")
        String signInWithEmailSuccess,
    @Default("You did not receive it? Try again or try another identification method.")
        String signInWithEmailRetry,
    @Default("Email address") String signInWithEmailPlaceholder,
    @Default("Password") String signInWithEmailPasswordPlaceholder,
    @Default("Forgot your password?") String signInWithEmailForgotPassword,
    @Default("Not yet registered? Create an account.")
        String signInWithEmailCreateAccount,
    @Default("Continue") String continueButton,
    @Default("Phone Number") String signInPhoneTitle,
    @Default("We will send an SMS to confirm your number, it won't cost you nothing.")
        String signInPhoneSubtitle,
    @Default("Example:") String signInPhonePlaceholder,
    @Default("You may not need to enter the code as the app will attempt to detect it automatically.")
        String signInPhoneAutoRetrieve,
    @Default("Waiting for automatic code detection ...")
        String signInPhoneLoadingDialog,
    @Default("You must enter a mobile phone number.")
        String signInPhoneErrorMobile,
    @Default("Number verification") String signInVerificationTitle,
    /*@Default("Enter the 6-digit code we sent to {number}")
        Function(String number) signInVerificationSubtitle,
    @Default("Did not receive the code?\nWait {seconds} seconds...")
        Function(String seconds) signInVerificationNotReceived,*/
    @Default("Wrong number") String signInVerificationWrongNumber,
    @Default("Resend the code") String signInVerificationResend,
    @Default("Invalid verification code!") String signInVerificationInvalid,
    @Default("Country / Region") String signInCountriesTitle,
  }) = _SignInLocalizations;
}
