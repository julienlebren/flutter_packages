part of '../sign_in.dart';

class SignInButtons extends ConsumerWidget {
  const SignInButtons({
    Key? key,
    this.l10n = const SignInLocalizations(),
    required this.theme,
    this.useAppleOnlyOnCupertino = true,
    this.providers = const [],
  }) : super(key: key);

  void _handleEvent(WidgetRef ref, SignInEvent event) {
    final controller = ref.read(signInControllerProvider.notifier);
    controller.handleEvent(event);
  }

  final SignInLocalizations l10n;
  final SignInTheme theme;
  final bool useAppleOnlyOnCupertino;
  final List<SignInProvider> providers;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
    final displayApple =
        (useAppleOnlyOnCupertino && isCupertino()) || !useAppleOnlyOnCupertino;

    double boxHeight = buttonHeight * providers.length;
    if (providers.contains(SignInProvider.apple) && !displayApple) {
      boxHeight -= buttonHeight;
    }

    return SizedBox(
      height: boxHeight,
      child: isLoading
          ? const Loader(delayBeforeDisplay: 0)
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (var provider in providers) ...[
                  if (provider == SignInProvider.anonymous)
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
                  if (provider == SignInProvider.google)
                    socialButton(
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
                  if (provider == SignInProvider.apple && displayApple)
                    socialButton(
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
                  if (provider == SignInProvider.facebook)
                    socialButton(
                      assetName: "assets/images/facebook-logo.png",
                      iconSize: iconSize,
                      title: l10n.signInWithFacebook,
                      onPressed: () {
                        _handleEvent(
                            ref, const SignInEvent.signInWithFacebook());
                      },
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
    required double iconSize,
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
