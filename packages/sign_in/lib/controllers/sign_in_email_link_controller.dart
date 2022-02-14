part of '../sign_in.dart';

final signInEmailLinkControllerProvider =
    StateNotifierProvider<SignInEmailLinkController, SignInState>((ref) {
  final authSettings = ref.watch(authSettingsProvider);
  final service = ref.watch(authServiceProvider);
  return SignInEmailLinkController(service, authSettings.emailLinkUrl!);
});

class SignInEmailLinkController extends StateNotifier<SignInState> {
  SignInEmailLinkController(this._service, this._url)
      : super(const SignInState.initial());

  final FirebaseAuthService _service;
  final String _url;

  Future<void> handleEvent(SignInEvent event) async {
    state = const SignInState.loading();
    try {
      await event.maybeWhen(
        signInWithEmailLink: (email) => _service.sendSignInLinkToEmail(
          email: email,
          url: _url,
        ),
        orElse: () => null,
      );
      state = const SignInState.success();
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
