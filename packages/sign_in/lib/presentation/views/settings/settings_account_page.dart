part of '../../../sign_in.dart';

class SettingsAccountPage extends ConsumerWidget {
  const SettingsAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(signInLocalizationsProvider);
    return SettingsPageBuilder(
      title: l10n.settingsAccountTitle,
      child: const FormPage(
        children: [
          _EmailSection(),
          _SocialSection(),
          _LogoutSection(),
        ],
      ),
    );
  }
}

class _EmailSection extends ConsumerWidget {
  const _EmailSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(signInLocalizationsProvider);
    final emailAddress = "user@test.com";
    /* ref.watch(userProvider.select(
      (user) => user?.emailAddress,
    ));*/
    final hasPassword =
        false; /*ref.watch(userProvider.select(
      (user) => user?.hasPassword ?? false,
    ));*/

    return FormSection(
      title: l10n.settingsEmailSectionTitle,
      children: [
        FormTappableField(
          label: l10n.settingsEmailLabel,
          value: emailAddress,
          onPressed: () {},
        ),
        FormTappableField(
          label: l10n.settingsPasswordLabel,
          value: hasPassword
              ? l10n.settingsPasswordEdit
              : l10n.settingsPasswordUndefined,
          onPressed: () {},
        ),
      ],
      caption: hasPassword ? null : l10n.settingsPasswordUndefinedCaption,
    );
  }
}

class _SocialSection extends ConsumerWidget {
  const _SocialSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(signInLocalizationsProvider);
    final formTheme = ref.watch(formThemeProvider);
    final listViewTheme = ref.watch(listViewThemeProvider);

    return ProviderScope(
      overrides: [
        formThemeProvider.overrideWithValue(
          formTheme.copyWith(rowDividerPadding: 40.0),
        ),
      ],
      child: FormSection(
        title: l10n.settingsThirdPartySectionTitle,
        children: [
          ProviderScope(
            overrides: [
              listViewThemeProvider.overrideWithValue(
                listViewTheme.copyWith(valueColor: Colors.green),
              ),
            ],
            child: FormTappableField(
              leading: SizedBox(
                width: 16,
                height: 16,
                child: CustomPaint(
                  painter: GoogleLogoPainter(),
                ),
              ),
              label: "Google",
              value: l10n.settingsThirdPartyConnected,
              onPressed: () {},
            ),
          ),
          FormTappableField(
            leading: SizedBox(
              width: 16,
              height: 16 / (25 / 31),
              child: CustomPaint(
                painter: AppleLogoPainter(
                  color: listViewTheme.labelColor,
                ),
              ),
            ),
            label: "Apple",
            value: l10n.settingsThirdPartyNotConnected,
            onPressed: () {},
          ),
        ],
        caption: l10n.settingsThirdPartyCaption,
      ),
    );
  }
}

class _LogoutSection extends ConsumerWidget {
  const _LogoutSection({Key? key}) : super(key: key);

  _confirmLogout(BuildContext context, WidgetRef ref) async {
    final l10n = ref.watch(signInLocalizationsProvider);
    await showAlertDialog(
      context,
      ref,
      title: l10n.settingsLogoutButton,
      content: l10n.settingsLogoutConfirmation,
      displayCancelButton: true,
      actions: [
        PlatformDialogAction(
          buttonText: l10n.settingsLogoutButton,
          isDestructiveAction: true,
          isDefaultAction: true,
          onPressed: () async {
            if (isMaterial()) {
              Navigator.of(context, rootNavigator: true).pop();
            }
            final controller =
                ref.read(signInButtonsControllerProvider.notifier);
            controller.signOut();
          },
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
          value: l10n.settingsLogoutButton,
          isDestructive: true,
          onPressed: () => _confirmLogout(context, ref),
        ),
      ],
    );
  }
}
