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
      title: l10n.settingsDeleteTitle,
      child: FormPage(
        children: [
          const Icon(
            Icons.security_update_warning_rounded,
            size: 100,
            color: Colors.red,
          ),
          Text(
            l10n.settingsDeleteCaption,
            style: const TextStyle(color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          const _DeleteButton(),
          if (kDebugMode) const _LogoutButton(),
        ],
      ),
    );
  }
}

class _DeleteButton extends ConsumerWidget {
  const _DeleteButton({Key? key}) : super(key: key);

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
            final controller =
                ref.read(settingsDeleteControllerProvider.notifier);
            controller.delete();
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
      ],
    );
  }
}

class _LogoutButton extends ConsumerWidget {
  const _LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(signInLocalizationsProvider);

    return FormSection(
      children: [
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
