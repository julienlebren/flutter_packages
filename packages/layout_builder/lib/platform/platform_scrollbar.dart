part of platform;

class PlatformScrollbar extends PlatformWidgetBase<ScrollViewVisibilityDetector,
    ScrollViewVisibilityDetector> {
  PlatformScrollbar({
    this.thumbVisibility = false,
    this.controller,
    required this.child,
    this.key,
  });

  final ScrollController? controller;
  final bool thumbVisibility;
  final Widget child;
  final Key? key;

  @override
  ScrollViewVisibilityDetector createMaterialWidget(
      BuildContext context, WidgetRef ref) {
    return ScrollViewVisibilityDetector(
      key: key,
      controller: controller,
      child: Scrollbar(
        controller: controller,
        thumbVisibility: thumbVisibility,
        child: child,
      ),
    );
  }

  @override
  ScrollViewVisibilityDetector createCupertinoWidget(
      BuildContext context, WidgetRef ref) {
    return ScrollViewVisibilityDetector(
      key: key,
      controller: controller,
      child: CupertinoScrollbar(
        controller: controller,
        thumbVisibility: thumbVisibility,
        child: child,
      ),
    );
  }
}

class ScrollViewVisibilityDetector extends ConsumerWidget {
  const ScrollViewVisibilityDetector({
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
