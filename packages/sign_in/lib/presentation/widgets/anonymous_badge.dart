part of '../../sign_in.dart';

final redirectionSettingsProvider =
    Provider<AnonymousRedirectionSettings?>((_) => null);

class AnonymousRedirectionSettings {
  AnonymousRedirectionSettings({
    required this.navigatorKey,
    required this.tabIndex,
  });
  final GlobalKey<NavigatorState> navigatorKey;
  final int tabIndex;
}

class AnonymousBadge extends ConsumerWidget {
  const AnonymousBadge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(signInLocalizationsProvider);
    final appTheme = ref.watch(appThemeProvider);
    final redirectionSettings = ref.watch(redirectionSettingsProvider);

    return GestureDetector(
      onTap: () {
        if (redirectionSettings != null) {
          ref.read(currentTabIndexProvider.state).state =
              redirectionSettings.tabIndex;
          Future<void>.delayed(const Duration(milliseconds: 500), () {
            final navigator = redirectionSettings.navigatorKey.currentState!;
            print(
                ModalRoute.of(redirectionSettings.navigatorKey.currentContext!)!
                    .settings
                    .name);
            navigator.pushNamed(SettingsRoutes.settingsAccountPage);
          });
        } else {
          Navigator.pushNamed(context, SettingsRoutes.settingsAccountPage);
        }
      },
      child: FormSection(
        child: Padding(
          padding: EdgeInsets.only(top: isMaterial() ? 10 : 0),
          child: Container(
            color: Colors.amber,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.warning,
                    color: Colors.black,
                    size: 40,
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    child: Text(
                      l10n.settingsNoAccount,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                      maxLines: 8,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  ProviderScope(
                    overrides: [
                      appThemeProvider.overrideWithValue(appTheme.copyWith(
                        disclosureIndicatorColor: Colors.black,
                      ))
                    ],
                    child: const PlatformDisclosureIndicator(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
