part of '../../sign_in.dart';

class SignInTappableField
    extends PlatformWidgetBase<TextButton, CupertinoButton> {
  const SignInTappableField({
    Key? key,
    required this.label,
    this.trailing,
    this.onPressed,
  }) : super(key: key);

  final String label;
  final Widget? trailing;
  final VoidCallback? onPressed;

  @override
  TextButton createMaterialWidget(BuildContext context, WidgetRef ref) {
    return TextButton(
      child: _contents(ref),
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
        textStyle: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.normal,
        ),
      ),
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
      signInThemeProvider.select(
        (theme) => theme.textColor,
      ),
    );
    return SizedBox(
      height: 48.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(color: textColor),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
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
