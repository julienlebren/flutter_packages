part of '../../sign_in.dart';

/// The main Scaffold of a page displayed within the sign)in journey
/// It uses a [PlatformScaffold] which returns the right Scaffold
/// depending on the platform.
class SignInPageBuilder extends StatelessWidget {
  const SignInPageBuilder({
    Key? key,
    required this.title,
    this.subtitle,
    this.leadingButton,
    required this.child,
    this.submitButton,
    this.isLoading = false,
    this.errorText,
  }) : super(key: key);

  final String title;
  final String? subtitle;
  final Widget? leadingButton;
  final Widget child;
  final SignInSubmitButton? submitButton;
  final bool isLoading;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return SignInScaffold(
      appBar: PlatformNavigationBar(
        leading: leadingButton,
        trailing: (isLoading ? const FormLoader() : null),
        hasBorder: false,
      ),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SignInHeader(
                  title: title,
                  subtitle: subtitle,
                ),
                child,
                if (submitButton != null)
                  Opacity(
                    opacity: 0,
                    child: submitButton!,
                  ),
              ],
            ),
          ),
          if (submitButton != null)
            LayoutBuilder(builder: (context, constraints) {
              return Container(
                alignment: Alignment.bottomCenter,
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                child: submitButton!,
              );
            }),
        ],
      ),
    );

    return SignInScaffold(
      appBar: PlatformNavigationBar(
        leading: leadingButton,
        trailing: (isLoading ? const FormLoader() : null),
        hasBorder: false,
      ),
      child: Column(
        children: [
          SignInHeader(
            title: title,
            subtitle: subtitle,
          ),
          AnimatedOpacity(
            opacity: isLoading ? 0.5 : 1,
            duration: const Duration(milliseconds: 200),
            child: AbsorbPointer(
              absorbing: isLoading,
              child: child,
            ),
          ),
          if (errorText != null) SignInError(errorText!),
        ],
      ),
    );
  }
}

class SignInScaffold extends StatelessWidget {
  const SignInScaffold({
    Key? key,
    this.appBar,
    required this.child,
  }) : super(key: key);

  final PlatformNavigationBar? appBar;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => (appBar?.leading == null),
      child: PlatformScaffold(
        appBar: appBar,
        body: Padding(
          padding: const EdgeInsets.only(
            left: 25,
            right: 25,
            bottom: 20,
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SizedBox(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                child: child,
              );
            },
          ),
        ),
      ),
    );
  }
}

class SignInScrollView extends StatelessWidget {
  const SignInScrollView({
    Key? key,
    required this.children,
    this.floatingButton,
  }) : super(key: key);

  final List<Widget> children;
  final Widget? floatingButton;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        SingleChildScrollView(
          child: Column(
            children: children,
          ),
        ),
        if (floatingButton != null) floatingButton!,
      ],
    );
  }
}

/// The button for closing the sign-in journey.
/// Displays a text on iOS and a xmark on Android.
class SignInCloseButton extends ConsumerWidget {
  const SignInCloseButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PlatformNavigationBarCloseButton(
      onPressed: () {
        ref.read(signInSupplierProvider.state).state = null;

        final navigator = SignInNavigatorKeys.main.currentState!;
        navigator.pop();
      },
    );
  }
}

/// The header of a page of the sign-in journey.
/// Only used on iOS, on Android the title is displayed
/// in the [AppBar] and the subtitle in the [SignInFooter].
class SignInHeader extends StatelessWidget {
  const SignInHeader({
    Key? key,
    required this.title,
    this.subtitle,
  }) : super(key: key);

  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              letterSpacing: -1,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        if (subtitle != null)
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: SizedBox(
              width: double.infinity,
              child: Text(
                subtitle!,
                style: const TextStyle(
                  fontSize: 18,
                  letterSpacing: -0.5,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        const SizedBox(height: 40),
      ],
    );
  }
}

/// An error in the sign-in journey,
/// displayed at the bottom of the content.
/// The error is passed as a [String] argument.
class SignInError extends ConsumerWidget {
  const SignInError(this.errorText, {Key? key}) : super(key: key);

  final String errorText;

  /*String _errorHandler(WidgetRef ref, String errorText) {
    final l10n = ref.read(signInLocalizationsProvider);
    if (errorText == 'NOT_MOBILE') {
      return l10n.signInPhoneErrorMobile;
    } else if (errorText == 'INVALID_CODE') {
      return l10n.signInPhoneErrorMobile;
    }
    return errorText;
  }*/

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Text(
        errorText,
        style: const TextStyle(color: Colors.red, fontSize: 16),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class SignInSubmitButton extends ConsumerWidget {
  const SignInSubmitButton({
    Key? key,
    required this.title,
    this.onPressed,
  }) : super(key: key);

  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final backgroundColor = ref.watch(
      signInThemeProvider.select((theme) => theme.scaffoldBackgroundColor),
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 24,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                backgroundColor.withOpacity(0),
                backgroundColor,
              ],
            ),
          ),
        ),
        PlatformFullSizedElevatedButton(
          title: title,
          onPressed: onPressed,
        ),
      ],
    );

    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: PlatformFullSizedElevatedButton(
        title: title,
        onPressed: onPressed,
      ),
    );
  }
}
