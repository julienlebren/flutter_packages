part of '../../sign_in.dart';

final accountPageProvider = Provider<VoidCallback?>((_) => null);

class AnonymousBadge extends ConsumerWidget {
  const AnonymousBadge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(signInLocalizationsProvider);
    final appTheme = ref.watch(appThemeProvider);
    final accountPageRedirection = ref.watch(accountPageProvider);

    return GestureDetector(
      onTap: () {
        if (accountPageRedirection != null) {
          accountPageRedirection();
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
