part of platform;

/// needsRightTransform pulls the view from 10px right; it's usually used
/// when we use PlatformIconButton on the NavigationBar, to avoid a too bigger
/// space between the icon and the border of the phone (which does not happens
/// woth a text button).
class PlatformNavigationBar
    extends PlatformWidgetBase<PreferredSizeWidget, CupertinoNavigationBar> {
  const PlatformNavigationBar({
    this.title,
    this.leading,
    this.middle,
    this.trailing,
    this.hasBorder = true,
    this.transitionBetweenRoutes = true,
    this.needsRightTransform = false,
  }) : super();

  final String? title;
  final Widget? leading;
  final Widget? middle;
  final Widget? trailing;
  final bool hasBorder;
  final bool transitionBetweenRoutes;
  final bool needsRightTransform;

  Widget? middleWidget(WidgetRef ref) {
    final textColor = ref.watch(
      appThemeProvider.select((appTheme) => appTheme.textColor),
    );
    if (middle != null) {
      return middle!;
    } else if (title != null) {
      return Text(title!, style: TextStyle(color: textColor));
    }
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
    final navigationBarBorderColor = ref.watch(
      appThemeProvider.select((appTheme) => appTheme.navigationBarBorderColor),
    );
    return CupertinoNavigationBar(
      transitionBetweenRoutes: transitionBetweenRoutes,
      padding: isCupertinoModal
          ? EdgeInsetsDirectional.only(start: 16, top: 0, end: 16, bottom: 10)
          : null,
      border: hasBorder
          ? Border(bottom: BorderSide(color: navigationBarBorderColor))
          : null,
      middle: middleWidget(ref),
      leading: leading,
      trailing: needsRightTransform
          ? Container(
              transform: Matrix4.translationValues(10.0, 0.0, 0.0),
              child: trailing,
            )
          : trailing,
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
