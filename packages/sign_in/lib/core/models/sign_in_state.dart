part of '../../sign_in.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState.initial() = _SignInInitial;
  const factory SignInState.loading() = _SignInLoading;
  const factory SignInState.success() = _SignInSuccess;
  const factory SignInState.error(String errorText) = _SignInError;
}
