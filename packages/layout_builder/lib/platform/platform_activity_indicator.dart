part of platform;

class PlatformActivityIndicator extends PlatformWidgetBase<
    CircularProgressIndicator, CupertinoActivityIndicator> {
  const PlatformActivityIndicator({
    this.color,
    this.strokeWidth = 4.0,
  }) : super();

  final Color? color;
  final double strokeWidth;

  @override
  CircularProgressIndicator createMaterialWidget(
      BuildContext context, WidgetRef ref) {
    return CircularProgressIndicator(strokeWidth: strokeWidth);
  }

  @override
  CupertinoActivityIndicator createCupertinoWidget(
      BuildContext context, WidgetRef ref) {
    return CupertinoActivityIndicator(color: color);
  }
}

class DelayedPlatformActivityIndicator extends StatelessWidget {
  const DelayedPlatformActivityIndicator({
    this.delayBeforeDisplay = 2,
  });

  final int delayBeforeDisplay;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: delayBeforeDisplay), () {}),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Center(
            child: PlatformActivityIndicator(),
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}

class PlatformNavigationBarActivityIndicator extends StatelessWidget {
  const PlatformNavigationBarActivityIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 24,
        height: 24,
        child: PlatformActivityIndicator(strokeWidth: 1),
      ),
    );
  }
}
