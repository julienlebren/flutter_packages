part of '../../../sign_in.dart';

class SettingsPasswordPage extends ConsumerWidget {
  const SettingsPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(signInLocalizationsProvider);
    final isSaving = ref.watch(
      settingsPasswordControllerProvider.select((state) => state.isLoading),
    );
    final canSubmit = ref.watch(
      settingsPasswordControllerProvider.select((state) => state.canSubmit),
    );

    ref.listen<SettingsPasswordState>(settingsPasswordControllerProvider,
        (_, state) {
      if (state.isSuccess) {
        Navigator.pop(context);
      }
    });

    return SettingsPageBuilder(
      title: l10n.settingsPasswordTitle,
      child: const _SettingsPasswordContents(),
      isSaving: isSaving,
      canSubmit: canSubmit,
      onPressed: () {
        final controller =
            ref.read(settingsPasswordControllerProvider.notifier);
        controller.handleEvent(const SettingsPasswordEvent.submit());
      },
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
  final confirmationFocusNode = FocusNode();

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
    final controller = ref.read(settingsPasswordControllerProvider.notifier);
    final state = ref.watch(settingsPasswordControllerProvider);

    return FormPage(
      children: [
        FormSection(
          children: [
            FormRow(
              child: PlatformTextField(
                controller: TextEditingController(),
                obscureText: true,
                placeholder: l10n.settingsPasswordLabel,
                autocorrect: false,
                focusNode: focusNode,
                textInputAction: TextInputAction.next,
                onChanged: (String value) {
                  controller.handleEvent(
                      SettingsPasswordEvent.passwordChanged(value));
                },
                onSubmitted: (_) {
                  confirmationFocusNode.requestFocus();
                },
              ),
            ),
            FormRow(
              child: PlatformTextField(
                controller: TextEditingController(),
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                placeholder: l10n.settingsPasswordConfirmationLabel,
                autocorrect: false,
                focusNode: confirmationFocusNode,
                onChanged: (String value) {
                  controller.handleEvent(
                      SettingsPasswordEvent.passwordConfirmationChanged(value));
                },
                onSubmitted: (_) {
                  controller.handleEvent(const SettingsPasswordEvent.submit());
                },
              ),
            ),
            PasswordRequirements(
              passwordConfirmation: true,
              passwordHasDigits: state.passwordHasDigits,
              passwordHasUppercase: state.passwordHasUppercase,
              passwordHasLowercase: state.passwordHasLowercase,
              passwordHasMinLength: state.passwordHasMinLength,
              passwordHasSpecialChars: state.passwordHasSpecialChars,
              passwordsMatch: state.passwordsMatch,
            ),
          ],
        ),
      ],
    );
  }
}
