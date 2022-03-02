part of platform;

class PlatformElevatedButton
    extends PlatformWidgetBase<ElevatedButton, CupertinoButton> {
  PlatformElevatedButton({
    required this.title,
    this.onPressed,
  }) : super();
  final String title;
  final VoidCallback? onPressed;

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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(elevatedButtonRadius),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(elevatedButtonPadding),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.w400,
          ),
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
          fontWeight: FontWeight.w400,
          letterSpacing: -0.5,
        ),
      ),
    );
  }
}

class PlatformFullSizedElevatedButton extends StatelessWidget {
  PlatformFullSizedElevatedButton({
    required this.title,
    this.onPressed,
  });

  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: PlatformElevatedButton(
        title: title,
        onPressed: onPressed,
      ),
    );
  }
}
