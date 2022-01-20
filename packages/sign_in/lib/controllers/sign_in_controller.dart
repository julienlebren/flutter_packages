part of '../sign_in.dart';

class SignInController extends StateNotifier<SignInState> {
  SignInController(this._service) : super(const SignInState.initial());

  final FirebaseAuthService _service;

  Future<void> handleEvent(SignInEvent event) async {
    state = const SignInState.loading();
    try {
      await event.when(
        signInWithApple: _service.signInWithApple,
        signInWithFacebook: _service.signInWithFacebook,
        signInWithGoogle: _service.signInWithGoogle,
        signInAnonymously: _service.signInAnonymously,
        signOut: _service.signOut,
      );
      state = const SignInState.initial();
    } on FirebaseAuthException catch (e) {
      if (e.code == "ERROR_AUTHORIZATION_DENIED") {
        state = const SignInState.initial();
      } else if (e.code != "ERROR_ABORTED_BY_USER") {
        state = SignInState.error(e.toString());
      } else {
        state = const SignInState.initial();
      }
    } on Exception catch (e) {
      state = SignInState.error(e.toString());
    }
  }
}
