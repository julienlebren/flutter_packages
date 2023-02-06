part of 'widgets.dart';

final splitViewProvider =
    StateProvider.family<bool, GlobalKey<NavigatorState>>((_, __) => true);

final isInsideSplitViewProvider = Provider<bool>((_) => false);

class SplitView extends ConsumerWidget {
  SplitView({
    required this.onGenerateRoute,
    required this.initialSideRoute,
    required this.initialMainRoute,
    this.observers = const <NavigatorObserver>[],
    this.sideWidth = 370,
    GlobalKey<NavigatorState>? sideNavigatorKey,
    GlobalKey<NavigatorState>? mainNavigatorKey,
    Key? key,
  })  : _sideNavigatorKey = sideNavigatorKey ?? GlobalKey<NavigatorState>(),
        _mainNavigatorKey = mainNavigatorKey ?? GlobalKey<NavigatorState>(),
        super(key: key);

  final RouteFactory onGenerateRoute;
  final String initialSideRoute;
  final String initialMainRoute;
  final List<NavigatorObserver> observers;
  final double sideWidth;

  final GlobalKey<NavigatorState> _sideNavigatorKey;
  final GlobalKey<NavigatorState> _mainNavigatorKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isOpen = ref.watch(splitViewProvider(_mainNavigatorKey));

    return Stack(
      children: [
        ProviderScope(
          overrides: [
            isInsideSplitViewProvider.overrideWithValue(true),
          ],
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            padding: EdgeInsets.only(left: isOpen ? sideWidth + 1 : 0),
            child: ClipRect(
              child: Navigator(
                key: _mainNavigatorKey,
                onGenerateRoute: onGenerateRoute,
                initialRoute: initialMainRoute,
                observers: observers,
              ),
            ),
          ),
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 200),
          transform:
              Matrix4.translationValues(isOpen ? 0 : -(sideWidth + 1), 0, 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: sideWidth,
                child: Navigator(
                  key: _sideNavigatorKey,
                  onGenerateRoute: onGenerateRoute,
                  initialRoute: initialSideRoute,
                  observers: observers,
                ),
              ),
              const VerticalDivider(width: 1),
            ],
          ),
        ),
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
