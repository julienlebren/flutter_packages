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
  }) = _SignInLocalizations;
}
