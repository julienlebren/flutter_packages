part of '../sign_in.dart';

// Override juste les listeners dans les formulaires ??

final signInRouterProvider =
    Provider<Route<dynamic> Function(RouteSettings settings)>(
  (_) => SignInRouter.onGenerateRoute,
);

final signInLandingPageProvider =
    Provider<Widget>((_) => const SizedBox.shrink());

final needUserInfoPageProvider = Provider<String?>((_) => null);

class SignInNavigatorKeys {
  static final main = GlobalKey<NavigatorState>();
  static final modal = GlobalKey<NavigatorState>();
}

class SignInRoutes {
  static const signInLandingPage = '/';
  static const signInRouterPage = 'sign-in';
  static const signInEmailPage = 'sign-in/email';
  static const signInEmailPasswordPage = 'sign-in/email/password';
  static const signInEmailRecoverPage = 'sign-in/email/recover';
  static const signInEmailRegisterPage = 'sign-in/email/register';
  static const signInLinkPage = 'sign-in/link';
  static const signInPhonePage = 'sign-in/phone';
  static const signInVerificationPage = 'sign-in/phone/verification';
}

class SignInRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SignInRoutes.signInRouterPage:
        return platformPageRoute(
          builder: (_) => SignInNavigator(
            navigatorKey: SignInNavigatorKeys.modal,
            routeName: settings.arguments as String,
          ),
          fullscreenDialog: true,
        );
      case SignInRoutes.signInEmailPage:
        return platformPageRoute(
          builder: (_) => const SignInEmailPage(),
        );
      case SignInRoutes.signInLinkPage:
        return platformPageRoute(
          builder: (_) => const SignInEmailLinkPage(),
        );
      case SignInRoutes.signInPhonePage:
        return platformPageRoute(
          builder: (_) => const SignInPhonePage(),
        );
    }
    return platformPageRoute(
      builder: (_) => const SignInUnknownPage(),
    );
  }
}

class SignInNavigator extends ConsumerWidget {
  const SignInNavigator({
    Key? key,
    required this.navigatorKey,
    required this.routeName,
  }) : super(key: key);

  final GlobalKey<NavigatorState> navigatorKey;
  final String routeName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signInRouter = ref.read(signInRouterProvider);

    ref.listen<AuthState>(authStateProvider, (_, authState) {
      authState.maybeWhen(
        authed: (_) {
          final navigator = SignInNavigatorKeys.main.currentState!;
          navigator.pop();
        },
        needUserInformation: () {
          final needUserInfoPage = ref.read(needUserInfoPageProvider);
          if (needUserInfoPage != null) {
            final navigator = navigatorKey.currentState!;
            navigator.pushNamed(needUserInfoPage);
          }
        },
        orElse: () => null,
      );
    });

    return Navigator(
      key: navigatorKey,
      initialRoute: routeName,
      onGenerateRoute: (settings) => signInRouter(settings),
    );
  }
}

class SignInPageBuilder extends StatelessWidget {
  const SignInPageBuilder({
    Key? key,
    this.theme,
    this.localizations,
    this.signInRouter,
    this.landingPage,
    this.needUserInfoPage,
  }) : super(key: key);

  final SignInTheme? theme;
  final SignInLocalizations? localizations;
  final Route<dynamic> Function(RouteSettings settings)? signInRouter;
  final Widget? landingPage;
  final String? needUserInfoPage;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        if (theme != null) signInThemeProvider.overrideWithValue(theme!),
        if (localizations != null)
          signInLocalizationsProvider.overrideWithValue(localizations!),
        if (landingPage != null)
          signInLandingPageProvider.overrideWithValue(landingPage!),
        if (needUserInfoPage != null)
          needUserInfoPageProvider.overrideWithValue(needUserInfoPage!),
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

class SignInPageBuilder2 extends StatelessWidget {
  const SignInPageBuilder2({
    Key? key,
    required this.child,
    this.theme,
    this.localizations,
    this.signInRouter,
    this.needUserInfoPage,
  }) : super(key: key);

  final SignInTheme? theme;
  final SignInLocalizations? localizations;
  final Route<dynamic> Function(RouteSettings settings)? signInRouter;
  final String? needUserInfoPage;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        if (theme != null) signInThemeProvider.overrideWithValue(theme!),
        if (localizations != null)
          signInLocalizationsProvider.overrideWithValue(localizations!),
        if (needUserInfoPage != null)
          needUserInfoPageProvider.overrideWithValue(needUserInfoPage!),
        if (signInRouter != null)
          signInRouterProvider.overrideWithValue(signInRouter!),
      ],
      child: child,
    );
  }
}

