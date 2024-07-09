part of 'form.dart';

/// A tappable field inside a form, for example to open a picker
class FormCenteredButton extends ConsumerWidget {
  const FormCenteredButton({
    Key? key,
    required this.value,
    this.onPressed,
    this.isDestructive = false,
  }) : super(key: key);

  final String value;
  final VoidCallback? onPressed;
  final bool isDestructive;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(appThemeProvider);
    return PlatformListTile(
      child: Center(
        child: Container(
          width: double.infinity,
          child: Text(
            value,
            style: TextStyle(
              fontSize: isCupertino() ? 17 : 16,
              color: isDestructive ? Colors.red : appTheme.textColor,
            ),
            textAlign: isCupertino() ? TextAlign.center : TextAlign.left,
          ),
        ),
      ),
      onTap: onPressed,
    );
  }
}
