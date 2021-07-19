part of platform;

/*
class PlatformNavigationBarButton extends PlatformWidgetBase<Widget, Widget> {
  PlatformNavigationBarButton({
    required this.onPressed,
    this.buttonText,
    this.icon,
  });

  final VoidCallback? onPressed;
  final String? buttonText;
  final IconData? icon;

  @override
  Widget createMaterialWidget(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.only(left: 15),
      child: GestureDetector(
        onTap: onPressed,
        child: Icon(icon),
      ),
    );
  }

  @override
  Widget createCupertinoWidget(BuildContext context, WidgetRef ref) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      child: Icon(icon),
      onPressed: onPressed,
    );
  }
}*/

class PlatformNavigationBarButton extends PlatformWidgetBase<Widget, Widget> {
  PlatformNavigationBarButton({
    required this.onPressed,
    this.buttonText,
  });

  final VoidCallback? onPressed;
  final String? buttonText;

  @override
  Widget createMaterialWidget(BuildContext context, WidgetRef ref) {
    if (onPressed == null) {
      return SizedBox.shrink();
    } else {
      return Container(
        transform: Matrix4.translationValues(20.0, 0.0, 0.0),
        child: IconButton(
          icon: Icon(Icons.check, size: 28),
          onPressed: onPressed,
        ),
      );
    }
  }

  @override
  Widget createCupertinoWidget(BuildContext context, WidgetRef ref) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      child: Text(
        buttonText != null
            ? buttonText!
            : MaterialLocalizations.of(context).continueButtonLabel,
      ),
      onPressed: onPressed,
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
      buttonText: "Save", //MaterialLocalizations.of(context).saveButtonLabel,
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
        buttonText ?? MaterialLocalizations.of(context).cancelButtonLabel,
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