/*
class SignInRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings, WidgetRef ref) {
    switch (settings.name) {
      case SignInRoutes.signInRouterPage:
        return platformPageRoute(
          builder: (_) => SignInNavigator(
            navigatorKey: SignInNavigatorKeys.modal,
            routeName: settings.arguments as String,
          ),
          fullscreenDialog: true,
        );
      case SignInRoutes.signInEmailPage:
        return platformPageRoute(
          builder: (_) => const SignInEmailPage(),
        );
      case SignInRoutes.signInLinkPage:
        return platformPageRoute(
          builder: (_) => const SignInEmailLinkPage(),
        );
      case SignInRoutes.signInPhonePage:
        return platformPageRoute(
          builder: (_) => const SignInPhonePage(),
        );
      case SignInRoutes.signInLandingPage:
        final landingPage = ref.read(signInLandingPageProvider);
        return platformPageRoute(
          builder: (_) => landingPage,
        );
    }
    final customSignInRoutes = ref.read(customSignInRoutesProvider);
    if (customSignInRoutes != null) {
      customSignInRoutes(settings);
    }
    return platformPageRoute(
      builder: (_) => const SignInUnknownPage(),
    );
  }
}
*/
/*
class SignInRoutes {
  static const signInRouterPage = 'sign-in';
  static const signInEmailPage = 'sign-in/email';
  static const signInEmailPasswordPage = 'sign-in/email/password';
  static const signInEmailRecoverPage = 'sign-in/email/recover';
  static const signInEmailRegisterPage = 'sign-in/email/register';
  static const signInLinkPage = 'sign-in/link';
  static const signInPhonePage = 'sign-in/phone';
  static const signInVerificationPage = 'sign-in/phone/verification';
}
class SignInNavigator extends ConsumerWidget {
  const SignInNavigator({
    Key? key,
    required this.navigatorKey,
    required this.routeName,
  }) : super(key: key);

  final GlobalKey<NavigatorState> navigatorKey;
  final String routeName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authSettings = ref.read(authSettingsProvider);

    ref.listen<AuthState>(authStateProvider(authSettings), (_, authState) {
      authState.maybeWhen(
        authed: (_) {
          final navigator = SignInNavigatorKeys.main.currentState!;
          navigator.pop();
        },
        needUserInformation: () {
          final navigator = navigatorKey.currentState!;
          navigator.pushNamed(authSettings.needUserInfoPage!);
        },
        orElse: () => null,
      );
    });

    return Navigator(
      key: navigatorKey,
      initialRoute: routeName,
      onGenerateRoute: (settings) {
        final baseRoute = SignInRouter.onGenerateRoute(settings);
        if (baseRoute != null) return baseRoute;

        if (authSettings.onGenerateCustomRoute != null) {
          final customRoute = authSettings.onGenerateCustomRoute!(settings);
          if (customRoute != null) return customRoute;
        }

        return platformPageRoute(
          builder: (_) => const SignInUnknownPage(),
        );
      },
    );
  }
}*/

/*
class SignInNavigator extends StatelessWidget {
  const SignInNavigator({
    Key? key,
    required this.navigatorKey,
    required this.initialRoute,
    required this.onGenerateRoute,
  }) : super(key: key);

  final GlobalKey<NavigatorState> navigatorKey;
  final String initialRoute;
  final Route<dynamic>? Function(RouteSettings settings) onGenerateRoute;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: initialRoute,
      onGenerateRoute: onGenerateRoute,
    );
  }
}

class BaseSignInRouter {
  static final signIn = GlobalKey<NavigatorState>();


  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    if (settings.name != null) {
      switch (settings.name!) {
        case signInEmailPage:
          return platformPageRoute(
            builder: (_) => const SignInEmailPage(),
            fullscreenDialog: true,
          );
        case signInEmailLinkPage:
          return platformPageRoute(
            builder: (_) => const SignInEmailLinkPage(),
            fullscreenDialog: true,
          );
        case signInEmailPasswordPage:
          return platformPageRoute(
            builder: (_) => const SignInEmailPasswordPage(),
          );
      }
    }
    throw UnimplementedError(
        "This app called a page named ${settings.name} but the SignInRouter has not been configured to handle this page.");
  }
}
*/

/* Dans l'app */

