part of 'settings.dart';

class SettingsPageBuilder extends ConsumerWidget {
  const SettingsPageBuilder({
    Key? key,
    required this.title,
    this.provider,
    required this.child,
  }) : super(key: key);

  final String title;
  final ProviderBase<SettingsState>? provider;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (provider != null) {
      final l10n = ref.watch(layoutLocalizationsProvider);
      ref.listen<SettingsState>(provider!, (_, state) {
        state.maybeWhen(
          error: (errorText) =>
              showErrorDialog(context, ref, title: l10n.errorTitle),
          orElse: () => null,
        );
      });

      bool isSaving = ref.watch(provider!).maybeWhen(
            saving: () => true,
            orElse: () => false,
          );

      return SettingsPageContents(
        title: title,
        child: child,
        isSaving: isSaving,
      );
    } else {
      return SettingsPageContents(
        title: title,
        child: child,
      );
    }
  }
}

class SettingsPageContents extends StatelessWidget {
  const SettingsPageContents({
    Key? key,
    required this.title,
    required this.child,
    this.isSaving = false,
  }) : super(key: key);

  final String title;
  final Widget child;
  final bool isSaving;

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformNavigationBar(
        title: title,
        trailing: isSaving ? const FormLoader() : null,
      ),
      body: FormWithOverlay(
        child: child,
        isSaving: isSaving,
      ),
    );
  }
}
