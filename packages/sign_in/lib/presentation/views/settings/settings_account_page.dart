part of '../../../sign_in.dart';

final userEmailProvider = Provider<User?>((ref) {
  final userChanges = ref.watch(userChangesProvider);

  return userChanges.maybeWhen(
    data: (user) => user,
    orElse: () => null,
  );
});

final userAnonymousProvider = Provider<bool>((ref) {
  final user = ref.watch(userEmailProvider)!;
  return user.providerData.isEmpty;
});

final userSupplierProvider = Provider.family<bool, String>((ref, supplierId) {
  final user = ref.watch(userEmailProvider)!;
  for (final supplier in user.providerData) {
    if (supplier.providerId == supplierId) return true;
  }
  return false;
});

class SettingsAccountPage extends ConsumerWidget {
  const SettingsAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(signInLocalizationsProvider);
    final isAnonymous = ref.watch(userAnonymousProvider);

    return SettingsPageBuilder(
      provider: settingsAccountControllerProvider,
      title: l10n.settingsAccountTitle,
      child: FormPage(
        children: [
          if (isAnonymous) const _AnonymousSection(),
          const _EmailSection(),
          const _SocialSection(),
          if (!isAnonymous) const _LogoutSection(),
        ],
      ),
    );
  }
}

class _AnonymousSection extends ConsumerWidget {
  const _AnonymousSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(signInLocalizationsProvider);

    return FormSection(
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
                    style: const TextStyle(color: Colors.black, fontSize: 17),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _EmailSection extends ConsumerWidget {
  const _EmailSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(signInLocalizationsProvider);
    final hasPassword = ref.watch(userSupplierProvider("password"));
    final user = ref.watch(userEmailProvider);
    print("user is $user");

    return FormSection(
      title: l10n.settingsEmailSectionTitle,
      children: [
        FormTappableField(
          label: l10n.settingsEmailLabel,
          value: user?.email ?? l10n.settingsUndefined,
          onPressed: () {
            Navigator.of(context, rootNavigator: true)
                .pushNamed(SettingsRoutes.settingsEmailPage);
          },
        ),
        FormTappableField(
          label: l10n.settingsPasswordLabel,
          value:
              hasPassword ? l10n.settingsPasswordEdit : l10n.settingsUndefined,
          onPressed: () {
            Navigator.of(context, rootNavigator: true)
                .pushNamed(SettingsRoutes.settingsPasswordPage);
          },
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
    final suppliers = ref
        .watch(authSettingsProvider.select(
          (settings) => settings.suppliers,
        ))
        .where((supplier) => supplier.isThirdParty)
        .toList();

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
            _SocialRow(supplier: supplier),
          ],
        ],
        caption: l10n.settingsThirdPartyCaption,
      ),
    );
  }
}

class _SocialRow extends ConsumerWidget {
  const _SocialRow({
    required this.supplier,
    Key? key,
  }) : super(key: key);

  final SignInSupplier supplier;

  void _showModalSheet(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(signInLocalizationsProvider);

    showPlatformModalSheet(
      context: context,
      ref: ref,
      title: l10n.unlinkTitle,
      actions: [
        PlatformModalSheetAction(
          title: l10n.unlinkProvider(supplier.name),
          icon: Icons.delete,
          onPressed: () {
            final controller =
                ref.read(settingsAccountControllerProvider.notifier);
            controller.handleEvent(SettingsAccountEvent.unlink(supplier.id));
          },
          isDestructiveAction: true,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(signInLocalizationsProvider);
    final listViewTheme = ref.watch(listViewThemeProvider);
    final controller = ref.read(settingsAccountControllerProvider.notifier);
    final hasMultipleConnections =
        ref.watch(userEmailProvider)!.providerData.length > 1;
    final isConnected = ref.watch(userSupplierProvider(supplier.id));

    return ProviderScope(
      overrides: [
        listViewThemeProvider.overrideWithValue(
          listViewTheme.copyWith(
            valueColor: isConnected ? Colors.green : listViewTheme.valueColor,
          ),
        ),
      ],
      child: FormTappableField(
        leading: supplier.icon(size: 16, color: listViewTheme.labelColor),
        label: supplier.name,
        value: isConnected
            ? l10n.settingsThirdPartyConnected
            : l10n.settingsThirdPartyNotConnected,
        onPressed: isConnected && !hasMultipleConnections
            ? null
            : () {
                if (isConnected) {
                  _showModalSheet(context, ref);
                } else {
                  controller.handleEvent(supplier.settingsAccountEvent!);
                }
              },
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
