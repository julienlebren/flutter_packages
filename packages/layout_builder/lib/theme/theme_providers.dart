part of theme;

/// The provider of the [AppTheme]
/// Needs to be overridden in the [ProviderScope] of the app.
@Riverpod(keepAlive: true)
AppTheme appTheme(AppThemeRef ref) => throw UnimplementedError();

/// This provider is used by [Scaafold] or other widgets that handle
/// an [AnnotatedRegion] to specify the layout of status bars
/// and navigation bar on Android devices.
final systemOverlayStyleProvider = Provider<SystemUiOverlayStyle>((ref) {
  final appTheme = ref.watch(appThemeProvider);

  // workaround because if the user is in dark mode and sets the theme of the app
  // to dark mode, a dark layer is applied to the color passed to systemNavigationBarColor
  // so we cannot get a full white. Instead of producing a weird behaviour with
  // dark buttons and dark background, we skip this feature and keep the black
  // navigation bar. Honestly, so few people will set light mode while their device
  // is in dark mode, isn't it?
  if (appTheme.brightness == Brightness.light &&
      WidgetsBinding.instance.window.platformBrightness == Brightness.dark) {
    return SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  } else {
    return SystemUiOverlayStyle(
      statusBarColor: appTheme.statusBarColor,
      systemNavigationBarColor: appTheme.materialSystemBarColor,
      systemNavigationBarIconBrightness: appTheme.materialSystemBarColor != null
          ? appTheme.materialSystemBarColor!.brightness
          : null,
    );
  }
}, dependencies: [appThemeProvider]);

/// The [ThemeData] that will be used in the [MaterialApp]
/// Retrieves all the data from the [AppTheme].
final materialThemeProvider = Provider<ThemeData>((ref) {
  final appTheme = ref.watch(appThemeProvider);
  return ThemeData(
    brightness: appTheme.brightness,
    scaffoldBackgroundColor: appTheme.scaffoldBackgroundColor,
    primarySwatch: createMaterialColor(appTheme.primaryColor),
    textTheme: kIsWeb ? GoogleFonts.poppinsTextTheme() : null,
    appBarTheme: AppBarTheme(
      toolbarHeight: kIsWeb ? 64 : null,
      shadowColor:
          kIsWeb ? Colors.transparent : appTheme.scaffoldBackgroundColor,
      backgroundColor: kIsWeb
          ? appTheme.webAppBarBackgroundColor
          : appTheme.navigationBarBackgroundColor,
      foregroundColor:
          appTheme.navigationBarBackgroundColor.computeLuminance() > 0.5
              ? Colors.black
              : Colors.white,
      iconTheme: IconThemeData(
        color: appTheme.navigationBarBackgroundColor.computeLuminance() > 0.5
            ? Colors.black
            : Colors.white,
      ),
      actionsIconTheme: IconThemeData(
        color: appTheme.navigationBarBackgroundColor.computeLuminance() > 0.5
            ? Colors.black
            : Colors.white,
      ),
    ),
    dividerColor: appTheme.dividerColor,
    unselectedWidgetColor: Color(0xFF757575),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: appTheme.scaffoldBackgroundColor,
      elevation: 8,
      selectedIconTheme: IconThemeData(
        color: appTheme.primaryColor,
      ),
      selectedItemColor: appTheme.primaryColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: appTheme.primaryColor,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: appTheme.primaryColor,
      ),
    ),
  );
}, dependencies: [appThemeProvider]);

/// The [CupertinoThemeData] that will be used in the [CupertinoApp]
/// Retrieves all the data from the [AppTheme].
final cupertinoThemeProvider = Provider<CupertinoThemeData>((ref) {
  final appTheme = ref.watch(appThemeProvider);
  return CupertinoThemeData(
    brightness: appTheme.brightness,
    primaryColor: appTheme.primaryColor,
    scaffoldBackgroundColor: appTheme.scaffoldBackgroundColor,
    barBackgroundColor: appTheme.cupertinoNavigationBarBackgroundColor,
    /*textTheme: CupertinoTextThemeData(
      primaryColor: appTheme.primaryColor,
      textStyle: GoogleFonts.poppins(),
    ),*/
  );
}, dependencies: [appThemeProvider]);

/// Theme with specific parameters for List that can be overridden
/// at any part of the app with inside a ProviderScope for specific needs
/// (such as have a greater padding in a view).
final listViewThemeProvider = Provider<ListViewTheme>((ref) {
  final appTheme = ref.watch(appThemeProvider);
  return ListViewTheme(
    labelColor: appTheme.textColor,
    valueColor: Color(0xFF939393),
    captionColor: Colors.grey.shade600,
  );
}, dependencies: [appThemeProvider]);

/// Theme with specific parameters for Form hat can be overridden
/// at any part of the app with inside a ProviderScope for specific needs
/// (such as a special backgroundColor in one form).
final formThemeProvider = Provider<FormTheme>((ref) {
  final appTheme = ref.watch(appThemeProvider);
  if (appTheme.brightness == Brightness.dark) {
    return FormTheme(
      backgroundColor: Color(0xFF000000),
      rowBackgroundColor: Color(0xFF262626),
      rowDividerColor: Color(0xFF333333),
      sectionDividerColor: Color(0xFF333333),
    );
  } else {
    return FormTheme(
      backgroundColor: isCupertino() ? Color(0xFFF5F5F5) : Color(0xFFFFFFFF),
      rowBackgroundColor: Color(0xFFFFFFFF),
      rowDividerColor: Color(0xFFE6E6E6),
      sectionDividerColor: Color(0xFFE6E6E6),
    );
  }
}, dependencies: [appThemeProvider]);

/// Provider for localize some words about the theme
final layoutLocalizationsProvider = Provider.autoDispose<LayoutLocalizations>(
  (ref) {
    final locale = ref.watch(localeProvider);
    return lookupLayoutLocalizations(locale);
  },
  dependencies: [localeProvider],
);
