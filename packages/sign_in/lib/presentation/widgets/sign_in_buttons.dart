part of '../../sign_in.dart';

final signInSupplierProvider = StateProvider<SignInSupplier?>((_) => null);

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
      final authStateArguments = ref.watch(authSettingsProvider);
      final authState = ref.read(authStateProvider(authStateArguments));
      if (authState == const AuthState.needUserInformation()) {
        navigator.pushNamed(SignInRoutes.signInUnknownPage);
      } else {
        final controller = ref.read(signInButtonsControllerProvider.notifier);
        controller.handleEvent(event);
      }
    },
  );
}

class SignInButtons extends ConsumerStatefulWidget {
  const SignInButtons({Key? key}) : super(key: key);

  @override
  createState() => _SignInButtonsState();
}

class _SignInButtonsState extends ConsumerState<SignInButtons> {
  @override
  void initState() {
    super.initState();
    final suppliers = ref.read(authSettingsProvider).suppliers;
    if (suppliers.contains(SignInSupplier.phone)) {
      FlutterLibphonenumber().init();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(signInLocalizationsProvider);
    final theme = ref.watch(signInThemeProvider);
    final state = ref.watch(signInButtonsControllerProvider);
    final isLoading = state.maybeWhen(
      loading: () => true,
      success: () => true,
      orElse: () => false,
    );
    final suppliers = ref.watch(authSettingsProvider.select(
      (settings) => settings.suppliers,
    ));

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
                for (final supplier in suppliers) ...[
                  if (supplier == SignInSupplier.anonymous) ...[
                    SizedBox(
                      width: double.infinity,
                      child: PlatformTextButton(
                        title: l10n.signInAnonymously,
                        onPressed: () {
                          _handleSignIn(
                              context, ref, supplier.signInButtonsEvent);
                        },
                        color: theme.buttonTextColor,
                      ),
                    ),
                  ] else ...[
                     ProviderScope(
                      overrides: [
                        _currentSupplier.overrideWithValue(supplier),
                      ],
                      child: const SignInSupplierButton(),
                    ),
                    SizedBox(height: theme.spaceBetweenButtons),
                  ],

                  /*
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
                  */
                ],
              ],
            ),
    );
  }
}

class SignInSupplierButton extends ConsumerWidget {
  const SignInSupplierButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final maxWidth = ref.watch(signInThemeProvider.select(
      (theme) => theme.maxWidth,
    ));

    return Container(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: const SizedBox(
        width: double.infinity,
        child: SignInButton(),
      ),
    );
  }
}

final _currentSupplier = Provider<SignInSupplier>((ref) {
  throw UnimplementedError();
});

class SignInButton extends PlatformWidgetBase<ElevatedButton, CupertinoButton> {
  const SignInButton({Key? key}) : super(key: key);

  @override
  ElevatedButton createMaterialWidget(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(signInThemeProvider);
    final supplier = ref.watch(_currentSupplier);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: theme.buttonBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(theme.buttonRadius),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: theme.buttonPadding),
        child: const SignInButtonContents(),
      ),
      onPressed: () {
        _handleSignIn(context, ref, supplier.signInButtonsEvent);
      },
    );
  }

  @override
  CupertinoButton createCupertinoWidget(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(signInThemeProvider);
    final supplier = ref.watch(_currentSupplier);

    return CupertinoButton(
      color: theme.buttonBackgroundColor,
      padding: EdgeInsets.all(theme.buttonPadding),
      borderRadius: BorderRadius.circular(theme.buttonRadius),
      child: const SignInButtonContents(),
      onPressed: () {
        _handleSignIn(context, ref, supplier.signInButtonsEvent);
      },
    );
  }
}

class SignInButtonContents extends ConsumerWidget {
  const SignInButtonContents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final supplier = ref.watch(_currentSupplier);
    final l10n = ref.watch(signInLocalizationsProvider);
    final buttonTextColor = ref.watch(signInThemeProvider.select(
      (theme) => theme.buttonTextColor,
    ));
    final buttonFontSize = ref.watch(signInThemeProvider.select(
      (theme) => theme.buttonFontSize,
    ));

    return Row(
      children: <Widget>[
        supplier.icon(size: 16, color: buttonTextColor),
        const Spacer(),
        Text(
          l10n.signInWith(supplier.name(l10n)),
          style: TextStyle(
            fontSize: buttonFontSize,
            fontWeight: FontWeight.w400,
            color: buttonTextColor,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
