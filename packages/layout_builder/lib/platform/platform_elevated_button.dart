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
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(17.0),
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
    return CupertinoButton.filled(
      padding: EdgeInsets.all(16.0),
      onPressed: onPressed,
      borderRadius: BorderRadius.circular(32.0),
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
