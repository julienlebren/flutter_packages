part of '../../../sign_in.dart';

class SettingsDeletePage extends ConsumerWidget {
  const SettingsDeletePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(signInLocalizationsProvider);
    final isAnonymous = ref.watch(userAnonymousProvider);
    final authSettings = ref.watch(authSettingsProvider);

    ref.listen<AuthState>(authStateProvider(authSettings), (_, state) {
      state.maybeWhen(
        notAuthed: () {
          ref.read(currentTabIndexProvider.state).state = 0;
        },
        orElse: () => null,
      );
    });

    return SettingsPageBuilder(
      provider: settingsAccountControllerProvider,
      title: l10n.settingsAccountTitle,
      child: FormPage(
        children: [
          const Icon(
            Icons.security_update_warning_rounded,
            color: Colors.red,
          ),
          Text(
            l10n.settingsDeleteTitle,
            style: PlatformTextStyle.mediumTitle,
          ),
          Text(
            l10n.settingsDeleteCaption,
            style: const TextStyle(color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          const _DeleteButtonsSection(),
        ],
      ),
    );
  }
}

class _DeleteButtonsSection extends ConsumerWidget {
  const _DeleteButtonsSection({Key? key}) : super(key: key);

  _confirmDeletion(BuildContext context, WidgetRef ref) async {
    final l10n = ref.watch(signInLocalizationsProvider);

    showPlatformSheetAlert(
      context: context,
      ref: ref,
      title: l10n.settingsDeleteAlertTitle,
      actions: [
        AlertAction(
          title: l10n.settingsDeleteButton,
          onPressed: () {
            ref.read(signInAreaProvider.state).state = SignInArea.signIn;
            final controller =
                ref.read(signInButtonsControllerProvider.notifier);
            controller.signOut();
          },
          isDestructiveAction: true,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(signInLocalizationsProvider);

    return FormSection(
      children: [
        FormCenteredButton(
          value: l10n.settingsDeleteButton,
          isDestructive: true,
          onPressed: () => _confirmDeletion(context, ref),
        ),
        if (kDebugMode)
          FormCenteredButton(
            value: l10n.settingsLogoutButton,
            onPressed: () {
              ref.read(signInAreaProvider.state).state = SignInArea.signIn;
              final controller =
                  ref.read(signInButtonsControllerProvider.notifier);
              controller.signOut();
            },
          ),
      ],
    );
  }
}
