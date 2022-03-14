part of platform;

class PlatformScrollbar
    extends PlatformWidgetBase<Scrollbar, CupertinoScrollbar> {
  PlatformScrollbar({
    this.isAlwaysShown = false,
    required this.child,
  });

  final bool isAlwaysShown;
  final Widget child;

  @override
  Scrollbar createMaterialWidget(BuildContext context, WidgetRef ref) {
    return Scrollbar(
      isAlwaysShown: isAlwaysShown,
      child: child,
    );
  }

  @override
  CupertinoScrollbar createCupertinoWidget(
      BuildContext context, WidgetRef ref) {
    return CupertinoScrollbar(
      isAlwaysShown: isAlwaysShown,
      child: child,
    );
  }
}
