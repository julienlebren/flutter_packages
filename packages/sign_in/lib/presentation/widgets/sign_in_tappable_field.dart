part of '../../sign_in.dart';

class SignInTappableField
    extends PlatformWidgetBase<TextButton, CupertinoButton> {
  const SignInTappableField({
    Key? key,
    required this.label,
    this.value,
    this.onPressed,
  }) : super(key: key);

  final String label;
  final String? value;
  final VoidCallback? onPressed;

  @override
  TextButton createMaterialWidget(BuildContext context, WidgetRef ref) {
    return TextButton(
      child: _contents,
      onPressed: onPressed,
    );
  }

  @override
  CupertinoButton createCupertinoWidget(BuildContext context, WidgetRef ref) {
    return CupertinoButton(
      child: _contents,
      onPressed: onPressed,
    );
  }

  Widget get _contents => SizedBox(
        height: 48.0,
        child: Row(
          children: [
            Text(
              label,
            ),
            if (value != null)
              Text(
                value!,
                textAlign: TextAlign.right,
              ),
            if (isCupertino())
              const Icon(
                CupertinoIcons.chevron_right,
                size: 22,
                color: Colors.grey,
              ),
          ],
        ),
      );
}
