part of platform;

class PlatformApp extends PlatformWidgetBase<MaterialApp, CupertinoApp> {
  PlatformApp({
    this.initialRoute,
    this.onGenerateRoute,
    this.localizationsDelegates,
    required this.supportedLocales,
    this.navigatorKey,
    this.builder,
    this.locale,
    this.home,
  }) : assert(
            (initialRoute != null && onGenerateRoute != null) || home != null);

  final String? initialRoute;
  final RouteFactory? onGenerateRoute;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final Iterable<Locale> supportedLocales;
  final GlobalKey<NavigatorState>? navigatorKey;
  final Widget Function(BuildContext context, Widget? child)? builder;
  final Locale? locale;
  final Widget? home;

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
      home: home,
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
      home: home,
    );
  }
}
