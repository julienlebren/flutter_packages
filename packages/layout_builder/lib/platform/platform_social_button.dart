part of platform;

class PlatformSocialButton
    extends PlatformWidgetBase<ElevatedButton, CupertinoButton> {
  PlatformSocialButton({
    required this.assetName,
    required this.title,
    this.onPressed,
    required this.color,
    required this.textColor,
  }) : super();
  final String assetName;
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
        child: Row(
          children: <Widget>[
            Image.asset(assetName),
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
        ),
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
    return CupertinoButton.filled(
      padding: EdgeInsets.all(elevatedButtonPadding),
      onPressed: onPressed,
      borderRadius: BorderRadius.circular(elevatedButtonRadius),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
