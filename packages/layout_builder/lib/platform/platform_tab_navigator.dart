part of platform;

class PlatformTabNavigator
    extends PlatformWidgetBase<Navigator, CupertinoTabView> {
  const PlatformTabNavigator({
    required this.onGenerateRoute,
    required this.navigatorKey,
    this.observers = const <NavigatorObserver>[],
  }) : super();

  final RouteFactory? onGenerateRoute;
  final List<NavigatorObserver> observers;
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Navigator createMaterialWidget(BuildContext context, WidgetRef ref) {
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: onGenerateRoute,
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
