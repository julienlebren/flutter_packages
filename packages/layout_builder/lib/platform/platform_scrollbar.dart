part of platform;

class PlatformScrollbar
    extends PlatformWidgetBase<Scrollbar, CupertinoScrollbar> {
  PlatformScrollbar({
    this.isAlwaysShown = false,
    this.controller,
    required this.child,
  });

  final ScrollController? controller;
  final bool isAlwaysShown;
  final Widget child;

  @override
  Scrollbar createMaterialWidget(BuildContext context, WidgetRef ref) {
    return Scrollbar(
      controller: controller,
      isAlwaysShown: isAlwaysShown,
      child: child,
    );
  }

  @override
  CupertinoScrollbar createCupertinoWidget(
      BuildContext context, WidgetRef ref) {
    return CupertinoScrollbar(
      controller: controller,
      isAlwaysShown: isAlwaysShown,
      child: child,
    );
  }
}
