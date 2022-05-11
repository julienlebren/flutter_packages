part of '../../../sign_in.dart';

class SettingsPasswordPage extends ConsumerWidget {
  const SettingsPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(signInLocalizationsProvider);
    final isSaving = ref.watch(
      settingsPasswordControllerProvider.select((state) => state.isLoading),
    );

    ref.listen<SettingsPasswordState>(settingsPasswordControllerProvider,
        (_, state) {
      if (state.isSuccess) {
        Navigator.pop(context);
      }
    });

    return SettingsPageBuilder(
      title: l10n.settingsEmailTitle,
      child: const _SettingsPasswordContents(),
    );
  }
}

class _SettingsPasswordContents extends ConsumerStatefulWidget {
  const _SettingsPasswordContents({Key? key}) : super(key: key);

  @override
  createState() => _SettingsPasswordContentsState();
}

class _SettingsPasswordContentsState
    extends ConsumerState<_SettingsPasswordContents> {
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
