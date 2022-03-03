part of '../../sign_in.dart';

final signInRouterProvider =
    Provider<Route<dynamic>? Function(RouteSettings settings, WidgetRef ref)>(
  (_) => SignInRouter.onGenerateRoute,
);

final signInLandingPageProvider =
    Provider<Widget>((_) => const SizedBox.shrink());

class SignInNavigatorKeys {
  static final main = GlobalKey<NavigatorState>();
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
}

class SignInRouter {
  static Route<dynamic>? onGenerateRoute(
    RouteSettings settings,
    WidgetRef ref,
  ) {
    final isRootNavigator =
        settings.arguments != null ? (settings.arguments as bool) : true;

    if (isRootNavigator) {
      return platformPageRoute(
        builder: (_) => SignInNavigator(
          navigatorKey: SignInNavigatorKeys.modal,
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
    }
    return null;
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

    ref.listen<AuthState>(authStateProvider, (previousAuthState, authState) {
      authState.maybeWhen(
        authed: (_) {
          if (navigatorKey == SignInNavigatorKeys.main) {
            final navigator = SignInNavigatorKeys.main.currentState!;
            navigator.pop();
          }
        },
        needUserInformation: () {
          final navigator = navigatorKey.currentState!;

          if (navigatorKey == SignInNavigatorKeys.modal) {
            navigator.pushReplacementNamed(SignInRoutes.signInUserInfoPage);
          } else {
            final signInSupplier = ref.read(signInSupplierProvider);
            if (signInSupplier == SignInSupplier.apple ||
                signInSupplier == SignInSupplier.google ||
                signInSupplier == SignInSupplier.facebook) {
              navigator.pushNamed(SignInRoutes.signInLandingPage);
            }
          }
        },
        orElse: () => null,
      );
    });

    var initialRoute = routeName;
    if (navigatorKey == SignInNavigatorKeys.modal) {
      final authState = ref.read(authStateProvider);
      if (authState == const AuthState.needUserInformation()) {
        initialRoute = SignInRoutes.signInUserInfoPage;
      }
    }

    return Navigator(
      key: navigatorKey,
      initialRoute: initialRoute,
      onGenerateRoute: (settings) => signInRouter(
          RouteSettings(
            name: settings.name!,
            arguments: (navigatorKey == SignInNavigatorKeys.main),
          ),
          ref),
    );
  }
}
