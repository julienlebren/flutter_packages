part of '../../../sign_in.dart';

class SplashPageBuilder extends ConsumerWidget {
  const SplashPageBuilder({
    required this.home,
    required this.landing,
    this.loader = const ScaffoldLoader(),
    Key? key,
  }) : super(key: key);

  final Widget loader;
  final Widget landing;
  final Widget home;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.read(authSettingsProvider);
    final authState = ref.watch(authStateProvider(settings));

    /*ref.listen<AuthState>(authStateProvider(authArguments), (
      previousState,
      authState,
    ) {
      authState.maybeWhen(
        authed: (_) {
          if (previousState == const AuthState.needUserInformation()) {
            final navigator = Navigator.of(context, rootNavigator: true);
            Future.delayed(const Duration(milliseconds: 200), () {
              navigator.pop();
            });
          }
        },
        needUserInformation: () {
          final supplier = ref.watch(signInSupplierProvider);
          if (supplier != null && !supplier.isThirdParty) {
            final navigator = SignInNavigatorKeys.modal.currentState!;
            navigator.pushReplacementNamed(SignInRoutes.signInUserInfoPage);
          } else {
            final navigator = Navigator.of(context, rootNavigator: true);
            Future.delayed(const Duration(milliseconds: 200), () {
              navigator.pushNamed(SignInRoutes.signInUserInfoPage,
                  arguments: true);
            });
          }
        },
        orElse: () => null,
      );
    });*/

    ref.listen<bool?>(settings.needUserInfoProvider!, (
      previous,
      needUserInfo,
    ) {
      if (needUserInfo != null) {
        if (needUserInfo) {
          final supplier = ref.watch(signInSupplierProvider);
          if (supplier != null && !supplier.isThirdParty) {
            final navigator = SignInNavigatorKeys.modal.currentState!;
            navigator.pushReplacementNamed(SignInRoutes.signInUserInfoPage);
          } else {
            final navigator = Navigator.of(context, rootNavigator: true);
            Future.delayed(const Duration(milliseconds: 200), () {
              navigator.pushNamed(SignInRoutes.signInUserInfoPage,
                  arguments: true);
            });
          }
        } else if (previous != null && previous && !needUserInfo) {
          final navigator = Navigator.of(context, rootNavigator: true);
          Future.delayed(const Duration(milliseconds: 200), () {
            navigator.pop();
          });
        }
      }
    });

    final authSplashState = ref.watch(authSplashProvider(settings));
    print("authSplashState is $authSplashState");
    return authSplashState.maybeWhen(
      initializing: () => loader,
      authed: () => home,
      orElse: () => landing,
    );
  }
}

final authSplashProvider =
    Provider.family<AuthSplashState, AuthSettings>((ref, settings) {
  final authState = ref.watch(authStateProvider(settings));

  return authState.maybeWhen(
    initializing: () => const AuthSplashState.initializing(),
    needUserInformation: () {
      final isSigninIn = ref.watch(signInSupplierProvider) != null;
      if (isSigninIn) {
        return const AuthSplashState.notAuthed();
      } else {
        return const AuthSplashState.initializing();
      }
    },
    authed: (_) => const AuthSplashState.authed(),
    error: (error) => AuthSplashState.error(error),
    orElse: () => const AuthSplashState.notAuthed(),
  );
});
