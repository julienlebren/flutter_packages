part of '../sign_in.dart';

class SignInButtons extends ConsumerWidget {
  const SignInButtons({
    Key? key,
    this.l10n = const SignInLocalizations(),
    required this.theme,
    this.useApple = true,
    this.useAppleOnlyOnCupertino = true,
    this.useGoogle = true,
    this.useFacebook = true,
    this.useAnonymous = true,
  }) : super(key: key);

  void _handleEvent(WidgetRef ref, SignInEvent event) {
    final controller = ref.read(signInControllerProvider.notifier);
    controller.handleEvent(event);
  }

  final SignInLocalizations l10n;
  final SignInTheme theme;
  final bool useApple;
  final bool useAppleOnlyOnCupertino;
  final bool useGoogle;
  final bool useFacebook;
  final bool useAnonymous;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(signInControllerProvider);
    final isLoading = state.maybeWhen(
      loading: () => true,
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

    final buttonHeight = theme.buttonFontSize * 1.6 +
        (theme.buttonPadding * 2) +
        theme.spaceBetweenButtons;
    final displayApple =
        ((useApple && (useAppleOnlyOnCupertino && isCupertino())) ||
            (useApple && !useAppleOnlyOnCupertino));

    final boxHeight = (displayApple ? buttonHeight : 0.0) +
        (useGoogle ? buttonHeight : 0.0) +
        (useFacebook ? buttonHeight : 0.0) +
        (useAnonymous ? buttonHeight : 0.0);

    final defaultLogoSize = theme.buttonFontSize * 1.6 * (25 / 31);

    return SizedBox(
      height: boxHeight,
      child: isLoading
          ? const Loader(delayBeforeDisplay: 0)
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (displayApple) ...[
                  socialButton(
                    icon: SizedBox(
                      width: defaultLogoSize,
                      height: theme.buttonFontSize * 1.6,
                      child: CustomPaint(
                        painter: AppleLogoPainter(
                          color: theme.buttonTextColor,
                        ),
                      ),
                    ),
                    title: l10n.signInWithApple,
                    onPressed: () {
                      _handleEvent(ref, const SignInEvent.signInWithApple());
                    },
                  ),
                  SizedBox(height: theme.spaceBetweenButtons),
                ],
                if (useGoogle) ...[
                  socialButton(
                    icon: SizedBox(
                      width: defaultLogoSize,
                      height: defaultLogoSize,
                      child: CustomPaint(
                        painter: GoogleLogoPainter(),
                      ),
                    ),
                    title: l10n.signInWithGoogle,
                    onPressed: () {
                      _handleEvent(ref, const SignInEvent.signInWithGoogle());
                    },
                  ),
                  SizedBox(height: theme.spaceBetweenButtons),
                ],
                if (useFacebook) ...[
                  socialButton(
                    assetName: "assets/images/facebook-logo.png",
                    title: l10n.signInWithFacebook,
                    onPressed: () {
                      _handleEvent(ref, const SignInEvent.signInWithFacebook());
                    },
                  ),
                  SizedBox(height: theme.spaceBetweenButtons),
                ],
                if (useAnonymous) ...[
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
                  SizedBox(height: theme.spaceBetweenButtons),
                ],
              ],
            ),
    );
  }

  Widget socialButton({
    String? assetName,
    Widget? icon,
    required String title,
    required VoidCallback onPressed,
  }) {
    return Container(
      constraints: BoxConstraints(maxWidth: theme.maxWidth),
      child: SizedBox(
        width: double.infinity,
        child: SignInButton(
          assetName: assetName,
          icon: icon,
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
