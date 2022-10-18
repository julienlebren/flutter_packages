part of '../../../sign_in.dart';

void _handleEmailLoginEvent(WidgetRef ref, SignInEmailLoginEvent event) {
  final controller = ref.read(signInEmailLoginControllerProvider.notifier);
  controller.handleEvent(event);
}

class SignInEmailLoginPage extends ConsumerWidget {
  const SignInEmailLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(signInLocalizationsProvider);
    final errorText = ref.watch(signInEmailLoginControllerProvider.select(
      (state) => state.errorText,
    ));
    final isLoading = ref.watch(signInEmailLoginControllerProvider.select(
      (state) => state.isLoading,
    ));

    return SignInPageBuilder(
      title: l10n.signInWithEmailTitle,
      leadingButton: const SignInCloseButton(),
      child: const SignInEmailLoginForm(),
      errorText: errorText,
      isLoading: isLoading,
    );
  }
}

class SignInEmailLoginForm extends ConsumerStatefulWidget {
  const SignInEmailLoginForm({Key? key}) : super(key: key);

  @override
  createState() => _SignInEmailLoginFormState();
}

class _SignInEmailLoginFormState extends ConsumerState<SignInEmailLoginForm> {
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
  void dispose() {
    ref.invalidate(signInEmailLoginControllerProvider);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(signInLocalizationsProvider);
    final canSubmit = ref.watch(
      signInEmailLoginControllerProvider.select((state) => state.canSubmit),
    );

    return Column(
      children: [
        PlatformTextField(
          controller: emailTextController,
          keyboardType: TextInputType.emailAddress,
          placeholder: l10n.signInWithEmailPlaceholder,
          textInputAction: TextInputAction.next,
          autocorrect: false,
          focusNode: emailFocusNode,
          onChanged: (String value) {
            _handleEmailLoginEvent(
                ref, SignInEmailLoginEvent.emailChanged(value));
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
          focusNode: passwordFocusNode,
          autocorrect: false,
          obscureText: true,
          onChanged: (String value) {
            _handleEmailLoginEvent(
                ref, SignInEmailLoginEvent.passwordChanged(value));
          },
        ),
        if (isCupertino()) const SignInDivider(),
        PlatformTextButton(
          title: l10n.signInWithEmailForgotPassword,
          fontSize: 14,
          onPressed: () {
            final navigator = SignInNavigatorKeys.modal.currentState!;
            navigator.pushNamed(SignInRoutes.signInEmailResetPage);
          },
        ),
        SignInSubmitButton(
          title: l10n.continueButton,
          onPressed: canSubmit
              ? () {
                  _handleEmailLoginEvent(
                      ref, const SignInEmailLoginEvent.submit());
                }
              : null,
        ),
        PlatformTextButton(
          title: l10n.signInWithEmailCreateAccount,
          onPressed: () {
            final navigator = SignInNavigatorKeys.modal.currentState!;
            navigator
                .pushReplacementNamed(SignInRoutes.signInEmailRegisterPage);
          },
        ),
      ],
    );
  }
}
