import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme/theme.dart';

/// The provider of the [AppTheme]
/// Needs to be overridden in tne [ProviderScope] of the app
final appThemeProvider = Provider<AppTheme>((_) => throw UnimplementedError());

/// This provider is used by [Scaafold] or other widgets that handle
/// an [AnnotatedRegion] to specify the layout of status bars
/// and navigation bar on Android devices
final systemOverlayStyleProvider = Provider<SystemUiOverlayStyle>((ref) {
  final appTheme = ref.watch(appThemeProvider);

  if (appTheme.brightness == Brightness.dark) {
    return SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: appTheme.scaffoldBackgroundColor,
      systemNavigationBarIconBrightness: Brightness.light,
    );
  } else {
    // workaround because if the user is in dark mode and sets the theme of the app
    // to dark mode, a dark layer is applied to the color passed to systemNavigationBarColor
    // so we cannot get a full white. Instead of producing a weird behaviour with
    // dark buttons and dark background, we skip this feature and keep the black
    // navigation bar. Honestly, so few people will set light mode while their device
    // is in dark mode, isn't it?
    if (WidgetsBinding.instance!.window.platformBrightness == Brightness.dark) {
      return SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    } else {
      return SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: appTheme.scaffoldBackgroundColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      );
    }
  }
});

final materialThemeProvider = Provider<ThemeData>((ref) {
  final appTheme = ref.watch(appThemeProvider);
  return ThemeData(
    brightness: appTheme.brightness,
    scaffoldBackgroundColor: appTheme.scaffoldBackgroundColor,
    primaryColor: appTheme.primaryColor,
    accentColor: appTheme.primaryColor,
    appBarTheme: AppBarTheme(
      shadowColor: appTheme.scaffoldBackgroundColor,
      backgroundColor: appTheme.scaffoldBackgroundColor,
      backwardsCompatibility: false,
      foregroundColor: appTheme.textColor,
      iconTheme: IconThemeData(color: Colors.grey),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: appTheme.scaffoldBackgroundColor,
      elevation: 8,
    ),
  );
});

final cupertinoThemeProvider = Provider<CupertinoThemeData>((ref) {
  final appTheme = ref.watch(appThemeProvider);
  return CupertinoThemeData(
    primaryColor: appTheme.primaryColor,
    scaffoldBackgroundColor: appTheme.scaffoldBackgroundColor,
    barBackgroundColor: appTheme.scaffoldBackgroundColor,
  );
});
