part of 'form.dart';

class FormSectionDivider extends PlatformWidgetBase<Widget, SizedBox> {
  const FormSectionDivider({Key? key}) : super(key: key);

  @override
  Widget createMaterialWidget(BuildContext context, WidgetRef ref) {
    final formTheme = ref.watch(formThemeProvider);
    if (formTheme.displaySectionDivider) {
      return Padding(
        padding: EdgeInsets.only(
          top: 0,
          bottom: formTheme.sectionDividerPadding,
        ), // 20 if gray background
        child: Container(
          width: double.infinity,
          height: 1,
          decoration: BoxDecoration(
            color: formTheme.sectionDividerColor,
            boxShadow: [
              BoxShadow(
                color: formTheme.sectionDividerColor,
                blurRadius: 1,
                offset: Offset(0, 1),
              ),
            ],
          ),
        ),
      );
    } else {
      return SizedBox.shrink();
    }
  }

  @override
  SizedBox createCupertinoWidget(BuildContext context, WidgetRef ref) {
    return SizedBox(height: 18);
  }
}
