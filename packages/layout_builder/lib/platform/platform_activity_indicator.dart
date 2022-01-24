part of platform;

class PlatformActivityIndicator extends PlatformWidgetBase<
    CircularProgressIndicator, CupertinoActivityIndicator> {
  const PlatformActivityIndicator() : super();

  @override
  CircularProgressIndicator createMaterialWidget(
      BuildContext context, WidgetRef ref) {
    return CircularProgressIndicator();
  }

  @override
  CupertinoActivityIndicator createCupertinoWidget(
      BuildContext context, WidgetRef ref) {
    return CupertinoActivityIndicator();
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
