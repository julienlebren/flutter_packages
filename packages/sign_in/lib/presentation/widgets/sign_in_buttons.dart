part of '../../sign_in.dart';

final signInSupplierProvider = StateProvider<SignInSupplier?>((_) => null);

enum SignInArea {
  signIn,
  settings,
}

final signInAreaProvider = StateProvider<SignInArea?>((_) => null);

void _handleSignIn(
  BuildContext context,
  WidgetRef ref,
  SignInButtonsEvent event,
) {
  ref.read(signInSupplierProvider.notifier).state = event.when(
    signInWithFacebook: () => SignInSupplier.facebook,
    signInWithGoogle: () => SignInSupplier.google,
    signInWithApple: () => SignInSupplier.apple,
    signInWithEmail: () => SignInSupplier.email,
    signInWithEmailLink: (_) => SignInSupplier.emailLink,
    signInWithPhone: () => SignInSupplier.phone,
    signInAnonymously: () => SignInSupplier.anonymous,
  );

  if (ref.read(signInAreaProvider) == null) {
    ref.read(signInAreaProvider.notifier).state = SignInArea.signIn;
  }

  final navigator = Navigator.of(context, rootNavigator: true);

  event.maybeWhen(
    signInWithPhone: () {
      navigator.pushNamed(SignInRoutes.signInPhonePage, arguments: true);
    },
    signInWithEmail: () {
      final signInArea = ref.watch(signInAreaProvider);
      if (signInArea == SignInArea.settings) {
        navigator.pushNamed(SignInRoutes.signInEmailRegisterPage,
            arguments: true);
      } else {
        navigator.pushNamed(SignInRoutes.signInEmailRegisterPage,
            arguments: true);
      }
    },
    signInWithEmailLink: (_) {
      navigator.pushNamed(SignInRoutes.signInEmailLinkPage, arguments: true);
    },
    orElse: () {
      final controller = ref.read(signInButtonsControllerProvider.notifier);
      controller.handleEvent(event);
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
      //success: () => true,
      orElse: () => false,
    );
    final suppliers = ref.watch(authSettingsProvider.select(
      (settings) => settings.suppliers,
    ));

    ref.listen<SignInButtonsState>(signInButtonsControllerProvider, (_, state) {
      state.maybeWhen(
        initial: () {
          ref.read(signInSupplierProvider.notifier).state = null;
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

    final buttonHeight =
        iconSize + (theme.buttonPadding * 2) + theme.spaceBetweenButtons + 1;

    double boxHeight = buttonHeight * suppliers.length;
    if (suppliers.contains(SignInSupplier.apple) && !isApple()) {
      boxHeight -= buttonHeight;
    }

    if (suppliers.last != SignInSupplier.anonymous) {
      boxHeight += 16;
    }

    return SizedBox(
      width: double.infinity,
      height: boxHeight,
      child: isLoading
          ? Center(
              child: SizedBox(
                width: 30,
                height: 30,
                child: PlatformActivityIndicator(
                    color: theme.scaffoldBackgroundColor.brightness ==
                            Brightness.dark
                        ? Colors.white
                        : null),
              ),
            )
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
                        color: (theme.scaffoldBackgroundColor.brightness ==
                                Brightness.dark
                            ? Colors.white
                            : Colors.black),
                      ),
                    ),
                  ] else ...[
                    if (isApple() ||
                        (!isApple() && supplier != SignInSupplier.apple))
                      ProviderScope(
                        overrides: [
                          _currentSupplier.overrideWithValue(supplier),
                        ],
                        child: const SignInSupplierButton(),
                      ),
                    SizedBox(height: theme.spaceBetweenButtons),
                  ],
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

class SignInButton extends PlatformWidgetBase<ElevatedButton, CupertinoButton,
    ElevatedButton> {
  const SignInButton({Key? key}) : super(key: key);

  @override
  ElevatedButton createMaterialWidget(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(signInThemeProvider);
    final supplier = ref.watch(_currentSupplier);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: theme.buttonBackgroundColor,
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

  @override
  ElevatedButton createWebWidget(BuildContext context, WidgetRef ref) =>
      createMaterialWidget(context, ref);
}

class SignInButtonContents extends ConsumerWidget {
  const SignInButtonContents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final supplier = ref.watch(_currentSupplier);
    final signInArea = ref.watch(signInAreaProvider);
    final l10n = ref.watch(signInLocalizationsProvider);
    final buttonTextColor = signInArea == SignInArea.settings
        ? ref.watch(appThemeProvider.select((theme) => theme.textColor))
        : ref.watch(signInThemeProvider.select(
            (theme) => theme.buttonTextColor,
          ));
    final buttonFontSize = ref.watch(signInThemeProvider.select(
      (theme) => theme.buttonFontSize,
    ));
    final iconSize = buttonFontSize * 1.3;

    return Row(
      children: <Widget>[
        supplier.icon(size: iconSize, color: buttonTextColor),
        const Spacer(),
        Text(
          signInArea == SignInArea.settings
              ? l10n.settingsCreateAccountWith(supplier.name(l10n))
              : l10n.signInWith(supplier.name(l10n)),
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
