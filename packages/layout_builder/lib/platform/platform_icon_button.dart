part of platform;

class PlatformIconButton
    extends PlatformWidgetBase<IconButton, CupertinoButton, IconButton> {
  PlatformIconButton({
    required this.icon,
    this.color,
    this.size = 28,
    this.onPressed,
  }) : super();

  final IconData icon;
  final double? size;
  final Color? color;
  final VoidCallback? onPressed;

  @override
  IconButton createMaterialWidget(BuildContext context, WidgetRef ref) {
    return IconButton(
      icon: Icon(icon),
      color: color,
      iconSize: size,
      onPressed: onPressed,
    );
  }

  @override
  CupertinoButton createCupertinoWidget(BuildContext context, WidgetRef ref) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      borderRadius: BorderRadius.circular(32.0),
      child: Icon(
        icon,
        size: size,
        color: color,
      ),
    );
  }

  @override
  IconButton createWebWidget(BuildContext context, WidgetRef ref) =>
      createMaterialWidget(context, ref);
}

class PlatformIconPlainButton extends PlatformWidgetBase<RawMaterialButton,
    CupertinoButton, RawMaterialButton> {
  PlatformIconPlainButton({
    required this.icon,
    this.onPressed,
    this.backgroundColor = Colors.transparent,
    this.color = Colors.black,
    this.size = 22,
  }) : super();
  final IconData icon;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color color;
  final double size;

  @override
  RawMaterialButton createMaterialWidget(BuildContext context, WidgetRef ref) {
    return RawMaterialButton(
      onPressed: onPressed,
      fillColor: backgroundColor,
      child: Icon(icon, color: color, size: size),
      padding: EdgeInsets.all(8.0),
      shape: CircleBorder(),
    );
  }

  @override
  CupertinoButton createCupertinoWidget(BuildContext context, WidgetRef ref) {
    return CupertinoButton(
      color: backgroundColor,
      padding: EdgeInsets.all(6.0),
      onPressed: onPressed,
      borderRadius: BorderRadius.circular(size + 4),
      child: Icon(icon, color: color, size: size + 2),
      minSize: 28,
    );
  }

  @override
  RawMaterialButton createWebWidget(BuildContext context, WidgetRef ref) =>
      createMaterialWidget(context, ref);
}
