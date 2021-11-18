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
