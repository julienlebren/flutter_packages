part of 'form.dart';

class FormWithOverlay extends StatelessWidget {
  const FormWithOverlay({
    Key? key,
    required this.child,
    this.isSaving = false,
  }) : super(key: key);

  final bool isSaving;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isSaving ? 0.5 : 1,
      duration: Duration(milliseconds: 200),
      child: AbsorbPointer(
        absorbing: isSaving ? true : false,
        child: child,
      ),
    );

    /*Stack(
      children: <Widget>[
        child,
        FormSavingOverlay(isSaving: isSaving),
      ],
    );*/
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
        final formTheme = ref.watch(formThemeProvider);
        return SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: Container(
              color: formTheme.backgroundColor,
              padding: EdgeInsets.symmetric(
                horizontal: isCupertino() ? 18 : 0,
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

class FormWithFixedButton extends ConsumerWidget {
  const FormWithFixedButton({
    Key? key,
    required this.children,
    required this.buttonText,
    this.onPressed,
  }) : super(key: key);

  final List<Widget> children;
  final String buttonText;
  final VoidCallback? onPressed;

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
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    color: dividerColor,
                    height: 0.5,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 15),
                    color: backgroundColor,
                    child: PlatformFullSizedElevatedButton(
                      title: buttonText,
                      onPressed: onPressed,
                    ),
                  ),
                ],
              ),
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
