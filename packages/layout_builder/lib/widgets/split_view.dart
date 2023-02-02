part of 'widgets.dart';

final splitViewProvider =
    StateProvider.family<bool, GlobalKey<NavigatorState>>((_, __) => true);

class SplitView extends ConsumerWidget {
  const SplitView({
    required this.onGenerateRoute,
    required this.initialSideRoute,
    required this.initialMainRoute,
    required this.sideNavigatorKey,
    required this.mainNavigatorKey,
    this.observers = const <NavigatorObserver>[],
    this.sideWidth = 370,
    Key? key,
  }) : super(key: key);

  final RouteFactory onGenerateRoute;
  final String initialSideRoute;
  final String initialMainRoute;
  final List<NavigatorObserver> observers;
  final GlobalKey<NavigatorState> sideNavigatorKey;
  final GlobalKey<NavigatorState> mainNavigatorKey;
  final double sideWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isOpen = ref.watch(splitViewProvider(mainNavigatorKey));
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 200),
          width: isOpen ? (screenWidth - sideWidth - 1) : screenWidth,
          child: ClipRect(
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

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 200),
          width: isOpen ? sideWidth : 0,
          child: SizedBox(
            width: sideWidth,
            child: Navigator(
              key: sideNavigatorKey,
              onGenerateRoute: onGenerateRoute,
              initialRoute: initialSideRoute,
              observers: observers,
            ),
          ),
        ),
        const VerticalDivider(width: 1),
        AnimatedContainer(
          duration: Duration(milliseconds: 200),
          width: isOpen
              ? (screenWidth - sideWidth - 1)
              : (screenWidth - sideWidth - 1),
          child: ClipRect(
            child: Navigator(
              key: mainNavigatorKey,
              onGenerateRoute: onGenerateRoute,
              initialRoute: initialMainRoute,
              observers: observers,
            ),
          ),
        ),
        /*
        Expanded(
          child: ClipRect(
            child: AnimatedSize(
              curve: Curves.easeIn,
              duration: const Duration(seconds: 1),
              child: Navigator(
                key: mainNavigatorKey,
                onGenerateRoute: onGenerateRoute,
                initialRoute: initialMainRoute,
                observers: observers,
              ),
            ),
          ),
        ),*/
      ],
    );
  }
}

class SplitViewToggleButton extends ConsumerWidget {
  const SplitViewToggleButton({
    required this.navigatorKey,
    super.key,
  });

  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PlatformNavigationBarButton(
      icon: CupertinoIcons.sidebar_left,
      onPressed: () {
        ref.read(splitViewProvider(navigatorKey).notifier).state =
            !ref.read(splitViewProvider(navigatorKey));
      },
    );
  }
}
