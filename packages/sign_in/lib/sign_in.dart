library sign_in;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_service/firebase_auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:layout_builder/layout_builder.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

part 'controllers/sign_in_state.dart';
part 'controllers/sign_in_event.dart';
part 'controllers/sign_in_controller.dart';
part 'presentation/sign_in_button.dart';
part 'presentation/sign_in_widget.dart';
part 'sign_in.freezed.dart';

final signInControllerProvider =
    StateNotifierProvider.autoDispose<SignInController, SignInState>((ref) {
  final service = ref.watch(authServiceProvider);
  return SignInController(service);
});

@freezed
class SignInLocalizations with _$SignInLocalizations {
  const factory SignInLocalizations({
    @Default("Continue without registration") String signInAnonymously,
    @Default("Sign in with Google") String signInWithApple,
    @Default("Sign in with Apple") String signInWithGoogle,
    @Default("Sign in with Facebook") String signInWithFacebook,
    @Default("Oops! Something went wrong...") String errorTitle,
  }) = _SignInLocalizations;
}

@freezed
class SignInTheme with _$SignInTheme {
  const factory SignInTheme({
    @Default(400) double maxWidth,
    @Default(5.0) double buttonRadius,
    @Default(16.0) double buttonPadding,
    required Color buttonBackgroundColor,
    required Color buttonTextColor,
    @Default(18.0) double buttonFontSize,
    @Default(15.0) double spaceBetweenButtons,
  }) = _SignInTheme;
}
