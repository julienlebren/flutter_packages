part of '../sign_in.dart';

final signInLandingProvider = Provider<Widget>((_) => const SizedBox.shrink());

class SignInLandingPage extends ConsumerWidget {
  const SignInLandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(signInThemeProvider);
    final child = ref.read(signInLandingProvider);

    return PlatformScaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: theme.landingBackgroundImage != null
              ? DecorationImage(
                  image: AssetImage(theme.landingBackgroundImage!),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Spacer(),
                child,
                const Spacer(),
                const SignInButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignInButtons extends ConsumerWidget {
  const SignInButtons({Key? key}) : super(key: key);

  void _handleEvent(WidgetRef ref, SignInEvent event) {
    final controller = ref.read(signInControllerProvider.notifier);
    controller.handleEvent(event);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(signInLocalizationsProvider);
    final theme = ref.watch(signInThemeProvider);
    final suppliers = ref.read(signInSuppliersProvider);
    final state = ref.watch(signInControllerProvider);
    final isLoading = state.maybeWhen(
      loading: () => true,
      success: () => true,
      orElse: () => false,
    );

    ref.listen<SignInState>(signInControllerProvider, (_, state) {
      state.maybeWhen(
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

    return SizedBox(
      height: boxHeight,
      child: isLoading
          ? const Loader(delayBeforeDisplay: 0)
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (var provider in suppliers) ...[
                  if (provider == SignInSupplier.anonymous)
                    SizedBox(
                      width: double.infinity,
                      child: PlatformTextButton(
                        title: l10n.signInAnonymously,
                        onPressed: () {
                          _handleEvent(
                              ref, const SignInEvent.signInAnonymously());
                        },
                        color: theme.buttonTextColor,
                      ),
                    ),
                  if (provider == SignInSupplier.google)
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
                        _handleEvent(ref, const SignInEvent.signInWithGoogle());
                      },
                    ),
                  if (provider == SignInSupplier.apple && isCupertino())
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
                        _handleEvent(ref, const SignInEvent.signInWithApple());
                      },
                    ),
                  if (provider == SignInSupplier.facebook)
                    SignInSupplierButton(
                      assetName: "assets/images/facebook-logo.png",
                      iconSize: iconSize,
                      title: l10n.signInWithFacebook,
                      onPressed: () {
                        _handleEvent(
                            ref, const SignInEvent.signInWithFacebook());
                      },
                    ),
                  if (provider == SignInSupplier.email)
                    SignInSupplierButton(
                      icon: Icon(
                        Icons.email_outlined,
                        color: theme.buttonTextColor,
                        size: iconSize,
                      ),
                      iconSize: iconSize,
                      title: l10n.signInWithEmail,
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true)
                            .pushNamed(SignInRoutes.signInEmailPage);
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
