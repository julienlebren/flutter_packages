part of 'form.dart';

class FormTextField extends ConsumerWidget {
  const FormTextField({
    Key? key,
    this.label,
    required this.textField,
  }) : super(key: key);

  final String? label;
  final PlatformTextField textField;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PlatformListTile(
      label: label,
      trailing: textField,
    );
  }
}
