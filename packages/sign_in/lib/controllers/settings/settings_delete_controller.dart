part of '../../../sign_in.dart';

final settingsDeleteControllerProvider = StateNotifierProvider.autoDispose<
    SettingsDeleteController, SettingsDeleteState>((ref) {
  final service = ref.watch(authServiceProvider);
  final localizations = ref.watch(signInLocalizationsProvider);

  return SettingsDeleteController(service, localizations);
}, dependencies: [
  authServiceProvider,
  signInLocalizationsProvider,
]);

@freezed
class SettingsDeleteState with _$SettingsDeleteState {
  const factory SettingsDeleteState({
    @Default(false) bool canSubmit,
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    String? errorText,
  }) = _SettingsDeleteState;
}

class SettingsDeleteController extends StateNotifier<SettingsDeleteState> {
  SettingsDeleteController(
    this._service,
    this._localizations,
  ) : super(const SettingsDeleteState());

  final FirebaseAuthService _service;
  final SignInLocalizations _localizations;

  Future<void> delete() async {
    state = state.copyWith(
      isLoading: true,
      errorText: null,
    );

    try {
      await _service.deleteAccount();
      state = state.copyWith(isSuccess: true);
    } on FirebaseFunctionsException catch (_) {
      if (mounted) {
        state = state.copyWith(
          isLoading: false,
          errorText: _localizations.errorUnknown,
        );
      }
    } catch (e) {
      if (mounted) {
        state = state.copyWith(
          isLoading: false,
          errorText: e.toString(),
        );
      }
    }
  }
}
