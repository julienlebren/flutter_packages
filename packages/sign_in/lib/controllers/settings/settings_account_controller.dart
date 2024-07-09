part of '../../sign_in.dart';

final settingsAccountControllerProvider =
    StateNotifierProvider<SettingsAccountController, SettingsState>((ref) {
  final service = ref.watch(authServiceProvider);
  return SettingsAccountController(service);
});

@freezed
class SettingsAccountEvent with _$SettingsAccountEvent {
  const factory SettingsAccountEvent.signInWithFacebook() =
      _SettingsConnectFacebook;
  const factory SettingsAccountEvent.signInWithGoogle() =
      _SettingsConnectGoogle;
  const factory SettingsAccountEvent.signInWithApple() = _SettingsConnectApple;
  const factory SettingsAccountEvent.unlink(String providerId) =
      _SettingsUnlink;
}

class SettingsAccountController extends StateNotifier<SettingsState> {
  SettingsAccountController(this._service)
      : super(const SettingsState.initial());

  final FirebaseAuthService _service;

  Future<void> handleEvent(SettingsAccountEvent event) async {
    state = const SettingsState.saving();
    try {
      await event.when(
        signInWithApple: _service.signInWithApple,
        signInWithFacebook: _service.signInWithFacebook,
        signInWithGoogle: _service.signInWithGoogle,
        unlink: _service.unlink,
      );
      state = const SettingsState.success();
    } on FirebaseAuthException catch (e) {
      if (e.code == "ERROR_AUTHORIZATION_DENIED") {
        state = const SettingsState.initial();
      } else if (e.code != "ERROR_ABORTED_BY_USER") {
        state = SettingsState.error(e.toString());
      } else {
        state = const SettingsState.initial();
      }
    } on Exception catch (e) {
      state = SettingsState.error(e.toString());
    }
  }
}
