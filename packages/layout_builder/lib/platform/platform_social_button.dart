part of platform;

class PlatformSocialButton
    extends PlatformWidgetBase<ElevatedButton, CupertinoButton> {
  PlatformSocialButton({
    this.assetName,
    this.icon,
    required this.title,
    this.onPressed,
    required this.color,
    required this.textColor,
  }) : super();
  final String? assetName;
  final Widget? icon;
  final String title;
  final VoidCallback? onPressed;
  final Color color;
  final Color textColor;

  @override
  ElevatedButton createMaterialWidget(BuildContext context, WidgetRef ref) {
    final elevatedButtonRadius = ref.watch(
      appThemeProvider.select((appTheme) => appTheme.elevatedButtonRadius),
    );
    final elevatedButtonPadding = ref.watch(
      appThemeProvider.select((appTheme) => appTheme.elevatedButtonPadding),
    );
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(elevatedButtonRadius),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: elevatedButtonPadding),
        child: socialButtonContents,
      ),
      onPressed: onPressed,
    );
  }

  @override
  CupertinoButton createCupertinoWidget(BuildContext context, WidgetRef ref) {
    final elevatedButtonRadius = ref.watch(
      appThemeProvider.select((appTheme) => appTheme.elevatedButtonRadius),
    );
    final elevatedButtonPadding = ref.watch(
      appThemeProvider.select((appTheme) => appTheme.elevatedButtonPadding),
    );
    return CupertinoButton(
      color: color,
      padding: EdgeInsets.all(elevatedButtonPadding),
      borderRadius: BorderRadius.circular(elevatedButtonRadius),
      child: socialButtonContents,
      onPressed: onPressed,
    );
  }

  Widget get socialButtonContents {
    return Row(
      children: <Widget>[
        if (assetName != null)
          Image.asset(
            assetName!,
            width: 30,
            height: 30,
          ),
        if (icon != null)
          SizedBox(
            width: 30,
            height: 30,
            child: Center(child: icon!),
          ),
        Spacer(),
        Text(
          title,
          style: TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.w400,
            color: textColor,
          ),
        ),
        Spacer(),
      ],
    );
  }
}
