part of '../../sign_in.dart';

// Override juste les listeners dans les formulaires ??

final signInRouterProvider =
    Provider<Route<dynamic>? Function(RouteSettings settings, WidgetRef ref)>(
  (_) => SignInRouter.onGenerateRoute,
);

final signInLandingPageProvider =
    Provider<Widget>((_) => const SizedBox.shrink());

//final signInUserInfoPageProvider = Provider<String?>((_) => null);

final signInNavigatorKey = GlobalKey<NavigatorState>();

class SignInRoutes {
  static const predicate = 'sign-in';
  static const signInEmailPage = 'sign-in/email';
  static const signInEmailPasswordPage = 'sign-in/email/password';
  static const signInEmailRecoverPage = 'sign-in/email/recover';
  static const signInEmailRegisterPage = 'sign-in/email/register';
  static const signInEmailLinkPage = 'sign-in/link';
  static const signInPhonePage = 'sign-in/phone';
  static const signInPhoneVerificationPage = 'sign-in/phone/verification';
  static const signInCountriesPage = 'sign-in/countries';
  static const signInUserInfoPage = 'sign-in/info';
  static const signInUnkonwnPage = 'sign-in/unknown';
}

class SignInRouter {
  static Route<dynamic> onGenerateRoute(
    RouteSettings settings,
    WidgetRef ref,
  ) {
    final isRootNavigator =
        settings.arguments != null ? (settings.arguments as bool) : true;

    if (isRootNavigator) {
      return platformPageRoute(
        builder: (_) => SignInNavigator(
          navigatorKey: signInNavigatorKey,
          routeName: settings.name!,
        ),
        fullscreenDialog: true,
      );
    } else {
      switch (settings.name) {
        case SignInRoutes.signInEmailPage:
          return platformPageRoute(
            builder: (_) => const SignInEmailPage(),
          );
        case SignInRoutes.signInEmailLinkPage:
          return platformPageRoute(
            builder: (_) => const SignInEmailLinkPage(),
          );
        case SignInRoutes.signInPhonePage:
          return MaterialWithModalsPageRoute(
            builder: (_) => const SignInPhonePage(),
          );
        case SignInRoutes.signInCountriesPage:
          return platformPageRoute(
            builder: (_) => const CountriesPage(),
          );
      }
      return platformPageRoute(
        builder: (_) => const SignInUnknownPage(),
      );
    }
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
          final navigator = signInNavigatorKey.currentState!;
          navigator.pop();
        },
        needUserInformation: () {
          /*final userInfoPage = ref.read(signInUserInfoPageProvider);
          if (userInfoPage != null) {
            final navigator = navigatorKey.currentState!;
            navigator.pushNamed(userInfoPage);
          }*/
          final navigator = navigatorKey.currentState!;
          navigator.pushNamed(SignInRoutes.signInUserInfoPage);
        },
        orElse: () => null,
      );
    });

    return Navigator(
      key: signInNavigatorKey,
      initialRoute: routeName,
      onGenerateRoute: (settings) => signInRouter(
          RouteSettings(
            name: settings.name!,
            arguments: (navigatorKey != signInNavigatorKey),
          ),
          ref),
    );
  }
}
