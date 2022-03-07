part of platform;

class GroupedListView extends ConsumerWidget {
  const GroupedListView({
    Key? key,
    required this.sections,
  }) : super(key: key);

  final List<GroupedListSection> sections;

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
          for (final section in sections) ...section.render(context),
          SliverSafeArea(
            sliver: SliverPadding(padding: EdgeInsets.only(bottom: 18)),
          ),
        ],
      ),
    );
  }
}

class GroupedListSection {
  const GroupedListSection({
    this.title,
    this.caption,
    this.child,
    this.children,
  }) : assert((child != null || children != null));

  final String? title;
  final String? caption;
  final Widget? child;
  final List<Widget>? children;

  List<Widget> render(BuildContext context) {
    return [
      SliverToBoxAdapter(
        child: SizedBox(height: 18),
      ),
      if (title != null)
        SliverToBoxAdapter(child: GroupedListSectionTitle(title!)),
      if (children != null) ...[
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              if (index.isOdd) {
                return isCupertino() ? const ListDivider() : SizedBox.shrink();
              }
              return GroupedListRow(
                isFirst: index == 0,
                isLast: index == (children!.length * 2 - 2),
                child: children![index ~/ 2],
              );
            },
            childCount: (children!.length * 2) - 1,
          ),
        ),
      ] else
        SliverToBoxAdapter(
          child: GroupedListRow(
            child: child!,
          ),
        ),
      if (caption != null)
        SliverToBoxAdapter(
          child: GroupedListSectionCaption(caption!),
        ),
    ];
  }
}

class GroupedListSectionLoader extends GroupedListSection {
  GroupedListSectionLoader()
      : super(
          child: SliverToBoxAdapter(
            child: const Center(
              child: Center(
                child: PlatformActivityIndicator(),
              ),
            ),
          ),
        );
}

class GroupedListSectionError extends GroupedListSection {
  GroupedListSectionError(this.errorText)
      : super(
          child: SliverToBoxAdapter(
            child: Center(
              child: Text(
                errorText,
                style: TextStyle(color: Colors.red),
              ),
            ),
          ),
        );

  final String errorText;
}

class GroupedListSectionTitle extends PlatformWidgetBase<Container, Container> {
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
        top: 5,
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
}

class GroupedListRow extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: isFirst ? Radius.circular(10.0) : Radius.zero,
        topRight: isFirst ? Radius.circular(10.0) : Radius.zero,
        bottomLeft: isLast ? Radius.circular(10.0) : Radius.zero,
        bottomRight: isLast ? Radius.circular(10.0) : Radius.zero,
      ),
      child: child,
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
