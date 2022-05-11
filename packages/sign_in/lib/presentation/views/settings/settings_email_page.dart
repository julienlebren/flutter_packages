part of '../../../sign_in.dart';

class SettingsEmailPage extends ConsumerWidget {
  const SettingsEmailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(signInLocalizationsProvider);
    final isSaving = ref.watch(
      settingsEmailControllerProvider.select((state) => state.isLoading),
    );

    ref.listen<SettingsEmailState>(settingsEmailControllerProvider, (_, state) {
      if (state.isSuccess) {
        Navigator.pop(context);
      }
    });

    return PlatformScaffold(
      appBar: PlatformNavigationBar(
        title: l10n.settingsEmailTitle,
        trailing: isSaving
            ? const FormLoader()
            : PlatformNavigationBarSaveButton(
                onPressed: () {
                  final controller =
                      ref.read(settingsEmailControllerProvider.notifier);
                  controller.handleEvent(const SettingsEmailEvent.submit());
                },
              ),
      ),
      body: FormWithOverlay(
        isSaving: isSaving,
        child: const _SettingsEmailContents(),
      ),
    );
  }
}

class _SettingsEmailContents extends ConsumerStatefulWidget {
  const _SettingsEmailContents({Key? key}) : super(key: key);

  @override
  createState() => _SettingsEmailContentsState();
}

class _SettingsEmailContentsState
    extends ConsumerState<_SettingsEmailContents> {
  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      focusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(signInLocalizationsProvider);
    final controller = ref.read(settingsEmailControllerProvider.notifier);
    final email = ref.watch(
      settingsEmailControllerProvider.select((state) => state.email),
    );

    return FormPage(
      children: [
        FormSection(
          child: FormRow(
            child: PlatformTextField(
              controller: TextEditingController(text: email),
              keyboardType: TextInputType.emailAddress,
              placeholder: l10n.settingsEmailLabel,
              autocorrect: false,
              focusNode: focusNode,
              onChanged: (String value) {
                controller.handleEvent(SettingsEmailEvent.emailChanged(value));
              },
              onSubmitted: (_) {
                controller.handleEvent(const SettingsEmailEvent.submit());
              },
            ),
          ),
        ),
      ],
    );
  }
}
