library sign_in;

import 'dart:async';
import 'dart:ui' as ui;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:extensions/extensions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
//import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:layout_builder/layout_builder.dart';
import 'package:localization/localization.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pinput/pinput.dart';
import 'package:sign_in/presentation/painters/apple_logo.dart';
import 'package:sign_in/presentation/painters/google_logo.dart';
import 'package:sign_in/l10n/sign_in_localizations.dart';
import 'package:the_apple_sign_in/the_apple_sign_in.dart';

part 'controllers/settings/settings_account_controller.dart';
part 'controllers/settings/settings_delete_controller.dart';
part 'controllers/settings/settings_email_controller.dart';
part 'controllers/settings/settings_password_controller.dart';
part 'controllers/sign_in/sign_in_buttons_controller.dart';
part 'controllers/sign_in/sign_in_email_login_controller.dart';
part 'controllers/sign_in/sign_in_email_link_controller.dart';
part 'controllers/sign_in/sign_in_email_reset_controller.dart';
part 'controllers/sign_in/sign_in_email_register_controller.dart';
part 'controllers/sign_in/sign_in_phone_controller.dart';
part 'controllers/sign_in/sign_in_phone_verification_controller.dart';
part 'core/enums/sign_in_suppliers.dart';
part 'core/extensions/password.dart';
part 'core/models/auth_splash_state.dart';
part 'core/models/auth_state.dart';
part 'core/models/sign_in_theme.dart';
part 'presentation/router/settings_router.dart';
part 'presentation/router/sign_in_router.dart';
part 'presentation/views/settings/settings_account_page.dart';
part 'presentation/views/settings/settings_delete_page.dart';
part 'presentation/views/settings/settings_email_page.dart';
part 'presentation/views/settings/settings_password_page.dart';
part 'presentation/views/sign_in/sign_in_countries_page.dart';
part 'presentation/views/sign_in/sign_in_email_link_page.dart';
part 'presentation/views/sign_in/sign_in_email_login_page.dart';
part 'presentation/views/sign_in/sign_in_email_reset_page.dart';
part 'presentation/views/sign_in/sign_in_email_register_page.dart';
part 'presentation/widgets/sign_in_landing_page_builder.dart';
part 'presentation/views/sign_in/sign_in_phone_page.dart';
part 'presentation/views/sign_in/sign_in_phone_verification_page.dart';
part 'presentation/views/sign_in/sign_in_unknown_page.dart';
part 'presentation/views/splash/splash_page_builder.dart';
part 'presentation/widgets/anonymous_badge.dart';
part 'presentation/widgets/password_requirement.dart';
part 'presentation/widgets/sign_in_buttons.dart';
part 'presentation/widgets/sign_in_page_builder.dart';
part 'presentation/widgets/sign_in_tappable_field.dart';
part 'services/firebase_auth_service.dart';
part 'services/firebase_auth_errors.dart';
part 'sign_in.freezed.dart';

class AuthSettings {
  AuthSettings({
    required this.suppliers,
    required this.userStreamProvider,
    this.needUserInfoProvider,
    this.settingsNavigator,
    this.userRef,
  });

  final List<SignInSupplier> suppliers;
  final StreamProvider userStreamProvider;
  final Provider<bool?>? needUserInfoProvider;
  final GlobalKey<NavigatorState>? settingsNavigator;
  final CollectionReference? userRef;
}

final authSettingsProvider =
    Provider<AuthSettings>((_) => throw UnimplementedError());

final authStateProvider =
    Provider.family<AuthState, AuthSettings>((ref, settings) {
  final authStateChanges = ref.watch(authStateChangesProvider);

  return authStateChanges.when(
    loading: () => const AuthState.initializing(),
    error: (error, _) => AuthState.error(error.toString()),
    data: (firebaseUser) {
      if (firebaseUser == null) {
        return const AuthState.notAuthed();
      } else {
        final isSigninIn = ref.watch(signInSupplierProvider) != null;
        final user = ref.watch(settings.userStreamProvider);
        return user.when(
          loading: () {
            if (isSigninIn) {
              return const AuthState.notAuthed();
            } else {
              return const AuthState.initializing();
            }
          },
          error: (error, stack) {
            return AuthState.error(error.toString());
          },
          data: (user) {
            if (user == null) {
              return const AuthState.waitingUserCreation();
            } else {
              if (settings.needUserInfoProvider != null) {
                final needUserInfo = ref.watch(settings.needUserInfoProvider!);
                if (needUserInfo == true) {
                  return const AuthState.needUserInformation();
                } else if (needUserInfo == false) {
                  return AuthState.authed(user);
                } else {
                  if (isSigninIn) {
                    return const AuthState.notAuthed();
                  } else {
                    return const AuthState.initializing();
                  }
                }
              } else {
                return AuthState.authed(user);
              }
            }
          },
        );
      }
    },
  );
});

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
      primaryColor: appTheme.primaryColor,
      scaffoldBackgroundColor: appTheme.scaffoldBackgroundColor,
      textColor: appTheme.textColor,
      buttonBackgroundColor: formTheme.rowBackgroundColor,
      buttonTextColor: appTheme.textColor,
      dividerColor: appTheme.dividerColor,
      borderColor: appTheme.borderColor,
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

final userChangesProvider = StreamProvider<User?>(
    (ref) => ref.watch(authServiceProvider).userChanges());

/// A provider which returns an instance of [FirebaseAuthService]
final authServiceProvider =
    Provider<FirebaseAuthService>((ref) => FirebaseAuthService.instance);
