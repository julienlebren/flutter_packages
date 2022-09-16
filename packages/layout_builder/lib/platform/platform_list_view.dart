part of platform;

class PlatformListView
    extends PlatformWidgetBase<ListVisibilityDetector, ListVisibilityDetector> {
  const PlatformListView({
    required this.itemCount,
    required this.itemBuilder,
    this.controller,
    this.shrinkWrap = false,
    this.scrollPhysics = const AlwaysScrollableScrollPhysics(),
    this.isModal = false,
    this.key,
  }) : super();

  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final ScrollController? controller;
  final bool shrinkWrap;
  final ScrollPhysics scrollPhysics;
  final bool isModal;
  final Key? key;

  @override
  ListVisibilityDetector createMaterialWidget(
      BuildContext context, WidgetRef ref) {
    return ListVisibilityDetector(
      key: key,
      controller: controller,
      child: ListView.builder(
        itemCount: itemCount,
        itemBuilder: itemBuilder,
        controller: controller,
        shrinkWrap: shrinkWrap,
      ),
    );
  }

  @override
  ListVisibilityDetector createCupertinoWidget(
      BuildContext context, WidgetRef ref) {
    final safePadding = isModal ? MediaQuery.of(context).padding.bottom : 0.0;

    return ListVisibilityDetector(
      key: key,
      controller: controller,
      child: ListView.separated(
        physics: scrollPhysics,
        padding: EdgeInsets.only(bottom: safePadding),
        itemCount: itemCount,
        itemBuilder: itemBuilder,
        controller: controller,
        shrinkWrap: shrinkWrap,
        separatorBuilder: (_, __) => const ListDivider(),
      ),
    );
  }
}

class ListVisibilityDetector extends ConsumerWidget {
  const ListVisibilityDetector({
    this.controller,
    required this.child,
    Key? key,
  }) : super(key: key);

  final ScrollController? controller;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return VisibilityDetector(
      key: key ?? UniqueKey(),
      onVisibilityChanged: (visibilityInfo) {
        print(
            'Widget ${visibilityInfo.key} is ${visibilityInfo.visibleFraction}% visible');
        if (controller != null) {
          if (visibilityInfo.visibleFraction == 1) {
            ref.read(scrollControllerProvider.state).state = controller;
          }
        }
      },
      child: child,
    );
  }
}

class ListDivider extends ConsumerWidget {
  const ListDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listViewTheme = ref.watch(listViewThemeProvider);
    final appTheme = ref.watch(appThemeProvider);
    return Container(
      color: appTheme.listTileBackground,
      padding: EdgeInsets.only(left: listViewTheme.separatorPadding),
      child: Divider(
        color: appTheme.dividerColor,
        height: 0.5,
      ),
    );
  }
}
