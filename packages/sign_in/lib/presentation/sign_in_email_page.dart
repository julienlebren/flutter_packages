part of '../sign_in.dart';

class SignInEmailPage extends ConsumerWidget {
  const SignInEmailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(signInLocalizationsProvider);
    final isLoading = ref.watch(
      signInEmailControllerProvider.select((state) => state.isLoading),
    );

    ref.listen<SignInEmailState>(signInEmailControllerProvider, (_, state) {
      if (state.isSuccess) {
        final navigator = SignInRouter.main.currentState!;
        navigator.pop();
      } else if (state.errorText != null) {
        showErrorDialog(
          context,
          ref,
          title: l10n.errorTitle,
          content: state.errorText,
        );
      }
    });

    return PlatformScaffold(
      appBar: PlatformNavigationBar(
        leading: PlatformNavigationBarCloseButton(
          onPressed: () => Navigator.pop(context),
        ),
        title: l10n.signInWithEmailTitle,
        trailing: isLoading ? const FormLoader() : null,
      ),
      body: FormWithOverlay(
        isSaving: isLoading,
        child: const _SignInEmailPageForm(),
      ),
    );
  }
}

class _SignInEmailPageForm extends ConsumerStatefulWidget {
  const _SignInEmailPageForm({Key? key}) : super(key: key);

  @override
  createState() => _SignInEmailPageFormState();
}

class _SignInEmailPageFormState extends ConsumerState<_SignInEmailPageForm> {
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

    return FormPage(
      children: [
        FormSection(
          children: [
            FormRow(
              child: PlatformTextField(
                controller: TextEditingController(),
                keyboardType: TextInputType.emailAddress,
                placeholder: l10n.signInWithEmailPlaceholder,
                autocorrect: false,
                focusNode: focusNode,
                onChanged: (String value) {
                  final controller =
                      ref.read(signInEmailControllerProvider.notifier);
                  controller.handleEvent(SignInEmailEvent.emailChanged(value));
                },
              ),
            ),
          ],
          caption: l10n.signInWithEmailCaption,
        ),
        const _SignInEmailSubmitButton(),
      ],
    );
  }
}

class _SignInEmailSubmitButton extends ConsumerWidget {
  const _SignInEmailSubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(signInLocalizationsProvider);
    final canSubmit = ref.watch(
      signInEmailControllerProvider.select((state) => state.canSubmit),
    );

    return PlatformFullSizedElevatedButton(
      title: l10n.continueButton,
      onPressed: canSubmit
          ? () {
              ref.read(signInEmailControllerProvider.notifier);
            }
          : null,
    );
  }
}
