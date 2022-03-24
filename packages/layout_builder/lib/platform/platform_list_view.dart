part of platform;

class PlatformListView extends PlatformWidgetBase<ListView, ListView> {
  const PlatformListView({
    required this.itemCount,
    required this.itemBuilder,
    this.controller,
    this.shrinkWrap = false,
    this.scrollPhysics = const AlwaysScrollableScrollPhysics(),
    this.isModal = false,
  }) : super();

  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final ScrollController? controller;
  final bool shrinkWrap;
  final ScrollPhysics scrollPhysics;
  final bool isModal;

  @override
  ListView createMaterialWidget(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: itemBuilder,
      controller: controller,
      shrinkWrap: shrinkWrap,
    );
  }

  @override
  ListView createCupertinoWidget(BuildContext context, WidgetRef ref) {
    final safePadding = isModal ? MediaQuery.of(context).padding.bottom : 0.0;

    return ListView.separated(
      physics: scrollPhysics,
      padding: EdgeInsets.only(bottom: safePadding),
      itemCount: itemCount,
      itemBuilder: itemBuilder,
      controller: controller,
      shrinkWrap: shrinkWrap,
      separatorBuilder: (_, __) => const ListDivider(),
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
