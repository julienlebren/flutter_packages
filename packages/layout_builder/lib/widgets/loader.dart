part of 'widgets.dart';

class Loader extends StatelessWidget {
  const Loader({
    this.delayBeforeDisplay = 1,
  }) : super();

  final int delayBeforeDisplay;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: delayBeforeDisplay), () {}),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Container();
        }
      },
    );
  }
}

class ScaffoldLoader extends StatelessWidget {
  const ScaffoldLoader({
    this.delayBeforeDisplay = 1,
  }) : super();

  final int delayBeforeDisplay;

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: Loader(
        delayBeforeDisplay: delayBeforeDisplay,
      ),
    );
  }
}
