part of platform;

showPlatformModalPage<T>(
  BuildContext context,
  Widget child,
  VoidCallback materialHandler,
) {
  if (isMaterial()) {
    materialHandler();
  } else {
    showCupertinoModalBottomSheet(
      context: context,
      duration: Duration(milliseconds: 300),
      builder: (context) => child,
      useRootNavigator: true,
    );
  }
}
