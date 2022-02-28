part of '../../sign_in.dart';

/*
class SignInLandingPage extends ConsumerWidget {
  const SignInLandingPage({
    Key? key,
    this.child,
    this.backgroundImage,
  }) : super(key: key);

  final Widget? child;
  final String? backgroundImage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(appThemeProvider);

    return SafeArea(
      top: false,
      bottom: false,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: appTheme.scaffoldBackgroundColor,
          image: backgroundImage != null
              ? DecorationImage(
                  image: AssetImage(backgroundImage!),
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
*/

/*
class SignInLandingPageBuilder extends StatelessWidget {
  const SignInLandingPageBuilder({
    Key? key,
    this.theme,
    this.router,
    required this.child,
  }) : super(key: key);

  final SignInTheme? theme;
  final Route<dynamic> Function(RouteSettings settings, WidgetRef ref)? router;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        if (theme != null) signInThemeProvider.overrideWithValue(theme!),
        if (router != null) signInRouterProvider.overrideWithValue(router!),
        signInLandingPageProvider.overrideWithValue(child),
      ],
      child: SignInNavigator(
        navigatorKey: SignInNavigatorKeys.main,
        routeName: '/',
      ),
    );
  }
}*/

class SignInLandingPageBuilder extends ConsumerWidget {
  const SignInLandingPageBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signInTheme = ref.watch(signInThemeProvider);
    final child = ref.watch(signInLandingPageProvider);

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
