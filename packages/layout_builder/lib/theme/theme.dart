library theme;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/services.dart';
import 'package:layout_builder/platform/platform.dart';

part 'theme_providers.dart';
part 'theme_type.dart';
part 'theme.freezed.dart';

@freezed
class AppTheme with _$AppTheme {
  const factory AppTheme({
    required Brightness brightness,
    required Color primaryColor,
    required Color secondaryColor,
    required Color scaffoldBackgroundColor,
    required Color navigationBarBorderColor,
    required Color formBackgroundColor,
    required Color listTileBackground,
    required Color cupertinoBarBackgroundColor,
    required Color selectedColor,
    required Color borderColor,
    required Color textColor,
    required Color dividerColor,
    required Color shadowColor,
  }) = _AppTheme;
}

@freezed
class ListViewTheme with _$ListViewTheme {
  const factory ListViewTheme({
    @Default(15) double separatorPadding,
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
