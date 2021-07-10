import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:platform/platform.dart';

class PlatformApp extends PlatformWidgetBase<MaterialApp, CupertinoApp> {
  PlatformApp({
    required this.initialRoute,
    required this.onGenerateRoute,
    required this.localizationsDelegates,
    required this.supportedLocales,
    required this.navigatorKey,
  });

  final String initialRoute;
  final RouteFactory onGenerateRoute;
  final Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates;
  final Iterable<Locale> supportedLocales;
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  MaterialApp createMaterialWidget(BuildContext context, WidgetRef ref) {
    final materialTheme = ref.watch(materialThemeProvider);
    final locale = ref.watch(localeProvider);
    print("Found a lang code: $locale");

    return MaterialApp(
      locale: locale,
      navigatorKey: navigatorKey,
      localizationsDelegates: localizationsDelegates,
      supportedLocales: supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: materialTheme,
      builder: (context, child) {
        return ProviderScope(
          overrides: [
            localizationProvider
                .overrideWithValue(AppLocalizations.of(context)!),
          ],
          child: child!,
        );
      },
      initialRoute: initialRoute,
      onGenerateRoute: onGenerateRoute,
    );
  }

  @override
  CupertinoApp createCupertinoWidget(BuildContext context, WidgetRef ref) {
    final cupertinoTheme = ref.watch(cupertinoThemeProvider);
    final locale = ref.watch(localeProvider);
    print("Found a lang code: $locale");

    return CupertinoApp(
      locale: locale,
      navigatorKey: navigatorKey,
      localizationsDelegates: localizationsDelegates,
      supportedLocales: supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: cupertinoTheme,
      builder: (context, child) {
        return ProviderScope(
          overrides: [
            localizationProvider
                .overrideWithValue(AppLocalizations.of(context)!),
          ],
          child: child!,
        );
      },
      initialRoute: initialRoute,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
