part of '../sign_in.dart';

final signInNavigatorKey = GlobalKey<NavigatorState>();

class SignInRoutes {
  static const signInLandingPage = '/sign-in';
  static const signInEmailPage = '/sign-in/email';
  static const signInEmailPasswordPage = '/sign-in/email/password';
  static const signInPhonePage = '/sign-in/phone';
  static const signInVerificationPage = '/sign-in/phone/verification';
}

class SignInNavigatorKeys {
  static final main = GlobalKey<NavigatorState>();
  static final modal = GlobalKey<NavigatorState>();
}

class SignInRouter extends ConsumerWidget {
  const SignInRouter({
    Key? key,
    this.theme,
    this.localizations,
    required this.landingPage,
    this.handleAdditionnalRoutes,
  }) : super(key: key);

  final SignInTheme? theme;
  final SignInLocalizations? localizations;
  final Widget landingPage;
  final Function(String route)? handleAdditionnalRoutes;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
      overrides: [
        if (theme != null) signInThemeProvider.overrideWithValue(theme!),
        if (localizations != null)
          signInLocalizationsProvider.overrideWithValue(localizations!),
      ],
      child: Navigator(
        key: SignInNavigatorKeys.main,
        initialRoute: SignInRoutes.signInLandingPage,
        onGenerateRoute: (RouteSettings settings) {
          if (settings.name != null) {
            switch (settings.name) {
              case SignInRoutes.signInLandingPage:
                return platformPageRoute(
                  builder: (_) => landingPage,
                );
              case SignInRoutes.signInEmailPage:
                return platformPageRoute(
                  builder: (_) => const SignInEmailPage(),
                  fullscreenDialog: true,
                );
              case SignInRoutes.signInEmailPasswordPage:
                return platformPageRoute(
                  builder: (_) => const SignInEmailPasswordPage(),
                );
            }
            if (handleAdditionnalRoutes != null) {
              handleAdditionnalRoutes!(settings.name!);
            }
            return platformPageRoute(
              builder: (_) => Center(
                child: Text(
                    "This app called a page named ${settings.name} but the SignInRouter has not been configure dto handle this page."),
              ),
            );
          }
          return null;
        },
      ),
    );
  }
}
