part of '../../sign_in.dart';

void _handleEmailRegisterEvent(WidgetRef ref, SignInEmailRegisterEvent event) {
  final controller = ref.read(signInEmailRegisterControllerProvider.notifier);
  controller.handleEvent(event);
}

class SignInEmailRegisterPage extends ConsumerWidget {
  const SignInEmailRegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<SignInEmailState>(signInEmailControllerProvider, (_, state) {
      if (state.errorText != null) {
        final l10n = ref.watch(signInLocalizationsProvider);
        showErrorDialog(
          context,
          ref,
          title: l10n.errorTitle,
          content: state.errorText,
        );
      }
    });

    return const SignInEmailRegisterPageBuilder();
  }
}

class SignInEmailRegisterPageBuilder extends ConsumerWidget {
  const SignInEmailRegisterPageBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.read(signInLocalizationsProvider);
    final state = ref.watch(signInEmailControllerProvider);

    return SignInPageBuilder(
      title: l10n.signInWithEmailTitle,
      leadingButton: const SignInCloseButton(),
      child: const SignInEmailPageForm(),
      errorText: state.errorText,
      isLoading: state.isLoading,
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
    final canSubmit = ref.watch(
      signInEmailLinkControllerProvider.select((state) => state.canSubmit),
    );

    return Column(
      children: [
        PlatformTextField(
          controller: TextEditingController(),
          keyboardType: TextInputType.emailAddress,
          placeholder: l10n.signInWithEmailPlaceholder,
          autocorrect: false,
          focusNode: focusNode,
          onChanged: (String value) {
            _handleEmailRegisterEvent(
                ref, SignInEmailRegisterEvent.emailChanged(value));
          },
        ),
        if (isCupertino()) const SignInDivider(),
        const SizedBox(height: 10),
        PlatformTextField(
          controller: TextEditingController(),
          placeholder: l10n.signInWithEmailPasswordPlaceholder,
          autocorrect: false,
          obscureText: true,
          onChanged: (String value) {
            _handleEmailRegisterEvent(
                ref, SignInEmailRegisterEvent.passwordChanged(value));
          },
        ),
        if (isCupertino()) const SignInDivider(),
        SignInSubmitButton(
          title: l10n.continueButton,
          onPressed: () => canSubmit
              ? _handleEmailRegisterEvent(
                  ref, const SignInEmailRegisterEvent.submit())
              : null,
        ),
        PlatformTextButton(
          title: l10n.signInWithEmailAlreadyAccount,
          onPressed: () {
            final navigator = signInNavigatorKey.currentState!;
            navigator.pushReplacementNamed(SignInRoutes.signInEmailPage);
          },
        ),
      ],
    );
  }
}
