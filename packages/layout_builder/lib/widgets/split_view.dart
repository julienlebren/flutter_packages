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

    return Stack(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 200),
          padding: EdgeInsets.only(left: isOpen ? sideWidth + 1 : 0),
          child: ClipRect(
            child: Navigator(
              key: mainNavigatorKey,
              onGenerateRoute: onGenerateRoute,
              initialRoute: initialMainRoute,
              observers: observers,
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
                  key: sideNavigatorKey,
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

class SplitViewNavigationBar extends PlatformNavigationBar {
  const SplitViewNavigationBar({
    required this.navigatorKey,
    this.title,
    this.middle,
    this.trailing,
  });

  final GlobalKey<NavigatorState> navigatorKey;
  final String? title;
  final Widget? middle;
  final Widget? trailing;

  @override
  CupertinoNavigationBar createCupertinoWidget(
    BuildContext context,
    WidgetRef ref, {
    bool isCupertinoModal = false,
  }) {
    final isOpen = ref.watch(splitViewProvider(navigatorKey));
    final canPop = Navigator.of(context).canPop();

    return CupertinoNavigationBar(
      leading: SplitViewToggleButton(navigatorKey: navigatorKey),
      middle: super.middleWidget(ref),
      trailing: trailing,
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
