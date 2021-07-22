part of platform;

class PlatformTabNavigator
    extends PlatformWidgetBase<Navigator, CupertinoTabView> {
  const PlatformTabNavigator({
    required this.onGenerateRoute,
    this.initialRoute,
    required this.navigatorKey,
    this.observers = const <NavigatorObserver>[],
  }) : super();

  final RouteFactory? onGenerateRoute;
  final String? initialRoute;
  final List<NavigatorObserver> observers;
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Navigator createMaterialWidget(BuildContext context, WidgetRef ref) {
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: onGenerateRoute,
      initialRoute: initialRoute,
      observers: observers,
    );
  }

  @override
  CupertinoTabView createCupertinoWidget(BuildContext context, WidgetRef ref) {
    return CupertinoTabView(
      key: navigatorKey,
      onGenerateRoute: onGenerateRoute,
      navigatorObservers: observers,
    );
  }
}
