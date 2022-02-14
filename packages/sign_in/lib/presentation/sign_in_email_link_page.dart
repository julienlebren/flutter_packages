part of '../sign_in.dart';

class SignInEmailLinkPage extends StatelessWidget {
  const SignInEmailLinkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SignInEmailLinkPageBuilder();
  }
}

class SignInEmailLinkPageBuilder extends ConsumerWidget {
  const SignInEmailLinkPageBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(signInLocalizationsProvider);
    final state = ref.watch(signInControllerProvider);
    final isLoading = state.maybeWhen(
      loading: () => true,
      success: () => true,
      orElse: () => false,
    );

    return PlatformScaffold(
      appBar: PlatformNavigationBar(
        leading: PlatformNavigationBarCloseButton(
          onPressed: () => Navigator.pop(context),
        ),
        title: l10n.signInWithEmailTitle,
        trailing: isLoading ? const FormLoader() : null,
      ),
      body: const FormWithOverlay(
        isSaving: false,
        child: SignInEmailLinkPageForm(),
      ),
    );
  }
}

class SignInEmailLinkPageForm extends ConsumerStatefulWidget {
  const SignInEmailLinkPageForm({Key? key}) : super(key: key);

  @override
  createState() => _SignInEmailLinkPageFormState();
}

class _SignInEmailLinkPageFormState
    extends ConsumerState<SignInEmailLinkPageForm> {
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
    final state = ref.watch(signInControllerProvider);
    final isLoading = state.maybeWhen(
      loading: () => true,
      success: () => true,
      orElse: () => false,
    );
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
                onChanged: (String value) {},
              ),
            ),
          ],
          caption: l10n.signInWithEmailCaption,
        ),
        PlatformFullSizedElevatedButton(
          title: l10n.continueButton,
          onPressed: canSubmit ? () {} : null,
        ),
      ],
    );
  }
}

class SignInEmailPageSubmitButton extends ConsumerWidget {
  const SignInEmailPageSubmitButton({
    Key? key,
    required this.canSubmit,
    required this.isSaving,
  }) : super(key: key);

  _sendEmailLink(WidgetRef ref) {
    final controller = ref.read(signInControllerProvider.notifier);
    controller.handleEvent(event);
  }

  final bool isSaving;
  final bool canSubmit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(signInLocalizationsProvider);

    return PlatformFullSizedElevatedButton(
      title: l10n.continueButton,
      onPressed: canSubmit ? () => _verifyEmail(ref) : null,
    );
  }
}
