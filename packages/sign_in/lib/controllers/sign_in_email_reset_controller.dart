part of '../sign_in.dart';

final signInEmailResetControllerProvider = StateNotifierProvider.autoDispose<
    SignInEmailResetController, SignInEmailResetState>((ref) {
  final service = ref.watch(authServiceProvider);
  return SignInEmailResetController(service);
});

@freezed
class SignInEmailResetEvent with _$SignInEmailResetEvent {
  const factory SignInEmailResetEvent.emailChanged(String email) =
      _ResetEmailChanged;
  const factory SignInEmailResetEvent.submit() = _ResetSubmit;
}

@freezed
class SignInEmailResetState with _$SignInEmailResetState {
  const factory SignInEmailResetState({
    @Default("") String email,
    @Default(false) bool canSubmit,
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    String? errorText,
  }) = _SignInEmailResetState;
}

class SignInEmailResetController extends StateNotifier<SignInEmailResetState> {
  SignInEmailResetController(this._service)
      : super(const SignInEmailResetState());

  final FirebaseAuthService _service;

  void handleEvent(SignInEmailResetEvent event) {
    event.when(
      emailChanged: (email) {
        state = state.copyWith(
          email: email,
          canSubmit: email.isValidEmail(),
        );
      },
      submit: () {
        _submit();
      },
    );
  }

  Future<void> _submit() async {
    if (!state.canSubmit) return;
    state = state.copyWith(isLoading: true);

    try {
      await _service.sendPasswordResetEmail(state.email);

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
