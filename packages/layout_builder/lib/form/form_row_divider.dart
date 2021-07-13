part of 'form.dart';

class FormRowDivider extends ConsumerWidget {
  const FormRowDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formTheme = ref.watch(formThemeProvider);
    if (isCupertino() || (isMaterial() && formTheme.displayRowDivider)) {
      return Container(
        padding: EdgeInsets.only(
          left: formTheme.rowDividerPadding,
          right: isMaterial() ? 15 : 0,
        ),
        width: double.infinity,
        color: formTheme.rowBackgroundColor,
        height: 1,
        child: Container(
          color: formTheme.rowDividerColor,
          height: 0.5,
        ),
      );
    } else {
      return SizedBox.shrink();
    }
  }
}
