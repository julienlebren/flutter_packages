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
    @Default("Submit your email address to receive a sign-in link.")
        String signInWithEmailCaption,
    @Default("Check your email, we have sent a sign-in link.")
        String signInWithEmailSuccess,
    @Default("You did not receive it? Try again or try another identification method.")
        String signInWithEmailRetry,
    @Default("Adresse e-mail") String signInWithEmailPlaceholder,
    @Default("Continue") String continueButton,
  }) = _SignInLocalizations;
}
