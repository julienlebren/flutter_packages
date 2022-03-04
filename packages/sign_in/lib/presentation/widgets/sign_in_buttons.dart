part of '../../sign_in.dart';

final signInSupplierProvider = StateProvider<SignInSupplier?>((_) => null);

class SignInButtons extends ConsumerWidget {
  SignInButtons(this.suppliers, {Key? key}) : super(key: key) {
    if (suppliers.contains(SignInSupplier.phone)) {
      FlutterLibphonenumber().init();
    }
  }

  final List<SignInSupplier> suppliers;

  void _handleSignIn(
      BuildContext context, WidgetRef ref, SignInButtonsEvent event) {
    ref.read(signInSupplierProvider.state).state = event.when(
      signInWithFacebook: () => SignInSupplier.facebook,
      signInWithGoogle: () => SignInSupplier.google,
      signInWithApple: () => SignInSupplier.apple,
      signInWithEmail: () => SignInSupplier.email,
      signInWithEmailLink: (_) => SignInSupplier.emailLink,
      signInWithPhone: () => SignInSupplier.phone,
      signInAnonymously: () => SignInSupplier.anonymous,
    );

    final navigator = SignInNavigatorKeys.main.currentState!;

    event.maybeWhen(
      signInWithPhone: () {
        navigator.pushNamed(SignInRoutes.signInPhonePage);
      },
      signInWithEmail: () {
        navigator.pushNamed(SignInRoutes.signInEmailPage);
      },
      signInWithEmailLink: (_) {
        navigator.pushNamed(SignInRoutes.signInEmailLinkPage);
      },
      orElse: () {
        final authState = ref.read(authStateProvider);
        if (authState == const AuthState.needUserInformation()) {
          navigator.pushNamed(SignInRoutes.signInUnknownPage);
        } else {
          final controller = ref.read(signInButtonsControllerProvider.notifier);
          controller.handleEvent(event);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(signInLocalizationsProvider);
    final theme = ref.watch(signInThemeProvider);
    final state = ref.watch(signInButtonsControllerProvider);
    final isLoading = state.maybeWhen(
      loading: () => true,
      success: () => true,
      orElse: () => false,
    );

    ref.listen<SignInButtonsState>(signInButtonsControllerProvider, (_, state) {
      state.maybeWhen(
        initial: () {
          ref.read(signInSupplierProvider.state).state = null;
        },
        error: (errorText) {
          showErrorDialog(
            context,
            ref,
            title: l10n.errorTitle,
            content: errorText,
          );
        },
        orElse: () => null,
      );
    });

    final iconSize = theme.buttonFontSize * 1.6;
    final iconTidySize = iconSize * (25 / 31);

    final buttonHeight =
        iconSize + (theme.buttonPadding * 2) + theme.spaceBetweenButtons + 1;

    double boxHeight = buttonHeight * suppliers.length;
    if (suppliers.contains(SignInSupplier.apple) && !isCupertino()) {
      boxHeight -= buttonHeight;
    }

    if (suppliers.last != SignInSupplier.anonymous) {
      boxHeight += 16;
    }

    return SizedBox(
      height: boxHeight,
      child: isLoading
          ? const Loader(delayBeforeDisplay: 0)
          : Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                for (var supplier in suppliers) ...[
                  if (supplier == SignInSupplier.anonymous)
                    SizedBox(
                      width: double.infinity,
                      child: PlatformTextButton(
                        title: l10n.signInAnonymously,
                        onPressed: () {
                          _handleSignIn(context, ref,
                              const SignInButtonsEvent.signInAnonymously());
                        },
                        color: theme.buttonTextColor,
                      ),
                    ),
                  if (supplier == SignInSupplier.google)
                    SignInSupplierButton(
                      icon: SizedBox(
                        width: iconTidySize,
                        height: iconTidySize,
                        child: CustomPaint(
                          painter: GoogleLogoPainter(),
                        ),
                      ),
                      iconSize: iconSize,
                      title: l10n.signInWithGoogle,
                      onPressed: () {
                        _handleSignIn(context, ref,
                            const SignInButtonsEvent.signInWithGoogle());
                      },
                    ),
                  if (supplier == SignInSupplier.apple && isCupertino())
                    SignInSupplierButton(
                      icon: SizedBox(
                        width: iconTidySize,
                        height: iconSize,
                        child: CustomPaint(
                          painter: AppleLogoPainter(
                            color: theme.buttonTextColor,
                          ),
                        ),
                      ),
                      iconSize: iconSize,
                      title: l10n.signInWithApple,
                      onPressed: () {
                        _handleSignIn(context, ref,
                            const SignInButtonsEvent.signInWithApple());
                      },
                    ),
                  if (supplier == SignInSupplier.facebook)
                    SignInSupplierButton(
                      assetName: "assets/images/facebook-logo.png",
                      iconSize: iconSize,
                      title: l10n.signInWithFacebook,
                      onPressed: () {
                        _handleSignIn(context, ref,
                            const SignInButtonsEvent.signInWithFacebook());
                      },
                    ),
                  if (supplier == SignInSupplier.email ||
                      supplier == SignInSupplier.emailLink)
                    SignInSupplierButton(
                      icon: Icon(
                        Icons.email_outlined,
                        color: theme.buttonTextColor,
                        size: iconSize,
                      ),
                      iconSize: iconSize,
                      title: l10n.signInWithEmail,
                      onPressed: () {
                        _handleSignIn(
                          context,
                          ref,
                          supplier == SignInSupplier.email
                              ? const SignInButtonsEvent.signInWithEmail()
                              : const SignInButtonsEvent.signInWithEmailLink(
                                  ""),
                        );
                      },
                    ),
                  if (supplier == SignInSupplier.phone)
                    SignInSupplierButton(
                      icon: Icon(
                        Icons.phone_android,
                        color: theme.buttonTextColor,
                        size: iconSize,
                      ),
                      iconSize: iconSize,
                      title: l10n.signInWithPhone,
                      onPressed: () {
                        _handleSignIn(context, ref,
                            const SignInButtonsEvent.signInWithPhone());
                      },
                    ),
                  SizedBox(height: theme.spaceBetweenButtons),
                ],
              ],
            ),
    );
  }
}

class SignInSupplierButton extends ConsumerWidget {
  const SignInSupplierButton({
    Key? key,
    this.assetName,
    this.icon,
    required this.iconSize,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  final String? assetName;
  final Widget? icon;
  final double iconSize;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(signInThemeProvider);

    return Container(
      constraints: BoxConstraints(maxWidth: theme.maxWidth),
      child: SizedBox(
        width: double.infinity,
        child: SignInButton(
          assetName: assetName,
          icon: icon,
          iconSize: iconSize,
          title: title,
          color: theme.buttonBackgroundColor,
          textColor: theme.buttonTextColor,
          padding: theme.buttonPadding,
          radius: theme.buttonRadius,
          fontSize: theme.buttonFontSize,
          onPressed: onPressed,
        ),
      ),
    );
  }
}

class SignInCompleteButton extends StatelessWidget {
  const SignInCompleteButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        Text("Your profile is incomplete."),
      ],
    );
  }
}
