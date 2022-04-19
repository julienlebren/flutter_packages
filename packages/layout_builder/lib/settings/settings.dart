library settings;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:layout_builder/form/form.dart';
import 'package:layout_builder/platform/platform.dart';
import 'package:layout_builder/theme/theme.dart';

part 'settings_page_builder.dart';

part 'settings.freezed.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.initial() = _Initial;
  const factory SettingsState.saving() = _Saving;
  const factory SettingsState.error(String errorText) = _Error;
  const factory SettingsState.success() = _Success;
}
