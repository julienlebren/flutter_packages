part of platform;

enum NavigationBarButtonPosition { left, right }

class PlatformNavigationBarButton extends PlatformWidgetBase<Widget, Widget> {
  PlatformNavigationBarButton({
    required this.onPressed,
    this.buttonText,
    this.icon = Icons.check,
    this.position = NavigationBarButtonPosition.right,
    this.color,
  });

  factory PlatformNavigationBarButton.left({
    onPressed,
    buttonText,
    icon,
  }) =>
      PlatformNavigationBarButton(
        onPressed: onPressed,
        buttonText: buttonText,
        icon: icon,
        position: NavigationBarButtonPosition.left,
      );

  factory PlatformNavigationBarButton.right({
    onPressed,
    buttonText,
    icon,
  }) =>
      PlatformNavigationBarButton(
        onPressed: onPressed,
        buttonText: buttonText,
        icon: icon,
        position: NavigationBarButtonPosition.right,
      );

  final VoidCallback? onPressed;
  final String? buttonText;
  final dynamic icon;
  final Color? color;
  final NavigationBarButtonPosition position;

  Widget get iconBuilder {
    if (icon != null) {
      if (icon is IconData) {
        return Icon(icon, size: 28, color: color);
      } else if (icon is AssetImage) {
        return ImageIcon(icon, color: color);
      }
    }
    return SizedBox.shrink();
  }

  @override
  Widget createMaterialWidget(BuildContext context, WidgetRef ref) {
    if (onPressed == null) {
      return SizedBox.shrink();
    } else {
      return Container(
        transform: Matrix4.translationValues(15.0, 0.0, 0.0),
        child: IconButton(
          icon: iconBuilder,
          onPressed: onPressed,
          color: color,
        ),
      );
    }
  }

  @override
  Widget createCupertinoWidget(BuildContext context, WidgetRef ref) {
    return Container(
      transform: Matrix4.translationValues(
        (position == NavigationBarButtonPosition.left || buttonText == null)
            ? 10.0
            : 0.0,
        0.0,
        0.0,
      ),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        child: buttonText != null
            ? Text(
                buttonText!,
                style: TextStyle(
                  color: color,
                ),
              )
            : iconBuilder,
        onPressed: onPressed,
      ),
    );
  }
}

class PlatformNavigationBarSaveButton extends StatelessWidget {
  const PlatformNavigationBarSaveButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return PlatformNavigationBarButton(
      buttonText: MaterialLocalizations.of(context)
          .saveButtonLabel
          .toLowerCase()
          .capitalize(),
      onPressed: onPressed,
    );
  }
}

class PlatformNavigationBarCloseButton
    extends PlatformWidgetBase<Widget, Widget> {
  PlatformNavigationBarCloseButton({
    this.buttonText,
    required this.onPressed,
    this.icon = Icons.close,
  });

  final String? buttonText;
  final VoidCallback onPressed;
  final IconData icon;

  @override
  Widget createMaterialWidget(BuildContext context, WidgetRef ref) {
    return CustomPaint(
      painter: HolePainter(context, ref),
      child: InkWell(
        highlightColor: Colors.grey.shade200,
        splashColor: Colors.transparent,
        onTap: onPressed,
        child: Icon(icon, size: 30),
      ),
    );
  }

  @override
  Widget createCupertinoWidget(BuildContext context, WidgetRef ref) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      child: Text(
        buttonText ??
            MaterialLocalizations.of(context)
                .closeButtonLabel
                .toLowerCase()
                .capitalize(),
      ),
      onPressed: onPressed,
    );
  }
}

class PlatformNavigationBarBackButton extends StatelessWidget {
  PlatformNavigationBarBackButton({
    this.buttonText,
    required this.onPressed,
  });

  final String? buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return PlatformNavigationBarCloseButton(
      buttonText: buttonText,
      onPressed: onPressed,
      icon: Icons.arrow_back,
    );
  }
}

class HolePainter extends CustomPainter {
  HolePainter(this.context, this.ref);
  BuildContext context;
  WidgetRef ref;
  @override
  void paint(Canvas canvas, Size size) {
    final navigationBarBackgroundColor = ref.watch(
      appThemeProvider.select(
        (appTheme) => appTheme.navigationBarBackgroundColor,
      ),
    );
    final paint = Paint();
    paint.color = navigationBarBackgroundColor;
    canvas.drawPath(
      Path.combine(
        PathOperation.difference,
        Path()..addRRect(RRect.fromLTRBR(0, 0, 60, 60, Radius.circular(0))),
        Path()
          ..addOval(Rect.fromCircle(center: Offset(28, 28), radius: 22))
          ..close(),
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
