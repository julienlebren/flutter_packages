part of '../../sign_in.dart';

/*final signInRouterProvider =
    Provider<Route<dynamic>? Function(RouteSettings settings, WidgetRef ref)>(
  (_) => SignInRouter.onGenerateRoute,
);*/

final signInCustomRouterProvider =
    Provider<Route<dynamic>? Function(RouteSettings settings, WidgetRef ref)?>(
  (_) => null,
);

final signInLandingPageProvider = Provider<Widget>(
  (_) => const SizedBox.shrink(),
);

class SignInNavigatorKeys {
  static final modal = GlobalKey<NavigatorState>();
}

class SignInRoutes {
  static const predicate = 'sign-in';
  static const signInLandingPage = 'sign-in';
  static const signInEmailPage = 'sign-in/email';
  static const signInEmailResetPage = 'sign-in/email/reset';
  static const signInEmailRegisterPage = 'sign-in/email/register';
  static const signInEmailLinkPage = 'sign-in/link';
  static const signInPhonePage = 'sign-in/phone';
  static const signInPhoneVerificationPage = 'sign-in/phone/verification';
  static const signInCountriesPage = 'sign-in/countries';
  static const signInUserInfoPage = 'sign-in/info';
  static const signInUnknownPage = 'sign-in/unknown';
}

class SignInRouter {
  static Route<dynamic>? onGenerateRoute(
    RouteSettings settings,
    WidgetRef ref,
  ) {
    final isRootNavigator =
        settings.arguments != null ? (settings.arguments as bool) : false;
    print("name: ${settings.name!} / isRootNavigator: $isRootNavigator");

    if (isRootNavigator) {
      return platformPageRoute(
        builder: (_) => SignInNavigator(
          routeName: settings.name!,
        ),
        fullscreenDialog: true,
      );
    } else {
      switch (settings.name) {
        case SignInRoutes.signInEmailPage:
          return platformPageRoute(
            builder: (_) => const SignInEmailLoginPage(),
          );
        case SignInRoutes.signInEmailLinkPage:
          return platformPageRoute(
            builder: (_) => const SignInEmailLinkPage(),
          );
        case SignInRoutes.signInEmailRegisterPage:
          return platformPageRoute(
            builder: (_) => const SignInEmailRegisterPage(),
          );
        case SignInRoutes.signInEmailResetPage:
          return platformPageRoute(
            builder: (_) => const SignInEmailResetPage(),
          );
        case SignInRoutes.signInPhonePage:
          return MaterialWithModalsPageRoute(
            builder: (_) => const SignInPhonePage(),
          );
        case SignInRoutes.signInPhoneVerificationPage:
          return platformPageRoute(
            builder: (_) => const SignInPhoneVerificationPage(),
          );
        case SignInRoutes.signInCountriesPage:
          return platformPageRoute(
            builder: (_) => const CountriesPage(),
            fullscreenDialog: true,
          );
      }

      final signInCustomRouter = ref.read(signInCustomRouterProvider);
      if (signInCustomRouter != null) {
        return signInCustomRouter(settings, ref);
      }
    }
    return platformPageRoute(
      builder: (_) => const SignInUnknownPage(),
    );
  }
}

class SignInNavigator extends ConsumerWidget {
  const SignInNavigator({
    Key? key,
    required this.routeName,
  }) : super(key: key);
  final String routeName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Navigator(
      key: SignInNavigatorKeys.modal,
      initialRoute: routeName,
      onGenerateRoute: (settings) =>
          SignInRouter.onGenerateRoute(settings, ref),
    );
  }
}
