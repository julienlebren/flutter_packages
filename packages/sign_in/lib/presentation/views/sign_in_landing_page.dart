part of '../../sign_in.dart';

class SignInLandingPage extends ConsumerWidget {
  const SignInLandingPage({
    Key? key,
    this.child,
  }) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signInTheme = ref.watch(signInThemeProvider);

    return SafeArea(
      top: false,
      bottom: false,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: signInTheme.scaffoldBackgroundColor,
          image: signInTheme.backgroundImage != null
              ? DecorationImage(
                  image: AssetImage(signInTheme.backgroundImage!),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
