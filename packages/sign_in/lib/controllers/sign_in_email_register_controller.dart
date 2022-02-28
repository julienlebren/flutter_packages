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
    @Default(false) bool passwordHasMinLength,
    @Default(false) bool passwordHasUppercase,
    @Default(false) bool passwordHasLowercase,
    @Default(false) bool passwordHasDigits,
    @Default(false) bool passwordHasSpecialChars,
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
    print("event: $event");
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

  bool get hasUppercase => state.password.contains(RegExp(r'[A-Z]'));
  bool get hasDigits => state.password.contains(RegExp(r'[0-9]'));
  bool get hasLowercase => state.password.contains(RegExp(r'[a-z]'));
  bool get hasSpecialChars =>
      state.password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  bool get hasMinLength => state.password.length > 6;

  bool get isPasswordCompliant =>
      hasDigits & hasUppercase & hasLowercase & hasSpecialChars & hasMinLength;

  void _checkIfCanSubmit() {
    if (!state.email.isValidEmail() || !isPasswordCompliant) {
      state = state.copyWith(
        canSubmit: false,
        passwordHasMinLength: hasMinLength,
        passwordHasDigits: hasDigits,
        passwordHasLowercase: hasLowercase,
        passwordHasUppercase: hasUppercase,
        passwordHasSpecialChars: hasSpecialChars,
      );
    } else if (state.canSubmit != true) {
      state = state.copyWith(
        errorText: null,
        canSubmit: true,
        passwordHasMinLength: true,
        passwordHasDigits: true,
        passwordHasLowercase: true,
        passwordHasUppercase: true,
        passwordHasSpecialChars: true,
      );
    }
  }

  Future<void> _register() async {
    print("ok ici");
    if (!state.canSubmit) return;
    state = state.copyWith(isLoading: true);
    print("ok là");

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
