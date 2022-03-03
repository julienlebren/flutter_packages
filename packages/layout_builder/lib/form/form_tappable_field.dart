part of 'form.dart';

class FormTappableField extends ConsumerWidget {
  const FormTappableField({
    Key? key,
    this.leading,
    this.label,
    this.value,
    this.caption,
    required this.onPressed,
    this.showDisclosureIndicator = true,
    this.showSelectedIndicator = false,
  }) : super(key: key);

  final Widget? leading;
  final String? label;
  final String? caption;
  final String? value;
  final VoidCallback? onPressed;
  final bool showDisclosureIndicator;
  final bool showSelectedIndicator;

  Widget? trailingIcon(BuildContext context, WidgetRef ref) {
    if (isCupertino() && showDisclosureIndicator) {
      return Icon(
        CupertinoIcons.chevron_right,
        size: 22,
        color: Colors.grey,
      );
    } else if (showSelectedIndicator) {
      final appTheme = ref.watch(appThemeProvider);
      return Padding(
        padding: isMaterial() ? EdgeInsets.only(right: 7) : EdgeInsets.zero,
        child: Icon(
          PlatformIcons.checkmark,
          color: appTheme.primaryColor,
        ),
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PlatformListTile(
      leading: leading,
      label: label,
      value: value,
      caption: isMaterial() ? caption : null,
      trailing: trailingIcon(context, ref),
      onTap: onPressed,
    );
  }
}
