part of '../../../sign_in.dart';

final userEmailProvider = Provider<User?>((ref) {
  final userChanges = ref.watch(userChangesProvider);

  return userChanges.maybeWhen(
    data: (user) {
      print("user is $user");
      return user;
    },
    orElse: () => null,
  );
});

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
    final service = ref.watch(authServiceProvider);
    final user = ref.watch(userEmailProvider);

    return FormSection(
      title: l10n.settingsEmailSectionTitle,
      children: [
        FormTappableField(
          label: l10n.settingsEmailLabel,
          value: service.email ?? l10n.settingsUndefined,
          onPressed: () {
            Navigator.of(context, rootNavigator: true)
                .pushNamed(SettingsRoutes.settingsEmailPage);
          },
        ),
        FormTappableField(
          label: l10n.settingsPasswordLabel,
          value: service.hasPassword
              ? l10n.settingsPasswordEdit
              : l10n.settingsUndefined,
          onPressed: () {
            Navigator.of(context, rootNavigator: true)
                .pushNamed(SettingsRoutes.settingsPasswordPage);
          },
        ),
      ],
      caption:
          service.hasPassword ? null : l10n.settingsPasswordUndefinedCaption,
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
    final service = ref.watch(authServiceProvider);
    final suppliers = ref.watch(authSettingsProvider.select(
      (settings) => settings.suppliers,
    ));

    return ProviderScope(
      overrides: [
        formThemeProvider.overrideWithValue(
          formTheme.copyWith(rowDividerPadding: 40.0),
        ),
      ],
      child: FormSection(
        title: l10n.settingsThirdPartySectionTitle,
        children: [
          for (final supplier in suppliers) ...[
            if (supplier == SignInSupplier.google)
              ProviderScope(
                overrides: [
                  if (service.hasGoogle)
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
                  value: service.hasGoogle
                      ? l10n.settingsThirdPartyConnected
                      : l10n.settingsThirdPartyNotConnected,
                  onPressed: () {
                    if (service.hasGoogle) {
                      // Test
                    } else {
                      // Test
                    }
                  },
                ),
              ),
            if (supplier == SignInSupplier.apple && isCupertino())
              ProviderScope(
                overrides: [
                  if (service.hasApple)
                    listViewThemeProvider.overrideWithValue(
                      listViewTheme.copyWith(valueColor: Colors.green),
                    ),
                ],
                child: FormTappableField(
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
                  value: service.hasApple
                      ? l10n.settingsThirdPartyConnected
                      : l10n.settingsThirdPartyNotConnected,
                  onPressed: () {
                    if (service.hasApple) {
                      // Test
                    } else {
                      // Test
                    }
                  },
                ),
              ),
            if (supplier == SignInSupplier.facebook)
              ProviderScope(
                overrides: [
                  if (service.hasFacebook)
                    listViewThemeProvider.overrideWithValue(
                      listViewTheme.copyWith(valueColor: Colors.green),
                    ),
                ],
                child: FormTappableField(
                  leading: Image.asset(
                    "assets/images/facebook-logo.png",
                    width: 16,
                    height: 16,
                    package: "sign_in",
                  ),
                  label: "Facebook",
                  value: service.hasFacebook
                      ? l10n.settingsThirdPartyConnected
                      : l10n.settingsThirdPartyNotConnected,
                  onPressed: () {
                    if (service.hasFacebook) {
                      // Test
                    } else {
                      // Test
                    }
                  },
                ),
              ),
          ],
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
