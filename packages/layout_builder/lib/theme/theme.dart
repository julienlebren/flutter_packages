// ignore_for_file: unused_import

library theme;

import 'package:extensions/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:layout_builder/platform/platform.dart';
import 'package:layout_builder/theme/material_color.dart';
import 'package:layout_builder/l10n/layout_localizations.dart';
import 'package:localization/localization.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_providers.dart';
part 'theme_type.dart';
part 'theme.freezed.dart';
part 'theme.g.dart';

@freezed
class AppTheme with _$AppTheme {
  const factory AppTheme({
    required Brightness brightness,
    required Color primaryColor,
    required Color secondaryColor,
    required Color scaffoldBackgroundColor,
    Color? statusBarColor,
    Color? materialSystemBarColor,
    required Color navigationBarBackgroundColor,
    required Color navigationBarBorderColor,
    Color? cupertinoNavigationBarBackgroundColor,
    Color? webAppBarBackgroundColor,
    Color? tabBarBackgroundColor,
    Color? cupertinoTabBarBackgroundColor,
    required Color groupedListBackgroundColor,
    required Color listTileBackground,
    @Default(5.0) double elevatedButtonRadius,
    @Default(16.0) double elevatedButtonPadding,
    @Default(24.0) double searchBarRadius,
    required Color selectedColor,
    required Color borderColor,
    required Color textColor,
    required Color dividerColor,
    required Color shadowColor,
    required Color disclosureIndicatorColor,
  }) = _AppTheme;
}

@freezed
class ListViewTheme with _$ListViewTheme {
  const factory ListViewTheme({
    @Default(15) double separatorPadding,
    required Color labelColor,
    required Color valueColor,
    @Default(false) bool valueColorEnforced,
    @Default(17) double labelFontSize,
    required Color captionColor,
    @Default(13) double captionFontSize,
    @Default(1) int? labelMaxLines,
    @Default(1) int? captionMaxLines,
  }) = _ListViewTheme;
}

@freezed
class FormTheme with _$FormTheme {
  const factory FormTheme({
    required Color backgroundColor,
    required Color rowBackgroundColor,
    required Color rowDividerColor,
    required Color sectionDividerColor,
    @Default(15) double rowDividerPadding,
    @Default(true) bool displayRowDivider,
    @Default(10) double sectionDividerPadding, // 20 if gray background
    @Default(true) bool displaySectionDivider,
  }) = _FormTheme;
}
