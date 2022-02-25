part of '../../sign_in.dart';

class SignInDivider extends ConsumerWidget {
  const SignInDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(signInThemeProvider);

    return Container(
      color: theme.dividerColor,
      height: 0.5,
    );
  }
}
