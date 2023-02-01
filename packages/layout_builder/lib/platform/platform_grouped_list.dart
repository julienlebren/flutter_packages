part of platform;

class GroupedListView extends ConsumerWidget {
  const GroupedListView({
    Key? key,
    required this.children,
  }) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(appThemeProvider);
    return Container(
      color: appTheme.groupedListBackgroundColor,
      padding: EdgeInsets.symmetric(
        horizontal: isCupertino() ? 18 : 0,
      ),
      child: CustomScrollView(
        slivers: [
          ...children,
          SliverSafeArea(
            sliver: SliverPadding(
              padding: EdgeInsets.only(bottom: 18),
            ),
          ),
        ],
      ),
    );
  }
}

class GroupedListSection extends ConsumerWidget {
  const GroupedListSection({
    Key? key,
    this.title,
    this.caption,
    this.child,
    this.children,
  }) : assert((child != null || children != null));

  final String? title;
  final String? caption;
  final Widget? child;
  final List<Widget>? children;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          if (index == 0) {
            if (title != null) {
              return GroupedListSectionTitle(title!);
            } else {
              return SizedBox(height: 15);
            }
          } else if (index == (children!.length * 2) + 1) {
            if (caption != null) {
              return GroupedListSectionCaption(caption!);
            } else {
              return SizedBox.shrink();
            }
          } else {
            if (!index.isOdd) {
              return isCupertino() ? const ListDivider() : SizedBox.shrink();
            }
            return GroupedListRow(
              isFirst: index == 1,
              isLast: index == (children!.length * 2 - 1),
              child: children![index ~/ 2],
            );
          }
        },
        childCount: (children!.length * 2) + 1,
      ),
    );
  }
}

class GroupedListSectionTitle
    extends PlatformWidgetBase<Container, Container, Container> {
  const GroupedListSectionTitle(this.title) : super();

  final String title;

  @override
  Container createMaterialWidget(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(appThemeProvider);
    final formTheme = ref.watch(formThemeProvider);
    return Container(
      width: double.infinity,
      color: formTheme.backgroundColor,
      padding: EdgeInsets.only(
        left: 15,
        bottom: 0,
        top: 15,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w800,
          color: appTheme.textColor,
        ),
      ),
    );
  }

  @override
  Container createCupertinoWidget(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      color: Colors.transparent,
      padding: EdgeInsets.only(
        left: 15,
        bottom: 5,
        top: 20,
      ),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: Color(0xFF757575),
        ),
      ),
    );
  }

  @override
  Container createWebWidget(BuildContext context, WidgetRef ref) =>
      createMaterialWidget(context, ref);
}

class GroupedListRow extends ConsumerWidget {
  const GroupedListRow({
    Key? key,
    this.isFirst = true,
    this.isLast = true,
    required this.child,
  }) : super(key: key);

  final bool isFirst;
  final bool isLast;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: isFirst ? Radius.circular(10.0) : Radius.zero,
        topRight: isFirst ? Radius.circular(10.0) : Radius.zero,
        bottomLeft: isLast ? Radius.circular(10.0) : Radius.zero,
        bottomRight: isLast ? Radius.circular(10.0) : Radius.zero,
      ),
      child: (() {
        if (child is PlatformListTile || child is FormElement) {
          return child;
        } else {
          final backgroundColor = ref.watch(
            appThemeProvider.select((appTheme) => appTheme.listTileBackground),
          );
          return ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: isCupertino() ? 48.0 : 53.0,
            ),
            child: Container(
              color: backgroundColor,
              padding: EdgeInsets.only(left: 15, right: isCupertino() ? 8 : 15),
              child: Center(child: child),
            ),
          );
        }
      }()),
    );
  }
}

class GroupedListSectionCaption extends StatelessWidget {
  const GroupedListSectionCaption(this.caption, {Key? key}) : super(key: key);
  final String caption;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: isCupertino() ? 8 : 0,
        left: 15,
        right: 15,
        bottom: isMaterial() ? 8 : 0,
      ),
      child: Text(
        caption,
        overflow: TextOverflow.clip,
        style: TextStyle(
          fontSize: isCupertino() ? 14 : 13,
          color: Colors.grey.shade600,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}
