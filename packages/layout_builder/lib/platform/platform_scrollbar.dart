part of platform;

class PlatformScrollbar
    extends PlatformWidgetBase<Scrollbar, CupertinoScrollbar> {
  PlatformScrollbar({
    this.thumbVisibility = false,
    this.controller,
    required this.child,
  });

  final ScrollController? controller;
  final bool thumbVisibility;
  final Widget child;

  @override
  Scrollbar createMaterialWidget(BuildContext context, WidgetRef ref) {
    return Scrollbar(
      controller: controller,
      thumbVisibility: thumbVisibility,
      child: child,
    );
  }

  @override
  CupertinoScrollbar createCupertinoWidget(
      BuildContext context, WidgetRef ref) {
    return CupertinoScrollbar(
      controller: controller,
      thumbVisibility: thumbVisibility,
      child: child,
    );
  }
}
