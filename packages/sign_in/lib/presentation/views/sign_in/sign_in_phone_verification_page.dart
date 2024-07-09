part of '../../../sign_in.dart';

/// Handles a `SignInPhoneVerificationEvent` in the [SignInPhoneVerificationController]
/// This function avoids too much code repetition in this file
void _handlePhoneVerificationEvent(
    WidgetRef ref, SignInPhoneVerificationEvent event) {
  final controller =
      ref.read(signInPhoneVerificationControllerProvider.notifier);
  controller.handleEvent(event);
}

class SignInPhoneVerificationPage extends ConsumerWidget {
  const SignInPhoneVerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(signInLocalizationsProvider);
    final isLoading =
        ref.watch(signInPhoneVerificationControllerProvider.select(
      (state) => state.isLoading,
    ));
    final nationalPhoneNumber =
        ref.watch(signInPhoneVerificationControllerProvider.select(
      (state) => state.nationalPhoneNumber,
    ));

    ref.listen<SignInPhoneVerificationState>(
        signInPhoneVerificationControllerProvider, (_, state) {
      if (state.errorText != null) {
        showErrorDialog(
          context,
          ref,
          title: l10n.errorTitle,
          content: state.errorText,
        );
      }
    });

    return SignInPageBuilder(
      isLoading: isLoading,
      title: l10n.signInVerificationTitle,
      subtitle: l10n.signInVerificationSubtitle(nationalPhoneNumber),
      leadingButton: const SignInCloseButton(),
      child: const SignInVerificationForm(),
    );
  }
}

class SignInVerificationForm extends StatelessWidget {
  const SignInVerificationForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SignInPinCodeField(),
        SizedBox(height: 40),
        SignInVerificationResendButton(),
      ],
    );
  }
}

/// The Textfield for typing the phone number. It uses
/// a [StatefulWidget] because it's required when a manipulating Textfield.
class SignInPinCodeField extends ConsumerStatefulWidget {
  const SignInPinCodeField({Key? key}) : super(key: key);

  @override
  createState() => _SignInPinCodeFieldState();
}

class _SignInPinCodeFieldState extends ConsumerState<SignInPinCodeField> {
  final controller = TextEditingController();
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
    final signInTheme = ref.watch(signInThemeProvider);

    return Center(
      child: SizedBox(
        width: 270,
        child: Material(
          color: signInTheme.scaffoldBackgroundColor,
          child: Pinput(
            length: 6,
            focusNode: focusNode,
            pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
            showCursor: true,
            onTap: () {
              if (controller.text.length == 6) {
                controller.text = '';
              }
            },
          ),
        ),
      ),
    );
  }
}

/// Displays an error when the `SubmitState` says to do so
/// by watching the `signInPhoneModelProvider` provider.
class SignInVerificationResendButton extends ConsumerWidget {
  const SignInVerificationResendButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(signInLocalizationsProvider);
    final countdown = ref.watch(
      signInPhoneVerificationControllerProvider
          .select((state) => state.countdown),
    );

    if (countdown != null) {
      if (countdown > 0) {
        return PlatformTextButton(
          title: l10n.signInVerificationNotReceived(countdown.toString()),
          onPressed: null,
        );
      } else {
        return PlatformTextButton(
          title: l10n.signInVerificationResend,
          onPressed: () {
            _handlePhoneVerificationEvent(
                ref, const SignInPhoneVerificationEvent.resendCode());
          },
        );
      }
    } else {
      return const SizedBox.shrink();
    }
  }
}
