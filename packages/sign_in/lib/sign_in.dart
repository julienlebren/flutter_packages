library sign_in;

import 'dart:async';
import 'dart:ui' as ui;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:extensions/extensions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firestore_service/firestore_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:layout_builder/layout_builder.dart';
import 'package:localization/localization.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sign_in/presentation/painters/apple_logo.dart';
import 'package:sign_in/presentation/painters/google_logo.dart';
import 'package:sign_in/l10n/sign_in_localizations.dart';
import 'package:the_apple_sign_in/the_apple_sign_in.dart';

part 'controllers/sign_in_controller.dart';
part 'controllers/sign_in_email_controller.dart';
part 'controllers/sign_in_email_link_controller.dart';
part 'controllers/sign_in_email_register_controller.dart';
part 'controllers/sign_in_phone_controller.dart';
part 'controllers/sign_in_phone_verification_controller.dart';
part 'core/enums/sign_in_suppliers.dart';
part 'core/models/auth_state.dart';
part 'core/models/sign_in_event.dart';
part 'core/models/sign_in_state.dart';
part 'core/models/sign_in_theme.dart';
part 'presentation/router/sign_in_router.dart';
part 'presentation/views/sign_in_countries_page.dart';
part 'presentation/views/sign_in_email_link_page.dart';
part 'presentation/views/sign_in_email_page.dart';
part 'presentation/views/sign_in_email_password_page.dart';
part 'presentation/views/sign_in_email_register_page.dart';
part 'presentation/views/sign_in_landing_page.dart';
part 'presentation/views/sign_in_phone_page.dart';
part 'presentation/views/sign_in_unknown_page.dart';
part 'presentation/widgets/sign_in_divider.dart';
part 'presentation/widgets/sign_in_button.dart';
part 'presentation/widgets/sign_in_buttons.dart';
part 'presentation/widgets/sign_in_page_builder.dart';
part 'presentation/widgets/sign_in_tappable_field.dart';
part 'repositories/user_repository.dart';
part 'services/firebase_auth_service.dart';
part 'sign_in.freezed.dart';

const delayBeforeUserCanRequestNewCode = 60;

final userStreamProvider = StreamProvider((_) => const Stream.empty());

final authStateProvider = Provider<AuthState>((ref) {
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
              /*if (settings.needUserInfoProvider != null) {
                final needUserInfo = ref.watch(settings.needUserInfoProvider!);
                if (needUserInfo == true) {
                  return const AuthState.needUserInformation();
                }
              }*/
              return AuthState.authed(user);
            }
          },
        );
      }
    },
  );
}, dependencies: [
  authStateChangesProvider,
  signInControllerProvider,
  userStreamProvider,
]);

final signInLocalizationsProvider = Provider<SignInLocalizations>(
  (ref) {
    final locale = ref.watch(localeProvider);
    return lookupSignInLocalizations(locale);
  },
  dependencies: [localeProvider],
);

final signInThemeProvider = Provider<SignInTheme>(
  (ref) {
    final appTheme = ref.watch(appThemeProvider);
    final formTheme = ref.watch(formThemeProvider);

    return SignInTheme(
      buttonBackgroundColor: formTheme.rowBackgroundColor,
      buttonTextColor: appTheme.textColor,
      dividerColor: appTheme.dividerColor,
    );
  },
  dependencies: [
    appThemeProvider,
    formThemeProvider,
  ],
);

/// A provider which returns the auth changes in Firebase
/// We use a [StreamProvider] here to handle the status of the stream,
/// it allows us to know when the stream is loading or when it has data.
final authStateChangesProvider = StreamProvider<User?>(
    (ref) => ref.watch(authServiceProvider).authStateChanges());

/// A provider which returns an instance of [FirebaseAuthService]
final authServiceProvider =
    Provider<FirebaseAuthService>((ref) => FirebaseAuthService.instance);
