import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

/// A provider to get the current auth status of the user
/// Listens two providers to return the correct state:
/// `authStateChangesProvider` if the user is authenticated with Firebase
/// `profileStreamProvider` to get the profile status from Firestore
/// We check the `type` value of the [Profile] to know if the profile
/// has been correctly completed, because this value is saved only
/// when the profile is completed.
@freezed
class AuthState with _$AuthState {
  const factory AuthState.initializing() = _Initializing;
  const factory AuthState.notAuthed() = _NotAuthed;
  const factory AuthState.waitingUserCreation() = _WaitingUserCreation;
  const factory AuthState.authed() = _Authed;
  const factory AuthState.error(String error) = _Error;
}
