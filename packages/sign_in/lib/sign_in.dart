library sign_in;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_service/firebase_auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:layout_builder/layout_builder.dart';
import 'package:sign_in/presentation/painters/apple_logo.dart';
import 'package:sign_in/presentation/painters/google_logo.dart';

part 'controllers/sign_in_controller.dart';
part 'core/abstract/user_repository.dart';
part 'core/enums/sign_in_providers.dart';
part 'core/models/auth_state.dart';
part 'core/models/sign_in_event.dart';
part 'core/models/sign_in_localizations.dart';
part 'core/models/sign_in_state.dart';
part 'core/models/sign_in_theme.dart';
part 'presentation/sign_in_button.dart';
part 'presentation/sign_in_widget.dart';
part 'sign_in.freezed.dart';

final signInControllerProvider =
    StateNotifierProvider<SignInController, SignInState>((ref) {
  final service = ref.watch(authServiceProvider);
  return SignInController(service);
});

final userStreamProvider = StreamProvider((_) => const Stream.empty());

final needUserInfoProvider = Provider<bool?>((_) => null);

final authStateProvider = Provider<AuthState>((ref) {
  final authStateChanges = ref.watch(authStateChangesProvider);

  return authStateChanges.when(
    loading: () => const AuthState.initializing(),
    error: (error, _) => AuthState.error(error.toString()),
    data: (user) {
      if (user == null) {
        return const AuthState.notAuthed();
      } else {
        print("userStreamProvider: $userStreamProvider");
        final user = ref.watch(userStreamProvider);
        print("user: $user");
        return user.when(
          loading: () {
            final isSigninIn = ref.watch(signInControllerProvider.select(
              (state) => (state == const SignInState.success()),
            ));
            if (isSigninIn) {
              return const AuthState.notAuthed();
            } else {
              return const AuthState.initializing();
            }
          },
          error: (error, _) => AuthState.error(error.toString()),
          data: (user) {
            if (user == null) {
              return const AuthState.waitingUserCreation();
            } else {
              final needUserInfo = ref.watch(needUserInfoProvider);
              if (needUserInfo == null) {
                return const AuthState.notAuthed();
              } else if (needUserInfo == true) {
                return const AuthState.needUserInformation();
              } else {
                return const AuthState.authed();
              }
            }
          },
        );
      }
    },
  );
}, dependencies: [userStreamProvider]);
