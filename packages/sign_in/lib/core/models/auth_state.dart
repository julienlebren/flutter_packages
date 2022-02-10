part of '../../sign_in.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initializing() = _InitializingAuth;
  const factory AuthState.notAuthed() = _NotAuthed;
  const factory AuthState.waitingUserCreation() = _WaitingUserCreation;
  const factory AuthState.needUserInformation() = _NeedUserInformation;
  const factory AuthState.authed() = _Authed;
  const factory AuthState.error(String error) = _AuthError;
}
