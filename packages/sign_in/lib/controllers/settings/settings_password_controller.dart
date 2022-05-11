part of '../../sign_in.dart';

final settingsPasswordControllerProvider = StateNotifierProvider.autoDispose<
    SettingsPasswordController, SettingsPasswordState>((ref) {
  final service = ref.watch(authServiceProvider);
  final localizations = ref.watch(signInLocalizationsProvider);

  return SettingsPasswordController(service, localizations);
}, dependencies: [
  authServiceProvider,
  signInLocalizationsProvider,
]);

@freezed
class SettingsPasswordEvent with _$SettingsPasswordEvent {
  const factory SettingsPasswordEvent.passwordChanged(String password) =
      _SettingsPasswordChanged;
  const factory SettingsPasswordEvent.passwordConfirmationChanged(
      String password) = _SettingsPasswordConfirmationChanged;
  const factory SettingsPasswordEvent.submit() = _SettingsPasswordSubmit;
}

@freezed
class SettingsPasswordState with _$SettingsPasswordState {
  const factory SettingsPasswordState({
    @Default("") String password,
    @Default("") String passwordConfirmation,
    @Default(false) bool passwordHasMinLength,
    @Default(false) bool passwordHasUppercase,
    @Default(false) bool passwordHasLowercase,
    @Default(false) bool passwordHasDigits,
    @Default(false) bool passwordHasSpecialChars,
    @Default(false) bool passwordsMatch,
    @Default(false) bool canSubmit,
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    String? errorText,
  }) = _SettingsPasswordState;
}

class SettingsPasswordController extends StateNotifier<SettingsPasswordState> {
  SettingsPasswordController(
    this._service,
    this._localizations,
  ) : super(const SettingsPasswordState());

  final FirebaseAuthService _service;
  final SignInLocalizations _localizations;

  void handleEvent(SettingsPasswordEvent event) {
    event.when(
      passwordChanged: (password) {
        state = state.copyWith(password: password);
        _checkIfCanSubmit();
      },
      passwordConfirmationChanged: (password) {
        state = state.copyWith(passwordConfirmation: password);
        _checkIfCanSubmit();
      },
      submit: _submit,
    );
  }

  void _checkIfCanSubmit() {
    state = state.copyWith(
      canSubmit: state.password.isPasswordCompliant &&
          state.password == state.passwordConfirmation,
      passwordHasMinLength: state.password.hasMinLength,
      passwordHasDigits: state.password.hasDigits,
      passwordHasLowercase: state.password.hasLowercase,
      passwordHasUppercase: state.password.hasUppercase,
      passwordHasSpecialChars: state.password.hasSpecialChars,
      passwordsMatch:
          state.password != "" && state.password == state.passwordConfirmation,
    );
  }

  Future<void> _submit() async {
    if (!state.canSubmit) return;
    state = state.copyWith(isLoading: true);

    try {
      await _service.updatePassword(state.password);

      state = state.copyWith(
        isSuccess: true,
        errorText: null,
      );
    } on FirebaseFunctionsException catch (e) {
      print(e);
      state = state.copyWith(
        isLoading: false,
        errorText: _localizations.errorUnknown,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorText: e.toString(),
      );
    }
  }
}
