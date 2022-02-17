part of '../sign_in.dart';

@freezed
class SignInPhoneVerificationEvent with _$SignInPhoneVerificationEvent {
  const factory SignInPhoneVerificationEvent.countryChanged(
      CountryWithPhoneCode country) = _CountryChanged;
  const factory SignInPhoneVerificationEvent.phoneChanged(String input) =
      _PhoneChanged;
  const factory SignInPhoneVerificationEvent.verifyPhone() = _VerifyPhone;
}

@freezed
class SignInPhoneVerificationState with _$SignInPhoneVerificationState {
  const factory SignInPhoneVerificationState({
    @Default(delayBeforeUserCanRequestNewCode) int countdown,
    required Map<String, dynamic> phoneNumber,
    @Default("") verificationCode,
    @Default(false) bool canSubmit,
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    String? errorText,
  }) = _SignInPhoneVerificationState;
}

/// An object which controls the state of the verification form.
///
/// It uses a [StateNotifier] to return a [SubmitState] and also
/// do more much stuff such as parsing the phone number and submit the form.
///
/// The core of the functions are in the [AuthService] class because
/// these functions are also used in the member section of the app.
class SignInVerificationController
    extends StateNotifier<SignInPhoneVerificationState> {
  SignInVerificationController(Map<String, dynamic> phoneNumber, this._service)
      : super(SignInPhoneVerificationState(phoneNumber: phoneNumber)) {
    _startTimer();
  }

  final FirebaseAuthService _service;

  String get formattedPhoneNumber =>
      state.phoneNumber['national'].replaceAll(" ", "\u00A0");

  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    state = state.copyWith(countdown: delayBeforeUserCanRequestNewCode);
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (state.countdown == 0) {
          timer.cancel();
        } else {
          state = state.copyWith(countdown: state.countdown - 1);
        }
      },
    );
  }

  void resendCode() {
    state = SubmitState.saving();
    try {
      _authService.verifyPhone(() {
        state = SubmitState.notValid();
        _startTimer();
      });
    } on FirebaseAuthException catch (e) {
      state = SubmitState.error(e.message!);
    }
  }

  Future<void> verifyCode(String verificationCode) async {
    if (!state.canSubmit) return;
    state = state.copyWith(isLoading: true);

    try {
      await _authService.verifyCode(smsCode, () {
        state = SubmitState.success();
      });
    }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-verification-code') {
        state = state.copyWith(
          isLoading: false,
          errorText: "INVALID_CODE",
        );
      }
      else {
        state = state.copyWith(
          isLoading: false,
          errorText: e.message!,
        );
      }
    } 
  }
}
