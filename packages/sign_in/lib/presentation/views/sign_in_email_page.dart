part of '../../sign_in.dart';

class SignInEmailPage extends ConsumerWidget {
  const SignInEmailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<SignInEmailState>(signInEmailControllerProvider, (_, state) {
      if (state.isSuccess) {
        //final navigator = SignInRouter.main.currentState!;
        //navigator.pop();
      } else if (state.errorText != null) {
        final l10n = ref.watch(signInLocalizationsProvider);
        showErrorDialog(
          context,
          ref,
          title: l10n.errorTitle,
          content: state.errorText,
        );
      }
    });

    return const SignInEmailPageBuilder();
  }
}

class SignInEmailPageBuilder extends ConsumerWidget {
  const SignInEmailPageBuilder({Key? key}) : super(key: key);

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
            final controller = ref.read(signInEmailControllerProvider.notifier);
            controller.handleEvent(SignInEmailEvent.emailChanged(value));
          },
        ),
        if (isCupertino()) const SignInDivider(),
        const SizedBox(height: 10),
        PlatformTextField(
          controller: TextEditingController(),
          keyboardType: TextInputType.visiblePassword,
          placeholder: "Password",
          autocorrect: false,
          onChanged: (String value) {
            final controller = ref.read(signInEmailControllerProvider.notifier);
            controller.handleEvent(SignInEmailEvent.emailChanged(value));
          },
        ),
        if (isCupertino()) const SignInDivider(),
        PlatformTextButton(
          title: l10n.signInWithEmailForgotPassword,
          onPressed: null,
        ),
        SignInSubmitButton(
          title: l10n.continueButton,
          onPressed: () => canSubmit
              ? _handleEmailLinkEvent(
                  ref, const SignInEmailLinkEvent.sendLink())
              : null,
        ),
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
