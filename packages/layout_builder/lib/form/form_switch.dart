part of 'form.dart';

class FormSwitch extends StatelessWidget {
  const FormSwitch({
    Key? key,
    required this.label,
    this.caption,
    required this.isEnabled,
    this.onChanged,
  }) : super(key: key);

  final String label;
  final String? caption;
  final bool isEnabled;
  final Function(bool value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return PlatformListTile(
      label: label,
      caption: isMaterial() ? caption : null,
      trailing: PlatformSwitch(
        onChanged: onChanged,
        value: isEnabled,
      ),
      onTap: onChanged != null ? () => onChanged!(!isEnabled) : null,
    );
  }
}
