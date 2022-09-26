part of 'form.dart';

class FormLabelField extends StatelessWidget {
  const FormLabelField({
    Key? key,
    this.leading,
    this.label,
    this.value,
    this.caption,
    this.trailing,
  })  : assert((label != null || caption != null)),
        super(key: key);

  final Widget? leading;
  final String? label;
  final String? caption;
  final String? value;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return PlatformListTile(
      leading: leading,
      label: label,
      value: value,
      trailing: trailing,
      caption: isMaterial() ? caption : null,
    );
  }
}
