part of platform;

class ModalNavigator extends ConsumerWidget {
  const ModalNavigator({
    Key? key,
    required this.routeName,
  }) : super(key: key);

  final String routeName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Navigator(
      key: key,
      initialRoute: routeName,
      onGenerateRoute: ref.read(routeProvider),
    );
  }
}

extension BuildContextModal on BuildContext {
  void openModal(String routeName) {
    if (isCupertino()) {
      showCupertinoModalBottomSheet(
        context: this,
        builder: (context) => ModalNavigator(
          routeName: routeName,
        ),
        duration: const Duration(milliseconds: 300),
        useRootNavigator: true,
      );
    } else if (isMaterial()) {
      Navigator.of(this, rootNavigator: true).pushNamed(routeName);
    } else {
      throw UnsupportedPlatformException();
    }
  }
}
