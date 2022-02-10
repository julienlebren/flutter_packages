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
  }) = _SignInLocalizations;
}
