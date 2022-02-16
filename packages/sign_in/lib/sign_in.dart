library sign_in;

import 'package:extensions/extensions.dart';
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
part 'controllers/sign_in_email_controller.dart';
part 'controllers/sign_in_email_link_controller.dart';
part 'core/enums/sign_in_suppliers.dart';
part 'core/models/auth_state.dart';
part 'core/models/sign_in_event.dart';
part 'core/models/sign_in_localizations.dart';
part 'core/models/sign_in_state.dart';
part 'core/models/sign_in_theme.dart';
part 'presentation/sign_in_buttons.dart';
part 'presentation/sign_in_landing_page.dart';
part 'presentation/sign_in_router.dart';
part 'presentation/sign_in_email_link_page.dart';
part 'presentation/sign_in_email_page.dart';
part 'presentation/sign_in_email_password_page.dart';
part 'presentation/sign_in_phone_page.dart';
part 'presentation/sign_in_button.dart';
part 'presentation/sign_in_unknown_page.dart';
//part 'presentation/sign_in_widget.dart';
part 'sign_in.freezed.dart';

class AuthSettings {
  AuthSettings(
    this.userStreamProvider, {
    this.needUserInfoProvider,
    this.needUserInfoPage,
    this.onGenerateCustomRoute,
  });

  StreamProvider userStreamProvider;
  Provider? needUserInfoProvider;
  String? needUserInfoPage;
  Function(RouteSettings settings)? onGenerateCustomRoute;
}

final authSettingsProvider = Provider<AuthSettings>((_) {
  throw UnimplementedError(
      "You forgot to override AuthSettings() before calling authSettingsProvider!");
});

final authStateProvider =
    Provider.family<AuthState, AuthSettings>((ref, settings) {
  final authStateChanges = ref.watch(authStateChangesProvider);

  return authStateChanges.when(
    loading: () => const AuthState.initializing(),
    error: (error, _) => AuthState.error(error.toString()),
    data: (user) {
      if (user == null) {
        return const AuthState.notAuthed();
      } else {
        final user = ref.watch(settings.userStreamProvider);
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
              if (settings.needUserInfoProvider != null) {
                final needUserInfo = ref.watch(settings.needUserInfoProvider!);
                if (needUserInfo == true) {
                  return const AuthState.needUserInformation();
                }
              }
              return AuthState.authed(user);
            }
          },
        );
      }
    },
  );
});

final signInLocalizationsProvider = Provider<SignInLocalizations>(
  (_) => const SignInLocalizations(),
);

final signInThemeProvider = Provider<SignInTheme>((ref) {
  final appTheme = ref.watch(appThemeProvider);
  final formTheme = ref.watch(formThemeProvider);

  return SignInTheme(
    buttonBackgroundColor: formTheme.rowBackgroundColor,
    buttonTextColor: appTheme.textColor,
  );
});

/*
final _userRef =
    FirebaseFirestore.instance.collection("users").withConverter<User>(
          fromFirestore: (snapshot, _) {
            final userFromJson = User.fromJson(snapshot.data()!);
            return userFromJson.copyWith(id: snapshot.id);
          },
          toFirestore: (user, _) => user.toJson(),
        );

final userStreamProvider = StreamProvider<User?>((ref) {
  final authStateChanges = ref.watch(authStateChangesProvider);

  return authStateChanges.maybeWhen(
    data: (user) => user != null
        ? _userRef.doc(user.uid).snapshots().map((snapshot) => snapshot.data())
        : const Stream.empty(),
    orElse: () => const Stream.empty(),
  );
});
*/
/*
final userStreamProvider = StreamProvider((_) => const Stream.empty());

final needUserInfoProvider = Provider<bool>((_) => false);

final authStateProvider = Provider<AuthState>(
  (ref) {
    final authStateChanges = ref.watch(authStateChangesProvider);

    return authStateChanges.when(
      loading: () => const AuthState.initializing(),
      error: (error, _) => AuthState.error(error.toString()),
      data: (user) {
        if (user == null) {
          return const AuthState.notAuthed();
        } else {
          final user = ref.watch(userStreamProvider);
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
                if (needUserInfo == true) {
                  return const AuthState.needUserInformation();
                } else {
                  return AuthState.authed(user);
                }
              }
            },
          );
        }
      },
    );
  },
  dependencies: [
    authStateChangesProvider,
    userStreamProvider,
    signInControllerProvider,
    needUserInfoProvider,
  ],
);*/