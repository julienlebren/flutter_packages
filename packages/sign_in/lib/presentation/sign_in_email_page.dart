part of '../sign_in.dart';

class SignInEmailPage extends StatelessWidget {
  const SignInEmailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SignInEmailPageBuilder();
  }
}

class SignInEmailPageBuilder extends ConsumerWidget {
  const SignInEmailPageBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(signInLocalizationsProvider);

    return PlatformScaffold(
      appBar: PlatformNavigationBar(
        leading: PlatformNavigationBarCloseButton(
          onPressed: () => Navigator.pop(context),
        ),
        title: l10n.signInWithEmailTitle,
      ),
      body: const FormWithOverlay(
        isSaving: false,
        child: SignInEmailPageForm(),
      ),
    );
  }
}

class SignInEmailPageForm extends ConsumerStatefulWidget {
  const SignInEmailPageForm({Key? key}) : super(key: key);

  @override
  createState() => _SignInEmailPageFormState();
}

class _SignInEmailPageFormState extends ConsumerState<SignInEmailPageForm> {
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
                onChanged: (String value) {},
              ),
            ),
            FormRow(
              child: PlatformTextField(
                controller: TextEditingController(),
                keyboardType: TextInputType.visiblePassword,
                placeholder: l10n.signInWithEmailPasswordPlaceholder,
                autocorrect: false,
                focusNode: focusNode,
                onChanged: (String value) {},
              ),
            ),
          ],
          caption: l10n.signInWithEmailCaption,
        ),
        const SignInEmailPageSubmitButton(canSubmit: true, isSaving: false),
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

  _verifyEmail(WidgetRef ref) {}

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
