part of '../sign_in.dart';

final signInLandingPageSettingsProvider = Provider<SignInLandingPageSettings>(
    (_) => const SignInLandingPageSettings());

class SignInLandingPageSettings {
  const SignInLandingPageSettings({
    this.logo,
    this.buttons,
    this.backgroundImage,
  });

  final Widget? logo;
  final Widget? buttons;
  final String? backgroundImage;
}

class SignInPageBuilder extends StatelessWidget {
  const SignInPageBuilder({
    Key? key,
    this.landingPageSettings,
    this.theme,
    this.localizations,
    this.onGenerateCustomRoute,
  }) : super(key: key);

  final SignInLandingPageSettings? landingPageSettings;
  final SignInTheme? theme;
  final SignInLocalizations? localizations;
  final Function(RouteSettings settings)? onGenerateCustomRoute;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        if (landingPageSettings != null)
          signInLandingPageSettingsProvider
              .overrideWithValue(landingPageSettings!),
        if (theme != null) signInThemeProvider.overrideWithValue(theme!),
        if (localizations != null)
          signInLocalizationsProvider.overrideWithValue(localizations!),
      ],
      child: SignInNavigator(
        navigatorKey: SignInNavigatorKeys.main,
        routeName: SignInRoutes.signInLandingPage,
        onGenerateCustomRoute: onGenerateCustomRoute,
      ),
    );
  }
}

class SignInLandingPage extends ConsumerWidget {
  const SignInLandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(appThemeProvider);
    final settings = ref.watch(signInLandingPageSettingsProvider);

    return SafeArea(
      top: false,
      bottom: false,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: appTheme.scaffoldBackgroundColor,
          image: settings.backgroundImage != null
              ? DecorationImage(
                  image: AssetImage(settings.backgroundImage!),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Spacer(),
                  if (settings.logo != null) ...[
                    settings.logo!,
                    const Spacer(),
                  ],
                  if (settings.buttons != null) settings.buttons!,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
