part of platform;

class PlatformTextButton
    extends PlatformWidgetBase<TextButton, CupertinoButton> {
  const PlatformTextButton({
    required this.title,
    required this.onPressed,
    this.textAlign = TextAlign.center,
    this.fontSize = 16.0,
    this.padding = 16.0,
    this.color,
  }) : super();

  final String title;
  final VoidCallback? onPressed;
  final TextAlign textAlign;
  final double fontSize;
  final double padding;
  final Color? color;

  @override
  TextButton createMaterialWidget(BuildContext context, WidgetRef ref) {
    return TextButton(
      child: Text(
        title,
        textAlign: textAlign,
      ),
      onPressed: onPressed,
      style: TextButton.styleFrom(
        primary: color,
        textStyle: TextStyle(
          fontSize: fontSize,
        ),
      ),
    );
  }

  @override
  CupertinoButton createCupertinoWidget(BuildContext context, WidgetRef ref) {
    return CupertinoButton(
      padding: EdgeInsets.all(padding),
      alignment: Alignment.center,
      disabledColor: Color(0xFFBDBDBD),
      child: Text(
        title,
        textAlign: textAlign,
        style: TextStyle(
          fontSize: fontSize,
          color: color,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
