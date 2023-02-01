part of platform;

abstract class PlatformWidgetBase<
    MaterialWidget extends Widget,
    CupertinoWidget extends Widget,
    WebWidget extends Widget> extends ConsumerWidget {
  const PlatformWidgetBase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (kIsWeb) {
      print("Ok ici");
      return createWebWidget(context, ref);
    } else {
      switch (defaultTargetPlatform) {
        case TargetPlatform.iOS:
        case TargetPlatform.macOS:
          return createCupertinoWidget(context, ref);
        case TargetPlatform.android:
          return createMaterialWidget(context, ref);
        default:
          return throw UnsupportedError(
              'Platform not supported: $defaultTargetPlatform');
      }
    }
  }

  MaterialWidget createMaterialWidget(BuildContext context, WidgetRef ref);
  CupertinoWidget createCupertinoWidget(BuildContext context, WidgetRef ref);
  WebWidget createWebWidget(BuildContext context, WidgetRef ref);
}
