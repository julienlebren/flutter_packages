import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_service/auth_state.dart';
import 'package:firebase_auth_service/base_user.dart';
import 'package:firebase_auth_service/firebase_auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A provider which returns the auth changes in Firebase
/// We use a [StreamProvider] here to handle the status of the stream,
/// it allows us to know when the stream is loading or when it has data.
final authStateChangesProvider = StreamProvider<User?>(
    (ref) => ref.watch(authServiceProvider).authStateChanges());

/// A provider which returns an instance of [FirebaseAuthService]
final authServiceProvider =
    Provider<FirebaseAuthService>((ref) => FirebaseAuthService.instance);

final authStateProvider = StateProvider.family<AuthState, StreamProvider>(
    (ref, profileStreamProvider) {
  final authStateChanges = ref.watch(authStateChangesProvider);
  return authStateChanges.when(
    loading: () => AuthState.initializing(),
    error: (error, _) => AuthState.error(error.toString()),
    data: (user) {
      if (user == null) {
        return AuthState.notAuthed();
      } else {
        final profile = ref.watch(profileStreamProvider);
        return profile.when(
          loading: () => AuthState.initializing(),
          error: (error, _) => AuthState.error(error.toString()),
          data: (user) {
            if (user is BaseUser) {
              return AuthState.authed();
            } else {
              return AuthState.waitingUserCreation();
            }
          },
        );
      }
    },
  );
});
