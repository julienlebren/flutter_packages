part of '../sign_in.dart';

class SignInRoutes {
  static const signInLandingPage = '/sign-in';
  static const signInEmailPage = '/sign-in/email';
  static const signInEmailPasswordPage = '/sign-in/email/password';
  static const signInPhonePage = '/sign-in-phone-page';
  static const signInVerificationPage = '/sign-in-verification-page';
  static const signInProfilePage = '/sign-in-profile-page';
  static const signInPhotoPage = '/sign-in-photo-page';
}

class SignInRouter extends StatelessWidget {
  const SignInRouter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: SignInRoutes.signInLandingPage,
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name != null) {
          switch (settings.name) {
            case SignInRoutes.signInLandingPage:
              return platformPageRoute(
                builder: (_) => const SignInLandingPage(),
              );
            case SignInRoutes.signInEmailPage:
              return platformPageRoute(
                builder: (_) => const SignInEmailPage(),
              );
            case SignInRoutes.signInEmailPasswordPage:
              return platformPageRoute(
                builder: (_) => const SignInEmailPasswordPage(),
              );
          }
        }
        return null;
      },
    );
  }
}
