import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layout_builder/platform/platform_widget_base.dart';
import 'package:layout_builder/theme/theme.dart';

class PlatformApp extends PlatformWidgetBase<MaterialApp, CupertinoApp> {
  PlatformApp({
    required this.initialRoute,
    required this.onGenerateRoute,
    required this.localizationsDelegates,
    required this.supportedLocales,
    required this.navigatorKey,
    this.builder,
    this.locale,
  });

  final String initialRoute;
  final RouteFactory onGenerateRoute;
  final Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates;
  final Iterable<Locale> supportedLocales;
  final GlobalKey<NavigatorState> navigatorKey;
  final Widget Function(BuildContext context, Widget? child)? builder;
  final Locale? locale;

  @override
  MaterialApp createMaterialWidget(BuildContext context, WidgetRef ref) {
    final materialTheme = ref.watch(materialThemeProvider);
    return MaterialApp(
      locale: locale,
      navigatorKey: navigatorKey,
      localizationsDelegates: localizationsDelegates,
      supportedLocales: supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: materialTheme,
      builder: builder,
      initialRoute: initialRoute,
      onGenerateRoute: onGenerateRoute,
    );
  }

  @override
  CupertinoApp createCupertinoWidget(BuildContext context, WidgetRef ref) {
    final cupertinoTheme = ref.watch(cupertinoThemeProvider);
    return CupertinoApp(
      locale: locale,
      navigatorKey: navigatorKey,
      localizationsDelegates: localizationsDelegates,
      supportedLocales: supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: cupertinoTheme,
      builder: builder,
      initialRoute: initialRoute,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
