part of '../../sign_in.dart';

final signInEmailLinkControllerProvider = StateNotifierProvider.autoDispose<
    SignInEmailLinkController, SignInEmailLinkState>((ref) {
  final service = ref.watch(authServiceProvider);
  final localizations = ref.watch(signInLocalizationsProvider);
  return SignInEmailLinkController(
      service, localizations, "authSettings.emailLinkUrl!");
}, dependencies: [
  authServiceProvider,
  signInLocalizationsProvider,
]);

@freezed
class SignInEmailLinkEvent with _$SignInEmailLinkEvent {
  const factory SignInEmailLinkEvent.emailChanged(String email) =
      _LinkEmailChanged;
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
  SignInEmailLinkController(this._service, this._localizations, this._url)
      : super(const SignInEmailLinkState());

  final FirebaseAuthService _service;
  final SignInLocalizations _localizations;
  final String _url;

  void handleEvent(SignInEmailLinkEvent event) {
    event.when(
      emailChanged: (email) {
        state = state.copyWith(
          email: email,
          canSubmit: email.isValidEmail(),
        );
      },
      sendLink: () {
        _sendLink();
      },
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
        errorText: null,
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
