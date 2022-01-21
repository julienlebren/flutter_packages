library sign_in;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_service/firebase_auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:layout_builder/layout_builder.dart';
import 'package:sign_in/presentation/apple_logo.dart';
import 'package:sign_in/presentation/google_logo.dart';

part 'controllers/sign_in_controller.dart';
part 'core/enums/sign_in_providers.dart';
part 'core/models/auth_state.dart';
part 'core/models/sign_in_event.dart';
part 'core/models/sign_in_localizations.dart';
part 'core/models/sign_in_state.dart';
part 'core/models/sign_in_theme.dart';
part 'presentation/sign_in_button.dart';
part 'presentation/sign_in_widget.dart';
part 'providers/auth.dart';
part 'sign_in.freezed.dart';

final signInControllerProvider =
    StateNotifierProvider<SignInController, SignInState>((ref) {
  final service = ref.watch(authServiceProvider);
  return SignInController(service);
});
