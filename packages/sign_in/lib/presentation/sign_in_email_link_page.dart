part of '../sign_in.dart';

void _handleEvent(WidgetRef ref, SignInEmailLinkEvent event) {
  final controller = ref.read(signInEmailLinkControllerProvider.notifier);
  controller.handleEvent(event);
}

class SignInEmailLinkPage extends ConsumerWidget {
  const SignInEmailLinkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(signInLocalizationsProvider);
    final isLoading = ref.watch(
      signInEmailLinkControllerProvider.select((state) => state.isLoading),
    );

    ref.listen<SignInEmailLinkState>(signInEmailLinkControllerProvider,
        (_, state) {
      if (state.isSuccess) {
        print("success!");
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
        child: const _SignInEmailLinkPageForm(),
      ),
    );
  }
}

class _SignInEmailLinkPageForm extends ConsumerStatefulWidget {
  const _SignInEmailLinkPageForm({Key? key}) : super(key: key);

  @override
  createState() => _SignInEmailLinkPageFormState();
}

class _SignInEmailLinkPageFormState
    extends ConsumerState<_SignInEmailLinkPageForm> {
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
                  _handleEvent(ref, SignInEmailLinkEvent.emailChanged(value));
                },
              ),
            ),
          ],
          caption: l10n.signInWithEmailCaption,
        ),
        const _SignInEmailLinkSubmitButton(),
      ],
    );
  }
}

class _SignInEmailLinkSubmitButton extends ConsumerWidget {
  const _SignInEmailLinkSubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(signInLocalizationsProvider);
    final canSubmit = ref.watch(
      signInEmailLinkControllerProvider.select((state) => state.canSubmit),
    );

    return PlatformFullSizedElevatedButton(
      title: l10n.continueButton,
      onPressed: canSubmit
          ? () => _handleEvent(ref, const SignInEmailLinkEvent.sendLink())
          : null,
    );
  }
}
