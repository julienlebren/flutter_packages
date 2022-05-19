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

    ref.listen<AuthState>(authStateProvider(settings), (
      previousState,
      authState,
    ) {
      authState.maybeWhen(
        authed: (_) {
          previousState?.maybeWhen(
            needUserInformation: (_) {
              final navigator = Navigator.of(context, rootNavigator: true);
              Future.delayed(const Duration(milliseconds: 200), () {
                navigator.pop();
              });
            },
            orElse: () => null,
          );
        },
        needUserInformation: (_) {
          final supplier = ref.watch(signInSupplierProvider);
          if (supplier != null && !supplier.isThirdParty) {
            final navigator = SignInNavigatorKeys.modal.currentState!;
            navigator.pushReplacementNamed(SignInRoutes.signInUserInfoPage);
          } else {
            final navigator = Navigator.of(context, rootNavigator: true);
            Future.delayed(const Duration(milliseconds: 300), () {
              navigator.pushNamed(SignInRoutes.signInUserInfoPage,
                  arguments: true);
            });
          }
        },
        orElse: () => null,
      );
    });

    /*ref.listen<bool?>(settings.needUserInfoProvider!, (
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
    });*/

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
    needUserInformation: (status) {
      switch (status) {
        case NeedUserInfo.signIn:
          return const AuthSplashState.notAuthed();
        case NeedUserInfo.launching:
          return const AuthSplashState.initializing();
        case NeedUserInfo.settings:
          return const AuthSplashState.authed();
      }
    },
    authed: (_) => const AuthSplashState.authed(),
    error: (error) => AuthSplashState.error(error),
    orElse: () => const AuthSplashState.notAuthed(),
  );
});
