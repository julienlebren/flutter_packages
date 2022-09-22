part of '../../sign_in.dart';

class SignInLandingPageBuilder extends ConsumerWidget {
  const SignInLandingPageBuilder({
    Key? key,
    this.child,
  }) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signInTheme = ref.watch(signInThemeProvider);

    return AnnotatedRegion<SystemUiMode>(
      value: SystemUiMode.edgeToEdge,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarBrightness: signInTheme.scaffoldBackgroundColor.brightness,
          statusBarColor: Colors.transparent,
          statusBarIconBrightness:
              signInTheme.scaffoldBackgroundColor.brightness,
          systemNavigationBarColor: signInTheme.scaffoldBackgroundColor,
          systemNavigationBarIconBrightness:
              signInTheme.scaffoldBackgroundColor.invertedBrightness,
        ),
        child: SafeArea(
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
        ),
      ),
    );
  }
}

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
