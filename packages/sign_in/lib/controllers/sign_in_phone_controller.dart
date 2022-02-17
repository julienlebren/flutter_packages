part of '../sign_in.dart';

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
  SignInPhoneController(CountryWithPhoneCode country, this._service)
      : super(SignInPhoneState(country: country));

  final FirebaseAuthService _service;

  Future<void> _parsePhoneNumber(
    String inputText,
  ) async {
    try {
      final phoneNumber =
          await _service.parsePhoneNumber(state.country, inputText);

      state = state.copyWith(
        phoneNumber: phoneNumber,
        canSubmit: true,
      );
    } on PlatformException {
      /// We change the state only if it was not the same to avoid useless
      /// rebuilds when typing the phone number inside the TextField
      if (state.canSubmit == true) {
        state = state.copyWith(canSubmit: false);
      }
    } catch (e) {
      state = state.copyWith(
        canSubmit: false,
        errorText: e.toString(),
      );
    }
  }

  Future<void> _verifyPhone() async {
    state = state.copyWith(isLoading: true);
    try {
      _service.verifyPhone((verificationId) {
        state = state.copyWith(
          isLoading: false,
          isSuccess: true,
          verificationId: verificationId,
        );
      });
    } on FirebaseAuthException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorText: e.message!,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorText: e.toString(),
      );
    }
  }
}
