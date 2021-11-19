part of platform;

class PlatformTabNavigator
    extends PlatformWidgetBase<Navigator, CupertinoTabView> {
  const PlatformTabNavigator({
    required this.onGenerateRoute,
    this.initialRoute,
    required this.navigatorKey,
    this.observers = const <NavigatorObserver>[],
    this.onUnknownRoute,
  }) : super();

  final RouteFactory? onGenerateRoute;
  final String? initialRoute;
  final List<NavigatorObserver> observers;
  final GlobalKey<NavigatorState> navigatorKey;
  final RouteFactory? onUnknownRoute;

  @override
  Navigator createMaterialWidget(BuildContext context, WidgetRef ref) {
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: onGenerateRoute,
      initialRoute: initialRoute,
      observers: observers,
      onUnknownRoute: onUnknownRoute,
    );
  }

  @override
  CupertinoTabView createCupertinoWidget(BuildContext context, WidgetRef ref) {
    return CupertinoTabView(
      navigatorKey: navigatorKey,
      onGenerateRoute: onGenerateRoute,
      navigatorObservers: observers,
      onUnknownRoute: onUnknownRoute,
    );
  }
}
