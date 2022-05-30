part of '../../sign_in.dart';

class AnonymousBadge extends ConsumerWidget {
  const AnonymousBadge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(signInLocalizationsProvider);

    return GestureDetector(
      onTap: () =>
          Navigator.pushNamed(context, SettingsRoutes.settingsAccountPage),
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
                  Column(
                    children: [
                      Flexible(
                        child: Text(
                          l10n.settingsNoAccount,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                          ),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        l10n.settingsCreateAccountButton,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
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
