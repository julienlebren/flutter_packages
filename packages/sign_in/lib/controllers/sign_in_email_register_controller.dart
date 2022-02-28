part of '../sign_in.dart';

final signInEmailRegisterControllerProvider = StateNotifierProvider.autoDispose<
    SignInEmailRegisterController, SignInEmailRegisterState>((ref) {
  final service = ref.watch(authServiceProvider);
  final localizations = ref.watch(signInLocalizationsProvider);

  return SignInEmailRegisterController(service, localizations);
}, dependencies: [
  authServiceProvider,
]);

@freezed
class SignInEmailRegisterEvent with _$SignInEmailRegisterEvent {
  const factory SignInEmailRegisterEvent.emailChanged(String email) =
      _RegisterEmailChanged;
  const factory SignInEmailRegisterEvent.passwordChanged(String password) =
      _RegisterPasswordChanged;
  const factory SignInEmailRegisterEvent.submit() = _RegisterSubmit;
}

@freezed
class SignInEmailRegisterState with _$SignInEmailRegisterState {
  const factory SignInEmailRegisterState({
    @Default("") String email,
    @Default("") String password,
    @Default(false) bool canSubmit,
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    String? errorText,
  }) = _SignInEmailRegisterState;
}

class SignInEmailRegisterController
    extends StateNotifier<SignInEmailRegisterState> {
  SignInEmailRegisterController(
    this._service,
    this._localizations,
  ) : super(const SignInEmailRegisterState());

  final FirebaseAuthService _service;
  final SignInLocalizations _localizations;

  void handleEvent(SignInEmailRegisterEvent event) {
    event.when(
      emailChanged: (email) {
        state = state.copyWith(
          email: email,
          canSubmit: email.isValidEmail(),
        );
      },
      passwordChanged: (password) {
        state = state.copyWith(
          password: password,
          canSubmit: (password.length >= 6),
        );
      },
      submit: () => _register,
    );
  }

  Future<void> _register() async {
    if (!state.canSubmit) return;
    state = state.copyWith(isLoading: true);

    try {
      await _service.registerInWithEmail(
        email: state.email,
        password: state.password,
      );

      state = state.copyWith(
        isSuccess: true,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorText: e.toString(),
      );
    }
  }
}
