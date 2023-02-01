part of platform;

class PlatformApp extends PlatformWidgetBase<ProviderScope, ProviderScope> {
  PlatformApp({
    this.initialRoute,
    required this.onGenerateRoute,
    this.localizationsDelegates,
    required this.supportedLocales,
    this.navigatorKey,
    this.builder,
    this.locale,
    this.home,
  }) : assert(initialRoute != null || home != null);

  final String? initialRoute;
  final RouteFactory onGenerateRoute;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final Iterable<Locale> supportedLocales;
  final GlobalKey<NavigatorState>? navigatorKey;
  final Widget Function(BuildContext context, Widget? child)? builder;
  final Locale? locale;
  final Widget? home;

  @override
  ProviderScope createMaterialWidget(BuildContext context, WidgetRef ref) {
    final materialTheme = ref.watch(materialThemeProvider);
    return ProviderScope(
      overrides: [
        routeProvider.overrideWithValue(onGenerateRoute),
      ],
      child: MaterialApp(
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
      ),
    );
  }

  @override
  ProviderScope createCupertinoWidget(BuildContext context, WidgetRef ref) {
    final cupertinoTheme = ref.watch(cupertinoThemeProvider);
    return ProviderScope(
      overrides: [
        routeProvider.overrideWithValue(onGenerateRoute),
      ],
      child: CupertinoApp(
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
      ),
    );
  }
}
