part of platform;

class PlatformScrollbar
    extends PlatformWidgetBase<Scrollbar, CupertinoScrollbar, Scrollbar> {
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

  @override
  Scrollbar createWebWidget(BuildContext context, WidgetRef ref) =>
      createMaterialWidget(context, ref);
}

/*
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
            ref.read(scrollControllerProvider.notifier).state = controller;
          }
        }
      },
      child: child,
    );
  }
}
*/