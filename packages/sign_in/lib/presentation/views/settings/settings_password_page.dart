// ignore_for_file: library_private_types_in_public_api

part of '../../../sign_in.dart';

class SettingsPasswordPage extends ConsumerStatefulWidget {
  const SettingsPasswordPage({super.key});

  @override
  _SettingsPasswordPageState createState() => _SettingsPasswordPageState();
}

class _SettingsPasswordPageState extends ConsumerState<SettingsPasswordPage> {
  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(signInLocalizationsProvider);
    final isSaving = ref.watch(
      settingsPasswordControllerProvider.select((state) => state.isLoading),
    );
    final canSubmit = ref.watch(
      settingsPasswordControllerProvider.select((state) => state.canSubmit),
    );

    ref.listen<SettingsPasswordState>(settingsPasswordControllerProvider,
        (_, state) {
      if (state.errorText != null) {
        showErrorDialog(
          context,
          ref,
          title: l10n.errorTitle,
          content: state.errorText,
        );
      } else if (state.isSuccess) {
        Navigator.pop(context);
      }
    });

    return SettingsPageBuilder(
      title: l10n.settingsPasswordTitle,
      isSaving: isSaving,
      canSubmit: canSubmit,
      onPressed: () {
        final controller =
            ref.read(settingsPasswordControllerProvider.notifier);
        controller.handleEvent(const SettingsPasswordEvent.submit());
      },
      child: const _SettingsPasswordContents(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    ref.invalidate(settingsPasswordControllerProvider);
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

    return FormPage(
      children: [
        FormSection(
          children: [
            FormRow(
              child: PlatformTextField(
                controller: TextEditingController(),
                placeholder: l10n.settingsPasswordPlaceholder,
                autocorrect: false,
                obscureText: true,
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
                placeholder: l10n.settingsPasswordConfirmationPlaceholder,
                autocorrect: false,
                obscureText: true,
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
            if (isMaterial()) const SettingsPasswordRequirements(),
          ],
        ),
        if (isCupertino()) const SettingsPasswordRequirements(),
      ],
    );
  }
}

class SettingsPasswordRequirements extends ConsumerWidget {
  const SettingsPasswordRequirements({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(settingsPasswordControllerProvider);

    return PasswordRequirements(
      passwordConfirmation: true,
      passwordHasDigits: state.passwordHasDigits,
      passwordHasUppercase: state.passwordHasUppercase,
      passwordHasLowercase: state.passwordHasLowercase,
      passwordHasMinLength: state.passwordHasMinLength,
      passwordHasSpecialChars: state.passwordHasSpecialChars,
      passwordsMatch: state.passwordsMatch,
    );
  }
}
