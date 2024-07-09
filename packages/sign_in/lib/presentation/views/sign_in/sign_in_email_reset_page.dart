part of '../../../sign_in.dart';

void _handleEmailResetEvent(WidgetRef ref, SignInEmailResetEvent event) {
  final controller = ref.read(signInEmailResetControllerProvider.notifier);
  controller.handleEvent(event);
}

class SignInEmailResetPage extends ConsumerWidget {
  const SignInEmailResetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(signInLocalizationsProvider);
    final errorText = ref.watch(signInEmailResetControllerProvider.select(
      (state) => state.errorText,
    ));
    final isLoading = ref.watch(signInEmailResetControllerProvider.select(
      (state) => state.isLoading,
    ));

    ref.listen<SignInEmailResetState>(signInEmailResetControllerProvider,
        (_, state) {
      if (state.isSuccess) {
        final l10n = ref.watch(signInLocalizationsProvider);
        showAlertDialog(
          context,
          ref,
          title: l10n.emailResetSuccessTitle,
          content: l10n.emailResetSuccessDescription(state.email),
          actions: [
            PlatformDialogAction(
              buttonText: MaterialLocalizations.of(context).okButtonLabel,
              onPressed: () {
                final navigator = SignInNavigatorKeys.modal.currentState!;
                navigator.pop();
              },
            ),
          ],
          displayCancelButton: false,
        );
      }
    });

    return SignInPageBuilder(
      title: l10n.emailResetTitle,
      subtitle: l10n.emailResetSubtitle,
      errorText: errorText,
      isLoading: isLoading,
      child: const SignInEmailResetForm(),
    );
  }
}

class SignInEmailResetForm extends ConsumerStatefulWidget {
  const SignInEmailResetForm({Key? key}) : super(key: key);

  @override
  createState() => _SignInEmailResetFormState();
}

class _SignInEmailResetFormState extends ConsumerState<SignInEmailResetForm> {
  final emailTextController = TextEditingController();
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
      signInEmailResetControllerProvider.select((state) => state.canSubmit),
    );

    return Column(
      children: [
        PlatformTextField(
          controller: emailTextController,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          textCapitalization: TextCapitalization.none,
          placeholder: l10n.signInWithEmailPlaceholder,
          autocorrect: false,
          focusNode: focusNode,
          onChanged: (String value) {
            _handleEmailResetEvent(
                ref, SignInEmailResetEvent.emailChanged(value));
          },
        ),
        if (isCupertino()) const SignInDivider(),
        SignInSubmitButton(
          title: l10n.emailResetSubmitButton,
          onPressed: canSubmit
              ? () {
                  _handleEmailResetEvent(
                      ref, const SignInEmailResetEvent.submit());
                }
              : null,
        ),
      ],
    );
  }
}
