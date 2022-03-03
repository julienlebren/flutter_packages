part of '../sign_in.dart';

final signInEmailLoginControllerProvider = StateNotifierProvider.autoDispose<
    SignInEmailLoginController, SignInEmailLoginState>((ref) {
  final service = ref.watch(authServiceProvider);
  final localizations = ref.watch(signInLocalizationsProvider);
  return SignInEmailLoginController(service, localizations);
}, dependencies: [
  authServiceProvider,
]);

@freezed
class SignInEmailLoginEvent with _$SignInEmailLoginEvent {
  const factory SignInEmailLoginEvent.emailChanged(String email) =
      _EmailLoginEmailChanged;
  const factory SignInEmailLoginEvent.passwordChanged(String password) =
      _EmailLoginPasswordChanged;
  const factory SignInEmailLoginEvent.submit() = _EmailLoginSubmit;
}

@freezed
class SignInEmailLoginState with _$SignInEmailLoginState {
  const factory SignInEmailLoginState({
    @Default("") String email,
    @Default("") String password,
    @Default(false) bool canSubmit,
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    String? errorText,
  }) = _SignInEmailLoginState;
}

class SignInEmailLoginController extends StateNotifier<SignInEmailLoginState> {
  SignInEmailLoginController(this._service, this._localizations)
      : super(const SignInEmailLoginState());

  final FirebaseAuthService _service;
  final SignInLocalizations _localizations;

  void handleEvent(SignInEmailLoginEvent event) {
    event.when(
      emailChanged: (email) {
        state = state.copyWith(email: email);
        _checkIfCanSubmit();
      },
      passwordChanged: (password) {
        state = state.copyWith(password: password);
        _checkIfCanSubmit();
      },
      submit: _login,
    );
  }

  void _checkIfCanSubmit() {
    final canSubmit = state.email.isValidEmail() && state.password.length >= 6;

    if (canSubmit != state.canSubmit) {
      state = state.copyWith(canSubmit: canSubmit);
    }
  }

  Future<void> _login() async {
    if (!state.canSubmit) return;
    state = state.copyWith(isLoading: true);

    try {
      await _service.signInWithEmailAndPassword(
        email: state.email,
        password: state.password,
      );

      state = state.copyWith(
        isSuccess: true,
      );
    } on FirebaseAuthException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorText: e.description(_localizations),
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorText: e.toString(),
      );
    }
  }
}
