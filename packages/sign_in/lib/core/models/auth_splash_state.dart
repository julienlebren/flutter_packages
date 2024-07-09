part of '../../sign_in.dart';

@freezed
class AuthSplashState with _$AuthSplashState {
  const factory AuthSplashState.initializing() = _SplashInitializingAuth;
  const factory AuthSplashState.notAuthed() = _SplashNotAuthed;
  const factory AuthSplashState.authed() = _SplashAuthed;
  const factory AuthSplashState.error(String error) = _SplashAuthError;
}
