part of '../sign_in.dart';

final signInEmailControllerProvider =
    StateNotifierProvider<SignInEmailController, SignInEmailState>((ref) {
  final service = ref.watch(authServiceProvider);
  return SignInEmailController(service);
}, dependencies: [
  authServiceProvider,
]);

@freezed
class SignInEmailEvent with _$SignInEmailEvent {
  const factory SignInEmailEvent.emailChanged(String email) = _EmailChanged;
  //const factory SignInEmailEvent.sendLink() = _SendLink;
}

@freezed
class SignInEmailState with _$SignInEmailState {
  const factory SignInEmailState({
    @Default("") String email,
    @Default(false) bool canSubmit,
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    String? errorText,
  }) = _SignInEmailState;
}

class SignInEmailController extends StateNotifier<SignInEmailState> {
  SignInEmailController(this._service) : super(const SignInEmailState());

  final FirebaseAuthService _service;

  void handleEvent(SignInEmailEvent event) {
    event.when(
      emailChanged: (email) {
        state = state.copyWith(
          email: email,
          canSubmit: email.isValidEmail(),
        );
      },
    );
  }

  Future<void> _sendLink() async {
    if (!state.canSubmit) return;
    state = state.copyWith(isLoading: true);

    try {
      /*await _service.sendSignInLinkToEmail(
        email: state.email,
        url: _url,
      );*/

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
