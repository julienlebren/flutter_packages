part of '../sign_in.dart';

final signInEmailRegisterControllerProvider = StateNotifierProvider.autoDispose<
    SignInEmailRegisterController, SignInEmailRegisterState>((ref) {
  final service = ref.watch(authServiceProvider);
  final localizations = ref.watch(signInLocalizationsProvider);

  return SignInEmailRegisterController(service, localizations);
}, dependencies: [
  authServiceProvider,
  signInLocalizationsProvider,
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
        state = state.copyWith(email: email);
        _checkIfCanSubmit();
      },
      passwordChanged: (password) {
        state = state.copyWith(password: password);
        _checkIfCanSubmit();
      },
      submit: () => _register,
    );
  }

  bool isPasswordCompliant(String password, [int minLength = 6]) {
    if (password.isEmpty) {
      return false;
    }

    bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
    bool hasDigits = password.contains(RegExp(r'[0-9]'));
    bool hasLowercase = password.contains(RegExp(r'[a-z]'));
    bool hasSpecialCharacters =
        password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    bool hasMinLength = password.length > minLength;

    return hasDigits &
        hasUppercase &
        hasLowercase &
        hasSpecialCharacters &
        hasMinLength;
  }

  void _checkIfCanSubmit() {
    if (!state.email.isValidEmail() || state.password.length < 6) {
      state = state.copyWith(
        canSubmit: false,
      );
    } else if (state.canSubmit != true) {
      state = state.copyWith(
        errorText: null,
        canSubmit: true,
      );
    }
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
