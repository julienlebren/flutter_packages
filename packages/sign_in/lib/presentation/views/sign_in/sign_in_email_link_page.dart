part of '../../../sign_in.dart';

void _handleEmailLinkEvent(WidgetRef ref, SignInEmailLinkEvent event) {
  final controller = ref.read(signInEmailLinkControllerProvider.notifier);
  controller.handleEvent(event);
}

class SignInEmailLinkPage extends ConsumerWidget {
  const SignInEmailLinkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(signInLocalizationsProvider);
    final errorText = ref.watch(signInEmailLinkControllerProvider.select(
      (state) => state.errorText,
    ));
    final isLoading = ref.watch(signInEmailLinkControllerProvider.select(
      (state) => state.isLoading,
    ));

    return SignInPageBuilder(
      title: l10n.signInWithEmailLinkTitle,
      subtitle: l10n.signInWithEmailLinkSubtitle,
      leadingButton: const SignInCloseButton(),
      errorText: errorText,
      isLoading: isLoading,
      child: const SignInEmailLinkPageForm(),
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
          textCapitalization: TextCapitalization.none,
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
