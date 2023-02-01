part of 'form.dart';

/// The button for submitting the action
/// Returns a floating button for Android and a NavigationBar button for iOS.
class FormLoader extends PlatformWidgetBase<Widget, Widget, Widget> {
  const FormLoader({
    Key? key,
    this.delayBeforeDisplay = 1,
  }) : super(key: key);

  final int delayBeforeDisplay;

  @override
  Widget createMaterialWidget(BuildContext context, WidgetRef ref) {
    return Center(
      child: SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.grey.shade400),
        ),
      ),
    );
  }

  @override
  Widget createCupertinoWidget(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: delayBeforeDisplay), () {}),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Padding(
            padding: EdgeInsets.zero,
            child: CupertinoActivityIndicator(),
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }

  @override
  Widget createWebWidget(BuildContext context, WidgetRef ref) =>
      createMaterialWidget(context, ref);
}
