part of platform;

PageRoute<T> platformPageRoute<T>({
  //required WidgetBuilder builder,
  required Widget child,
  RouteSettings? settings,
  bool maintainState = true,
  bool fullscreenDialog = false,
  String? iosTitle,
}) {
  if (isMaterial()) {
    return PageTransition(child: child, type: PageTransitionType.scale);
    /*return MaterialPageRoute<T>(
      builder: builder,
      settings: settings,
      maintainState: maintainState,
      fullscreenDialog: fullscreenDialog,
    );*/
  } else {
    return MaterialWithModalsPageRoute<T>(
      builder: (_) => child,
      settings: settings,
      maintainState: maintainState,
      fullscreenDialog: fullscreenDialog,
      //title: iosTitle,
    );
  }
}

PageRoute<T> platformRightToLeftRoute<T>({
  required WidgetBuilder builder,
  RouteSettings? settings,
  bool maintainState = true,
  bool fullscreenDialog = false,
  String? iosTitle,
}) {
  if (isMaterial()) {
    return CupertinoPageRoute<T>(
      builder: builder,
      settings: settings,
      maintainState: maintainState,
      fullscreenDialog: fullscreenDialog,
    );
  } else {
    return MaterialWithModalsPageRoute<T>(
      builder: builder,
      settings: settings,
      maintainState: maintainState,
      fullscreenDialog: fullscreenDialog,
    );
  }
}
