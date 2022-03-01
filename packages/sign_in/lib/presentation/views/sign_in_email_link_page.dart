part of '../../sign_in.dart';

void _handleEmailLinkEvent(WidgetRef ref, SignInEmailLinkEvent event) {
  final controller = ref.read(signInEmailLinkControllerProvider.notifier);
  controller.handleEvent(event);
}

class SignInEmailLinkPage extends ConsumerWidget {
  const SignInEmailLinkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<SignInEmailLinkState>(signInEmailLinkControllerProvider,
        (_, state) {
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

    return const SignInEmailLinkPageBuilder();
  }
}

class SignInEmailLinkPageBuilder extends ConsumerWidget {
  const SignInEmailLinkPageBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.read(signInLocalizationsProvider);
    final state = ref.watch(signInEmailLinkControllerProvider);

    return SignInPageBuilder(
      title: l10n.signInWithEmailLinkTitle,
      subtitle: l10n.signInWithEmailLinkSubtitle,
      leadingButton: const SignInCloseButton(),
      child: const SignInEmailLinkPageForm(),
      errorText: state.errorText,
      isLoading: state.isLoading,
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
  final textController = TextEditingController();
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
          controller: textController,
          keyboardType: TextInputType.emailAddress,
          placeholder: l10n.signInWithEmailPlaceholder,
          autocorrect: false,
          focusNode: focusNode,
          onChanged: (String value) {
            _handleEmailLinkEvent(
                ref, SignInEmailLinkEvent.emailChanged(value));
          },
        ),
        if (isCupertino()) const SignInDivider(),
        SignInSubmitButton(
          title: l10n.continueButton,
          onPressed: canSubmit
              ? () => _handleEmailLinkEvent(
                  ref, const SignInEmailLinkEvent.sendLink())
              : null,
        ),
      ],
    );
  }
}
