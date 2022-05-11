part of '../../sign_in.dart';

final settingsEmailControllerProvider = StateNotifierProvider.autoDispose<
    SettingsEmailController, SettingsEmailState>((ref) {
  final service = ref.watch(authServiceProvider);
  final settings = ref.watch(authSettingsProvider);
  final localizations = ref.watch(signInLocalizationsProvider);

  return SettingsEmailController(service, settings.userRef, localizations);
}, dependencies: [
  authServiceProvider,
  authSettingsProvider,
  signInLocalizationsProvider,
]);

@freezed
class SettingsEmailEvent with _$SettingsEmailEvent {
  const factory SettingsEmailEvent.emailChanged(String email) =
      _SettingsEmailChanged;
  const factory SettingsEmailEvent.submit() = _SettingsEmailSubmit;
}

@freezed
class SettingsEmailState with _$SettingsEmailState {
  const factory SettingsEmailState({
    @Default("") String email,
    @Default(false) bool canSubmit,
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    String? errorText,
  }) = _SettingsEmailState;
}

class SettingsEmailController extends StateNotifier<SettingsEmailState> {
  SettingsEmailController(
    this._service,
    this._userRef,
    this._localizations,
  ) : super(const SettingsEmailState());

  final FirebaseAuthService _service;
  final CollectionReference? _userRef;
  final SignInLocalizations _localizations;

  void handleEvent(SettingsEmailEvent event) {
    event.when(
      emailChanged: (email) {
        state = state.copyWith(
          email: email,
          canSubmit: email.isValidEmail(),
        );
      },
      submit: _submit,
    );
  }

  Future<void> _submit() async {
    if (!state.canSubmit) return;
    state = state.copyWith(
      isLoading: true,
      errorText: null,
    );

    try {
      await _service.updateEmail(state.email);

      if (_userRef != null) {
        final userId = _service.currentUser!.uid;
        await _userRef!.doc(userId).update({
          "emailAddress": state.email,
          "emailVerified": false,
        });
      }

      state = state.copyWith(isSuccess: true);
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
