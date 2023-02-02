part of 'widgets.dart';

class SplitView extends StatelessWidget {
  const SplitView({
    required this.onGenerateRoute,
    required this.initialSideRoute,
    required this.initialMainRoute,
    required this.sideNavigatorKey,
    required this.mainNavigatorKey,
    this.observers = const <NavigatorObserver>[],
    Key? key,
  }) : super(key: key);

  final RouteFactory onGenerateRoute;
  final String initialSideRoute;
  final String initialMainRoute;
  final List<NavigatorObserver> observers;
  final GlobalKey<NavigatorState> sideNavigatorKey;
  final GlobalKey<NavigatorState> mainNavigatorKey;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 370,
          child: Navigator(
            key: sideNavigatorKey,
            onGenerateRoute: onGenerateRoute,
            initialRoute: initialSideRoute,
            observers: observers,
          ),
        ),
        const VerticalDivider(width: 1),
        ClipRect(
          child: Expanded(
            child: Navigator(
              key: mainNavigatorKey,
              onGenerateRoute: onGenerateRoute,
              initialRoute: initialMainRoute,
              observers: observers,
            ),
          ),
        ),
      ],
    );
  }
}
