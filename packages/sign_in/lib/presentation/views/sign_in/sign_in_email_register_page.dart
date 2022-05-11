part of '../../../sign_in.dart';

void _handleEmailRegisterEvent(WidgetRef ref, SignInEmailRegisterEvent event) {
  final controller = ref.read(signInEmailRegisterControllerProvider.notifier);
  controller.handleEvent(event);
}

class SignInEmailRegisterPage extends ConsumerWidget {
  const SignInEmailRegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(signInLocalizationsProvider);
    final errorText = ref.watch(signInEmailRegisterControllerProvider.select(
      (state) => state.errorText,
    ));
    final isLoading = ref.watch(signInEmailRegisterControllerProvider.select(
      (state) => state.isLoading,
    ));

    return SignInPageBuilder(
      title: l10n.signInWithEmailRegisterTitle,
      leadingButton: const SignInCloseButton(),
      child: const SignInEmailRegisterPageForm(),
      errorText: errorText,
      isLoading: isLoading,
    );
  }
}

class SignInEmailRegisterPageForm extends ConsumerStatefulWidget {
  const SignInEmailRegisterPageForm({Key? key}) : super(key: key);

  @override
  createState() => _SignInEmailRegisterPageFormState();
}

class _SignInEmailRegisterPageFormState
    extends ConsumerState<SignInEmailRegisterPageForm> {
  final emailTextController = TextEditingController();
  final emailFocusNode = FocusNode();
  final passwordTextController = TextEditingController();
  final passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      emailFocusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(signInLocalizationsProvider);
    final state = ref.watch(signInEmailRegisterControllerProvider);

    return Column(
      children: [
        PlatformTextField(
          controller: emailTextController,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          placeholder: l10n.signInWithEmailPlaceholder,
          autocorrect: false,
          focusNode: emailFocusNode,
          onChanged: (String value) {
            _handleEmailRegisterEvent(
                ref, SignInEmailRegisterEvent.emailChanged(value));
          },
          onSubmitted: (_) {
            passwordFocusNode.requestFocus();
          },
        ),
        if (isCupertino()) const SignInDivider(),
        const SizedBox(height: 10),
        PlatformTextField(
          controller: passwordTextController,
          placeholder: l10n.signInWithEmailPasswordPlaceholder,
          autocorrect: false,
          obscureText: true,
          focusNode: passwordFocusNode,
          onChanged: (String value) {
            _handleEmailRegisterEvent(
                ref, SignInEmailRegisterEvent.passwordChanged(value));
          },
        ),
        if (isCupertino()) const SignInDivider(),
        PasswordRequirements(
          passwordHasDigits: state.passwordHasDigits,
          passwordHasUppercase: state.passwordHasUppercase,
          passwordHasLowercase: state.passwordHasLowercase,
          passwordHasMinLength: state.passwordHasMinLength,
          passwordHasSpecialChars: state.passwordHasSpecialChars,
        ),
        SignInSubmitButton(
          title: l10n.continueButton,
          onPressed: state.canSubmit
              ? () {
                  _handleEmailRegisterEvent(
                      ref, const SignInEmailRegisterEvent.submit());
                }
              : null,
        ),
        PlatformTextButton(
          title: l10n.signInWithEmailAlreadyAccount,
          onPressed: () {
            final navigator = SignInNavigatorKeys.modal.currentState!;
            navigator.pushReplacementNamed(SignInRoutes.signInEmailPage);
          },
        ),
      ],
    );
  }
}
