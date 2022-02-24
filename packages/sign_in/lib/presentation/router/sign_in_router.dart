part of '../../sign_in.dart';

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
  static const signInEmailPage = 'sign-in/email';
  static const signInEmailPasswordPage = 'sign-in/email/password';
  static const signInEmailRecoverPage = 'sign-in/email/recover';
  static const signInEmailRegisterPage = 'sign-in/email/register';
  static const signInLinkPage = 'sign-in/link';
  static const signInPhonePage = 'sign-in/phone';
  static const signInPhoneVerificationPage = 'sign-in/phone/verification';
}

class SignInRouter {
  static Route<dynamic> onGeneratModalRoute(
      RouteSettings settings, WidgetRef ref) {
    if (settings.name! == SignInRoutes.signInLandingPage) {
      final signInLandingPage = ref.read(signInLandingPageProvider);
      return platformPageRoute(
        builder: (_) => signInLandingPage,
      );
    } else {
      return platformPageRoute(
        builder: (_) => SignInNavigator(
          navigatorKey: SignInNavigatorKeys.modal,
          routeName: settings.name!,
        ),
        fullscreenDialog: true,
      );
    }
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
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
