part of '../../../sign_in.dart';

final userEmailProvider = Provider<User?>((ref) {
  final userChanges = ref.watch(userChangesProvider);

  return userChanges.maybeWhen(
    data: (user) => user,
    orElse: () => null,
  );
});

final userAnonymousProvider = Provider<bool>((ref) {
  final user = ref.watch(userEmailProvider);
  return user?.providerData.isEmpty ?? false;
});

final userSupplierProvider = Provider.family<bool, String>((ref, supplierId) {
  final user = ref.watch(userEmailProvider);
  for (final supplier in user?.providerData ?? []) {
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
    final authSettings = ref.watch(authSettingsProvider);

    ref.listen<AuthState>(authStateProvider(authSettings), (_, state) {
      state.maybeWhen(
        notAuthed: () {
          ref.read(currentTabIndexProvider.notifier).state = 0;
        },
        orElse: () => null,
      );
    });

    return SettingsPageBuilder(
      provider: settingsAccountControllerProvider,
      title: l10n.settingsAccountTitle,
      child: FormPage(
        children: [
          if (isAnonymous) ...[
            const _ButtonsSection(),
          ] else ...[
            const _EmailSection(),
            const _SocialSection(),
            const _DeleteSection(),
          ]
        ],
      ),
    );
  }
}

class _ButtonsSection extends ConsumerWidget {
  const _ButtonsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final backgroundColor = ref.watch(
      appThemeProvider.select((theme) => theme.listTileBackground),
    );
    final l10n = ref.watch(signInLocalizationsProvider);
    final signInTheme = ref.watch(signInThemeProvider);
    final suppliers = ref
        .watch(authSettingsProvider.select(
          (settings) => settings.suppliers,
        ))
        .where((supplier) => supplier != SignInSupplier.anonymous)
        .toList();

    ref.listen<SignInButtonsState>(signInButtonsControllerProvider, (_, state) {
      state.maybeWhen(
        initial: () {
          ref.read(signInSupplierProvider.notifier).state = null;
        },
        error: (errorText) {
          showErrorDialog(
            context,
            ref,
            title: l10n.errorTitle,
            content: errorText,
          );
        },
        orElse: () => null,
      );
    });

    return ProviderScope(
      overrides: [
        signInThemeProvider.overrideWithValue(signInTheme.copyWith(
          buttonBackgroundColor: backgroundColor,
        )),
      ],
      child: Column(
        children: [
          for (final supplier in suppliers) ...[
            FormSection(
              child: ProviderScope(
                overrides: [
                  _currentSupplier.overrideWithValue(supplier),
                ],
                child: const SignInSupplierButton(),
              ),
            ),
            const SizedBox(height: 10),
          ],
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
    final hasPassword = ref.watch(userSupplierProvider("password"));
    final isAnonymous = ref.watch(userAnonymousProvider);
    final user = ref.watch(userEmailProvider);

    return FormSection(
      title: l10n.settingsEmailSectionTitle,
      caption: isAnonymous || hasPassword
          ? null
          : l10n.settingsPasswordUndefinedCaption,
      children: [
        FormTappableField(
          label: l10n.settingsEmailLabel,
          value: user?.email ?? l10n.settingsUndefined,
          onPressed: () {
            Navigator.of(context).pushNamed(SettingsRoutes.settingsEmailPage);
          },
        ),
        if (!isAnonymous)
          FormTappableField(
            label: l10n.settingsPasswordLabel,
            value: hasPassword
                ? l10n.settingsPasswordEdit
                : l10n.settingsUndefined,
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(SettingsRoutes.settingsPasswordPage);
            },
          ),
      ],
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
        caption: l10n.settingsThirdPartyCaption,
        children: [
          for (final supplier in suppliers) ...[
            _SocialRow(supplier: supplier),
          ],
        ],
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
          title: l10n.unlinkProvider(supplier.name(l10n)),
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
        (ref.watch(userEmailProvider)?.providerData ?? []).length > 1;
    final isConnected = ref.watch(userSupplierProvider(supplier.id));

    return ProviderScope(
      overrides: [
        listViewThemeProvider.overrideWithValue(
          listViewTheme.copyWith(
            valueColor: isConnected ? Colors.green : listViewTheme.valueColor,
            valueColorEnforced: true,
          ),
        ),
      ],
      child: FormTappableField(
        leading: supplier.icon(size: 16, color: listViewTheme.labelColor),
        label: supplier.name(l10n),
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

class _DeleteSection extends ConsumerWidget {
  const _DeleteSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(signInLocalizationsProvider);

    return FormSection(
      children: [
        FormCenteredButton(
          value: l10n.settingsDeleteButton,
          isDestructive: true,
          onPressed: () {
            Navigator.of(context).pushNamed(SettingsRoutes.settingsDeletePage);
          },
        ),
      ],
    );
  }
}
