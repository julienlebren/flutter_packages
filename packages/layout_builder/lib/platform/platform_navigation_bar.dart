part of platform;

/// needsRightTransform pulls the view from 10px right; it's usually used
/// when we use PlatformIconButton on the NavigationBar, to avoid a too bigger
/// space between the icon and the border of the phone (which does not happens
/// woth a text button).
class PlatformNavigationBar extends PlatformWidgetBase<PreferredSizeWidget,
    CupertinoNavigationBar, Padding> {
  const PlatformNavigationBar({
    this.title,
    this.leading,
    this.middle,
    this.trailing,
    this.hasBorder = true,
    this.transitionBetweenRoutes = true,
    this.needsRightTransform = false,
    this.navigatorKey,
  }) : super();

  final String? title;
  final Widget? leading;
  final Widget? middle;
  final Widget? trailing;
  final bool hasBorder;
  final bool transitionBetweenRoutes;
  final bool needsRightTransform;
  final GlobalKey<NavigatorState>? navigatorKey;

  Widget? middleWidget(WidgetRef ref) {
    if (middle != null) {
      return middle!;
    } else if (title != null) {
      return Text(
        title!,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
    }
    return null;
  }

  @override
  PreferredSizeWidget createMaterialWidget(
    BuildContext context,
    WidgetRef ref,
  ) {
    return AppBar(
      title: middleWidget(ref),
      leading: leading,
      actions: trailing != null
          ? [
              Padding(
                padding: EdgeInsets.only(right: 15),
                child: trailing!,
              )
            ]
          : null,
      elevation: (hasBorder ? 2 : 0),
    );
  }

  @override
  CupertinoNavigationBar createCupertinoWidget(
    BuildContext context,
    WidgetRef ref, {
    bool isCupertinoModal = false,
  }) {
    final navigationBarBackgroundColor = ref.watch(
      appThemeProvider
          .select((appTheme) => appTheme.cupertinoNavigationBarBackgroundColor),
    );
    final navigationBarBorderColor = ref.watch(
      appThemeProvider.select((appTheme) => appTheme.navigationBarBorderColor),
    );

    final isOpen = navigatorKey != null
        ? ref.watch(splitViewProvider(navigatorKey!))
        : false;
    final canPop = ModalRoute.of(context)?.canPop ?? false;
    print("isOpen: $isOpen");

    return CupertinoNavigationBar(
      transitionBetweenRoutes: transitionBetweenRoutes,
      backgroundColor: navigationBarBackgroundColor,
      padding: isCupertinoModal
          ? EdgeInsetsDirectional.only(start: 16, top: 0, end: 16, bottom: 10)
          : null,
      border: hasBorder
          ? Border(bottom: BorderSide(color: navigationBarBorderColor))
          : null,
      middle: middleWidget(ref),
      leading: navigatorKey != null
          ? Container(
              transform:
                  Matrix4.translationValues(isOpen && canPop ? -15 : 0, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (!isOpen)
                    SplitViewToggleButton(navigatorKey: navigatorKey!),
                  if (!isOpen && canPop) const SizedBox(width: 10),
                  if (canPop) const CupertinoNavigationBarBackButton(),
                ],
              ),
            )
          : leading,
      trailing: needsRightTransform
          ? Container(
              transform: Matrix4.translationValues(10.0, 0.0, 0.0),
              child: trailing,
            )
          : trailing,
    );
  }

  @override
  Padding createWebWidget(
    BuildContext context,
    WidgetRef ref,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.sliverHorizontalPadding(),
      ),
      child: Container(
        height: 64,
        color: Colors.red,
      ),
    );
  }
}

class NavigationBarButtons extends StatelessWidget {
  const NavigationBarButtons({
    Key? key,
    required this.buttons,
  }) : super(key: key);

  final List<Widget> buttons;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: buttons,
    );
  }
}

class CupertinoNavigationBarBorder extends ConsumerWidget {
  const CupertinoNavigationBarBorder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigationBarBorderColor = ref.watch(
      appThemeProvider.select((appTheme) => appTheme.navigationBarBorderColor),
    );

    return Container(
      color: navigationBarBorderColor,
      height: 0.5,
    );
  }
}
