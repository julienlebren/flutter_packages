part of '../../sign_in.dart';

class SignInTappableField
    extends PlatformWidgetBase<TextButton, CupertinoButton> {
  const SignInTappableField({
    Key? key,
    required this.label,
    this.value,
    this.trailing,
    this.onPressed,
  }) : super(key: key);

  final String label;
  final String? value;
  final Widget? trailing;
  final VoidCallback? onPressed;

  @override
  TextButton createMaterialWidget(BuildContext context, WidgetRef ref) {
    return TextButton(
      child: _contents(ref),
      onPressed: onPressed,
    );
  }

  @override
  CupertinoButton createCupertinoWidget(BuildContext context, WidgetRef ref) {
    return CupertinoButton(
      padding: const EdgeInsets.all(0),
      child: _contents(ref),
      onPressed: onPressed,
    );
  }

  Widget _contents(WidgetRef ref) {
    final textColor = ref.watch(
      appThemeProvider.select(
        (appTheme) => appTheme.textColor,
      ),
    );
    return SizedBox(
      height: 48.0,
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(color: textColor),
          ),
          const Spacer(),
          if (value != null)
            Text(
              value!,
              style: TextStyle(color: textColor),
              textAlign: TextAlign.right,
            ),
          if (trailing != null) ...[
            trailing!,
          ] else if (isCupertino())
            const Icon(
              CupertinoIcons.chevron_right,
              size: 22,
              color: Colors.grey,
            ),
        ],
      ),
    );
  }
}
