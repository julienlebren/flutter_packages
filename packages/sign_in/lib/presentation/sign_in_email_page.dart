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
    return PlatformScaffold(
      appBar: PlatformNavigationBar(
        leading: PlatformNavigationBarCloseButton(
          onPressed: () => Navigator.pop(context),
        ),
        title: "Connexion ou inscription",
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
    return FormPage(
      children: [
        FormSection(
          children: [
            FormRow(
              child: PlatformTextField(
                controller: TextEditingController(),
                textInputAction: TextInputAction.next,
                placeholder: "Adresse e-mail",
                autocorrect: false,
                textCapitalization: TextCapitalization.words,
                onChanged: (String value) {},
              ),
            ),
          ],
        ),
        const SignInEmailPageSubmitButton(canSubmit: false, isSaving: false),
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
    return PlatformElevatedButton(
      title: "Continuer",
      onPressed: canSubmit ? () => _verifyEmail(ref) : null,
    );
  }
}
