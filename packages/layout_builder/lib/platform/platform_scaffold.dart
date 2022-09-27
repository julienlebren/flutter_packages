part of platform;

class PlatformScaffold extends PlatformWidgetBase<AnnotatedRegion, Widget> {
  const PlatformScaffold({
    this.appBar,
    this.isModal = false,
    this.floatingActionButton,
    required this.body,
  }) : super();

  final bool isModal;
  final PlatformNavigationBar? appBar;
  final Widget? floatingActionButton;
  final Widget body;

  @override
  AnnotatedRegion createMaterialWidget(BuildContext context, WidgetRef ref) {
    final systemOverlayStyle = ref.watch(systemOverlayStyleProvider);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: systemOverlayStyle,
      child: Scaffold(
        appBar: appBar?.createMaterialWidget(context, ref),
        body: body,
        floatingActionButton: floatingActionButton,
      ),
    );
  }

  @override
  Widget createCupertinoWidget(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(appThemeProvider);
    final formTheme = ref.watch(formThemeProvider);

    final backgroundColor = body is FormWithOverlay || body is FormPage
        ? formTheme.backgroundColor
        : appTheme.scaffoldBackgroundColor;

    return CupertinoPageScaffold(
      backgroundColor: backgroundColor,
      navigationBar: appBar?.createCupertinoWidget(context, ref),
      child: SafeArea(
        child: body,
        bottom: !isModal,
      ),
    );
  }
}

class PlatformModalScaffold extends PlatformScaffold {
  const PlatformModalScaffold({appBar, body, floatingActionButton})
      : super(
          appBar: appBar,
          body: body,
          floatingActionButton: floatingActionButton,
        );

  @override
  Widget createCupertinoWidget(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(appThemeProvider);
    final formTheme = ref.watch(formThemeProvider);

    final backgroundColor = body is FormWithOverlay ||
            body is FormPage ||
            body is FormWithFixedFooter
        ? formTheme.backgroundColor
        : appTheme.scaffoldBackgroundColor;

    return Container(
      color: Colors.red,
      padding: EdgeInsets.only(top: appBar != null ? 10 : 0),
      child: CupertinoPageScaffold(
        backgroundColor: backgroundColor,
        navigationBar: appBar?.createCupertinoWidget(
          context,
          ref,
          isCupertinoModal: true,
        ),
        child: SafeArea(
          top: false,
          bottom: false,
          child: body,
        ),
      ),
    );
  }
}
