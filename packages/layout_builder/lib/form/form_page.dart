part of 'form.dart';

class FormWithOverlay extends StatelessWidget {
  const FormWithOverlay({
    Key? key,
    this.overlay,
    required this.child,
    this.isSaving = false,
    this.opacity = 0.5,
  }) : super(key: key);

  final bool isSaving;
  final Widget? overlay;
  final Widget child;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        AnimatedOpacity(
          opacity: isSaving ? opacity : 1,
          duration: Duration(milliseconds: 200),
          child: AbsorbPointer(
            absorbing: isSaving ? true : false,
            child: child,
          ),
        ),
        if (overlay != null && isSaving) overlay!,
      ],
    );
  }
}

class FormSavingOverlay extends StatelessWidget {
  const FormSavingOverlay({
    Key? key,
    required this.isSaving,
  }) : super(key: key);

  final bool isSaving;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isSaving ? 0.5 : 1,
      duration: Duration(milliseconds: 200),
      child: AbsorbPointer(
        absorbing: isSaving ? true : false,
        child: SizedBox.shrink(),
      ),
    );
  }
}

class FormPage extends ConsumerWidget {
  const FormPage({
    Key? key,
    required this.children,
  }) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formTheme = ref.watch(formThemeProvider);
    final appTheme = ref.watch(appThemeProvider);
    final controller = ScrollController();

    return ProviderScope(
      overrides: [
        appThemeProvider.overrideWithValue(
          appTheme.copyWith(
            listTileBackground: formTheme.rowBackgroundColor,
          ),
        ),
      ],
      child: LayoutBuilder(builder: (
        BuildContext context,
        BoxConstraints viewportConstraints,
      ) {
        print(">>> ${viewportConstraints.maxWidth}");
        final formTheme = ref.watch(formThemeProvider);
        final screenWidth = MediaQuery.of(context).size.width;
        final isInsideSplitView = ref.watch(isInsideSplitViewProvider);
        double padding = 0;

        if (screenWidth > Breakpoints.tablet && !isInsideSplitView) {
          padding = (screenWidth - Breakpoints.tablet) / 2;
        } else if (isCupertino()) {
          padding = 18;
        }

        return SingleChildScrollView(
          controller: controller,
          physics: AlwaysScrollableScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: Container(
              color: formTheme.backgroundColor,
              padding: EdgeInsets.symmetric(
                horizontal: padding,
                vertical: isCupertino() ? 18 : 0, // 14 si fond blanc
              ),
              child: Column(children: [
                for (var child in children) ...[
                  child,
                  if (child != children.last) FormSectionDivider(),
                  //FormSectionDivider(),
                ],
              ]),
            ),
          ),
        );
      }),
    );
  }
}

class FormWithFixedFooter extends ConsumerWidget {
  const FormWithFixedFooter({
    Key? key,
    required this.children,
    required this.footer,
  }) : super(key: key);

  final List<Widget> children;
  final Widget footer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        FormPage(
          children: children,
        ),
        LayoutBuilder(builder: (context, constraints) {
          final backgroundColor = ref.watch(appThemeProvider.select(
            (theme) => theme.scaffoldBackgroundColor,
          ));
          final dividerColor = ref.watch(appThemeProvider.select(
            (theme) => theme.dividerColor,
          ));

          return Container(
            alignment: Alignment.bottomCenter,
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  color: dividerColor,
                  height: 0.5,
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: 18,
                    right: 18,
                    top: 15,
                  ),
                  color: backgroundColor,
                  child: SafeArea(child: footer),
                ),
              ],
            ),
          );

/*
          return Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.symmetric(horizontal: 18),
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  color: backgroundColor,
                  child: PlatformFullSizedElevatedButton(
                    title: buttonText,
                    onPressed: onPressed,
                  ),
                ),
                Container(color: backgroundColor, height: 40),
              ],
            ),
          );
          */
        }),
      ],
    );
  }
}
