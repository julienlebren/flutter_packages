part of '../sign_in.dart';

final signInEmailLinkControllerProvider =
    StateNotifierProvider<SignInEmailLinkController, SignInEmailLinkState>(
        (ref) {
  final authSettings = ref.watch(authSettingsProvider);
  final service = ref.watch(authServiceProvider);
  return SignInEmailLinkController(service, authSettings.emailLinkUrl!);
}, dependencies: [
  authSettingsProvider,
  authServiceProvider,
]);

@freezed
class SignInEmailLinkEvent with _$SignInEmailLinkEvent {
  const factory SignInEmailLinkEvent.emailChanged(String email) = _EmailChanged;
  const factory SignInEmailLinkEvent.sendLink() = _SendLink;
}

@freezed
class SignInEmailLinkState with _$SignInEmailLinkState {
  const factory SignInEmailLinkState({
    @Default("") String email,
    @Default(false) bool canSubmit,
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    String? errorText,
  }) = _SignInEmailLinkState;
}

class SignInEmailLinkController extends StateNotifier<SignInEmailLinkState> {
  SignInEmailLinkController(this._service, this._url)
      : super(const SignInEmailLinkState());

  final FirebaseAuthService _service;
  final String _url;

  void handleEvent(SignInEmailLinkEvent event) {
    print("là $event");
    event.when(
      emailChanged: (email) {
        state = state.copyWith(
          email: email,
          canSubmit: email.isValidEmail(),
        );
      },
      sendLink: () => _sendLink,
    );
  }

  Future<void> _sendLink() async {
    if (!state.canSubmit) return;
    state = state.copyWith(isLoading: true);

    try {
      await _service.sendSignInLinkToEmail(
        email: state.email,
        url: _url,
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
