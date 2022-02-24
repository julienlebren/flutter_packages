part of '../../sign_in.dart';

class SignInLandingPage extends StatelessWidget {
  const SignInLandingPage({
    Key? key,
    required this.child,
    this.theme,
    this.signInRouter,
  }) : super(key: key);

  final SignInTheme? theme;
  final Route<dynamic> Function(RouteSettings settings)? signInRouter;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        signInLandingPageProvider.overrideWithValue(child),
        if (theme != null) signInThemeProvider.overrideWithValue(theme!),
        if (signInRouter != null)
          signInRouterProvider.overrideWithValue(signInRouter!),
      ],
      child: SignInNavigator(
        navigatorKey: SignInNavigatorKeys.main,
        routeName: SignInRoutes.signInLandingPage,
      ),
    );
  }
}

class SignInLandingPageBuilder extends ConsumerWidget {
  const SignInLandingPageBuilder({
    Key? key,
    this.logo,
    this.buttons,
    this.backgroundImage,
  }) : super(key: key);

  final Widget? logo;
  final Widget? buttons;
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Spacer(),
                  if (logo != null) ...[
                    logo!,
                    const Spacer(),
                  ],
                  if (buttons != null) buttons!,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
