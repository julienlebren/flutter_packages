part of '../sign_in.dart';

final signInButtonsControllerProvider =
    StateNotifierProvider<SignInButtonsController, SignInButtonsState>((ref) {
  final service = ref.watch(authServiceProvider);
  return SignInButtonsController(service);
});

@freezed
class SignInButtonsEvent with _$SignInButtonsEvent {
  const factory SignInButtonsEvent.signInWithFacebook() = _SignInWithFacebook;
  const factory SignInButtonsEvent.signInWithGoogle() = _SignInWithGoogle;
  const factory SignInButtonsEvent.signInWithApple() = _SignInWithApple;
  const factory SignInButtonsEvent.signInWithEmail() = _SignInWithEmail;
  const factory SignInButtonsEvent.signInWithEmailLink(String email) =
      _SignInWithEmailLink;
  const factory SignInButtonsEvent.signInWithPhone() = _SignInWithPhone;
  const factory SignInButtonsEvent.signInAnonymously() = _SignInAnonymously;
}

@freezed
class SignInButtonsState with _$SignInButtonsState {
  const factory SignInButtonsState.initial() = _SignInInitial;
  const factory SignInButtonsState.loading() = _SignInLoading;
  const factory SignInButtonsState.success() = _SignInSuccess;
  const factory SignInButtonsState.error(String errorText) = _SignInError;
}

class SignInButtonsController extends StateNotifier<SignInButtonsState> {
  SignInButtonsController(this._service)
      : super(const SignInButtonsState.initial());

  final FirebaseAuthService _service;

  Future<void> handleEvent(SignInButtonsEvent event) async {
    state = const SignInButtonsState.loading();
    try {
      await event.maybeWhen(
        signInWithApple: _service.signInWithApple,
        signInWithFacebook: _service.signInWithFacebook,
        signInWithGoogle: _service.signInWithGoogle,
        signInAnonymously: _service.signInAnonymously,
        orElse: () => null,
      );
      state = const SignInButtonsState.success();
    } on FirebaseAuthException catch (e) {
      if (e.code == "ERROR_AUTHORIZATION_DENIED") {
        state = const SignInButtonsState.initial();
      } else if (e.code != "ERROR_ABORTED_BY_USER") {
        state = SignInButtonsState.error(e.toString());
      } else {
        state = const SignInButtonsState.initial();
      }
    } on Exception catch (e) {
      state = SignInButtonsState.error(e.toString());
    }
  }

  Future<void> signOut() async {
    try {
      _service.signOut();
      state = const SignInButtonsState.initial();
    } on Exception catch (e) {
      state = SignInButtonsState.error(e.toString());
    }
  }
}
