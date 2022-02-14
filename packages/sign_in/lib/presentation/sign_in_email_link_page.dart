part of '../sign_in.dart';

class SignInEmailLinkPage extends StatelessWidget {
  const SignInEmailLinkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SignInEmailPageBuilder();
  }
}

class SignInEmailLinkPageBuilder extends ConsumerWidget {
  const SignInEmailLinkPageBuilder({Key? key}) : super(key: key);

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
                keyboardType: TextInputType.emailAddress,
                placeholder: l10n.signInWithEmailPasswordPlaceholder,
                autocorrect: false,
                focusNode: focusNode,
                onChanged: (String value) {},
              ),
            ),
          ],
        ),
        PlatformTextButton(
          title: l10n.signInWithEmailForgotPassword,
          fontSize: 14,
          textAlign: TextAlign.left,
          onPressed: () {},
        ),
        const SignInEmailPageSubmitButton(canSubmit: true, isSaving: false),
        PlatformTextButton(
          title: l10n.signInWithEmailCreateAccount,
          onPressed: () {
            print("lol");
          },
        ),
      ],
    );
  }
}
