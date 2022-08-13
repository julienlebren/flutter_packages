part of '../../../sign_in.dart';

class SettingsDeletePage extends ConsumerWidget {
  const SettingsDeletePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(signInLocalizationsProvider);
    final authSettings = ref.watch(authSettingsProvider);
    final isSaving = ref.watch(
      settingsEmailControllerProvider.select((state) => state.isLoading),
    );

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
      isSaving: isSaving,
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
            // Détermine la zone de SignIn dans laquelle on se situe (signIn ou settings), 
            //ce qui influencera certains paramètres comme la couleur des boutons Apple/Google/etc
            ref.read(signInAreaProvider.state).state = SignInArea.signIn;

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
    final isSaving = ref.watch(
      settingsEmailControllerProvider.select((state) => state.isLoading),
    );

    return FormSection(
      children: [
        FormCenteredButton(
          value: l10n.settingsDeleteButton,
          isDestructive: true,
          onPressed: isSaving ? null : () => _confirmDeletion(context, ref),
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
            // Détermine la zone de SignIn dans laquelle on se situe (signIn ou settings), 
            //ce qui influencera certains paramètres comme la couleur des boutons Apple/Google/etc
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