/*
class _SignInRouter {
  static const signInLandingPage = '/sign-in';
  static const signInProfile = '/sign-in/profile';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    if (settings.name != null) {
      switch (settings.name) {
        case signInLandingPage:
          return platformPageRoute(
            builder: (_) => const SignInLandingPage(),
          );
        case signInProfile:
          return platformPageRoute(
            builder: (_) =>
                const PlatformScaffold(body: Center(child: Text("profile"))),
          );
      }
    }
    return SignInRouter.handleBaseRoutes(settings.name!);
  }
}

class SignInPage extends ConsumerWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SignInRouter(
      authSettings: AuthSettings(
        userStreamProvider,
      ),
      theme: const SignInTheme(
        buttonBackgroundColor: Colors.red,
        buttonTextColor: Colors.black,
      ),
      localizations: const SignInLocalizations(),
      child: SignInNavigator(
        key: SignInRouter.main,
        initialRoute: _SignInRouter.signInLandingPage,
        onGenerateRoute: _SignInRouter.onGenerateRoute,
      ),
    );
  }
}

class SignInLandingPage extends StatelessWidget {
  const SignInLandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SignInLandingPageBuilder(
      logo: SizedBox.shrink(),
      buttons: SignInButtons([
        SignInSupplier.apple,
        SignInSupplier.google,
        SignInSupplier.emailLink,
        SignInSupplier.anonymous,
      ]),
    );
  }
}
*/

/*
class SignInRouter extends StatelessWidget {
  const SignInRouter({
    Key? key,
    this.theme,
    this.localizations,
    required this.authSettings,
    required this.child,
  }) : super(key: key);

  final SignInTheme? theme;
  final SignInLocalizations? localizations;
  final AuthSettings authSettings;
  final Widget child;

  static final main = GlobalKey<NavigatorState>();
  static final modal = GlobalKey<NavigatorState>();

  static const signInEmailPage = '/sign-in/email';
  static const signInEmailLinkPage = '/sign-in/email/link';
  static const signInEmailPasswordPage = '/sign-in/email/password';
  static const signInEmailRecoverPage = '/sign-in/email/recover';
  static const signInEmailRegisterPage = '/sign-in/email/register';
  static const signInPhonePage = '/sign-in/phone';
  static const signInVerificationPage = '/sign-in/phone/verification';

  static Route<dynamic>? handleBaseRoutes(String route) {
    switch (route) {
      case signInEmailPage:
        return platformPageRoute(
          builder: (_) => const SignInEmailPage(),
          fullscreenDialog: true,
        );
      case signInEmailLinkPage:
        return platformPageRoute(
          builder: (_) => const SignInEmailLinkPage(),
          fullscreenDialog: true,
        );
      case signInEmailPasswordPage:
        return platformPageRoute(
          builder: (_) => const SignInEmailPasswordPage(),
        );
    }
    return null;
  }

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    if (settings.name != null) {
      return handleBaseRoutes(settings.name!);
    }
    throw UnimplementedError(
        "This app called a page named ${settings.name} but the SignInRouter has not been configured to handle this page.");
  }

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        authSettingsProvider.overrideWithValue(authSettings),
        if (theme != null) signInThemeProvider.overrideWithValue(theme!),
        if (localizations != null)
          signInLocalizationsProvider.overrideWithValue(localizations!),
      ],
      child: child,
    );
  }
}

class SignInNavigator extends StatelessWidget {
  const SignInNavigator({
    Key? key,
    required this.initialRoute,
    required this.onGenerateRoute,
  }) : super(key: key);

  final String initialRoute;
  final Route<dynamic>? Function(RouteSettings settings) onGenerateRoute;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: key,
      initialRoute: initialRoute,
      onGenerateRoute: onGenerateRoute,
    );
  }
}

/* Dans l'app */

class _SignInRouter {
  static const signInLandingPage = '/sign-in';
  static const signInProfile = '/sign-in/profile';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    if (settings.name != null) {
      switch (settings.name) {
        case signInLandingPage:
          return platformPageRoute(
            builder: (_) => const SignInLandingPage(),
          );
        case signInProfile:
          return platformPageRoute(
            builder: (_) =>
                const PlatformScaffold(body: Center(child: Text("profile"))),
          );
      }
    }
    return SignInRouter.handleBaseRoutes(settings.name!);
  }
}

class SignInPage extends ConsumerWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SignInRouter(
      authSettings: AuthSettings(
        userStreamProvider,
      ),
      theme: const SignInTheme(
        buttonBackgroundColor: Colors.red,
        buttonTextColor: Colors.black,
      ),
      localizations: const SignInLocalizations(),
      child: SignInNavigator(
        key: SignInRouter.main,
        initialRoute: _SignInRouter.signInLandingPage,
        onGenerateRoute: _SignInRouter.onGenerateRoute,
      ),
    );
  }
}

class SignInLandingPage extends StatelessWidget {
  const SignInLandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SignInLandingPageBuilder(
      logo: SizedBox.shrink(),
      buttons: SignInButtons([
        SignInSupplier.apple,
        SignInSupplier.google,
        SignInSupplier.emailLink,
        SignInSupplier.anonymous,
      ]),
    );
  }
}
*/