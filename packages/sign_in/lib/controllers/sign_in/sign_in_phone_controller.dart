part of '../../sign_in.dart';

/// Creates an instance of [SignInPhoneController]
///
/// We are using [StateNotifierProvider] here as a
/// `SignInPhoneController` is a complex object, with
/// advanced business logic like submitting the phone number
final signInPhoneControllerProvider =
    StateNotifierProvider.autoDispose<SignInPhoneController, SignInPhoneState>(
        (ref) {
  final country = ref.watch(selectedCountryProvider);
  final authService = ref.watch(authServiceProvider);
  final localizations = ref.watch(signInLocalizationsProvider);
  return SignInPhoneController(country, authService, localizations);
}, dependencies: [
  selectedCountryProvider,
  authServiceProvider,
  signInLocalizationsProvider,
]);

@freezed
class SignInPhoneEvent with _$SignInPhoneEvent {
  const factory SignInPhoneEvent.countryChanged(CountryWithPhoneCode country) =
      _CountryChanged;
  const factory SignInPhoneEvent.phoneChanged(String input) = _PhoneChanged;
  const factory SignInPhoneEvent.verifyPhone() = _VerifyPhone;
}

@freezed
class SignInPhoneState with _$SignInPhoneState {
  const factory SignInPhoneState({
    required CountryWithPhoneCode country,
    Map<String, dynamic>? phoneNumber,
    String? verificationId,
    @Default(false) bool canSubmit,
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    String? errorText,
  }) = _SignInPhoneState;
}

/// An object which controls the state of the phone number form.
///
/// It uses a [StateNotifier] to return a [SubmitState] and also
/// do more much stuff such as parsing the phone number and submit the form.
///
/// The core of the functions are in the [AuthService] class because
/// these functions are also used in the member section of the app.
class SignInPhoneController extends StateNotifier<SignInPhoneState> {
  SignInPhoneController(
    CountryWithPhoneCode country,
    this._service,
    this._localizations,
  ) : super(SignInPhoneState(country: country));

  final FirebaseAuthService _service;
  final SignInLocalizations _localizations;

  /*void handleEvent(SignInPhoneEvent event) {
    event.when(
      countryChanged: (country) {
        state = state.copyWith(country: country);
      },
      phoneChanged: _parsePhoneNumber,
      verifyPhone: _verifyPhone,
    );
  }*/

  /*Future<void> _parsePhoneNumber(
    String input,
  ) async {
    try {
      final phoneNumber = await _service.parsePhoneNumber(state.country, input);

      state = state.copyWith(
        phoneNumber: phoneNumber,
        canSubmit: true,
        errorText: null,
      );
    } on FirebaseAuthException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorText: e.description(_localizations),
      );
    } on PlatformException {
      /// We change the state only if it was not the same to avoid useless
      /// rebuilds when typing the phone number inside the TextField
      if (state.canSubmit == true) {
        state = state.copyWith(
          errorText: null,
          canSubmit: false,
        );
      }
    } catch (e) {
      state = state.copyWith(
        canSubmit: false,
        errorText: e.toString(),
      );
    }
  }*/

  Future<void> _verifyPhone() async {
    if (!state.canSubmit) return;
    state = state.copyWith(isLoading: true);

    try {
      _service.verifyPhone(state.phoneNumber!['e164'], (verificationId) {
        state = state.copyWith(
          isLoading: false,
          isSuccess: true,
          errorText: null,
          verificationId: verificationId,
        );
      });
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
