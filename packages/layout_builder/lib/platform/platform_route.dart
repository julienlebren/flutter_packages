part of platform;

PageRoute<T> platformPageRoute<T>({
  required WidgetBuilder builder,
  RouteSettings? settings,
  bool maintainState = true,
  bool fullscreenDialog = false,
  bool withoutTransition = false,
  String? iosTitle,
}) {
  if (withoutTransition) {
    return PageRouteBuilder(
      pageBuilder: (context, _, __) => builder.call(context),
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
    );
  } else if (isMaterial()) {
    return MaterialPageRoute<T>(
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
