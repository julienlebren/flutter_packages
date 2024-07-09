part of platform;

Page platformPage({
  required Widget child,
}) {
  if (isMaterial()) {
    return MaterialPage(
      child: child,
    );
  } else {
    return CupertinoPage(
      child: child,
    );
  }
}
