part of '../../sign_in.dart';

enum SignInSupplier {
  anonymous,
  emailLink,
  email,
  google,
  apple,
  facebook,
  phone,
}

extension SignInSupplierX on SignInSupplier {
  bool get isThirdParty {
    switch (this) {
      case SignInSupplier.google:
      case SignInSupplier.apple:
      case SignInSupplier.facebook:
        return true;
      default:
        return false;
    }
  }

  String name(SignInLocalizations l10n) {
    switch (this) {
      case SignInSupplier.google:
        return "Google";
      case SignInSupplier.apple:
        return "Apple";
      case SignInSupplier.facebook:
        return "Facebook";
      case SignInSupplier.email:
        return l10n.signInWithEmail;
      case SignInSupplier.emailLink:
        return l10n.signInWithEmailLink;
      default:
        return "";
    }
  }

  String get id {
    switch (this) {
      case SignInSupplier.google:
        return "google.com";
      case SignInSupplier.apple:
        return "apple.com";
      case SignInSupplier.facebook:
        return "facebook.com";
      default:
        return "";
    }
  }

  Widget icon({double size = 16, Color? color}) {
    switch (this) {
      case SignInSupplier.google:
        return SizedBox(
          width: size,
          height: size,
          child: CustomPaint(
            painter: GoogleLogoPainter(),
          ),
        );
      case SignInSupplier.apple:
        return SizedBox(
          width: size,
          height: size, // / (25 / 31),
          child: CustomPaint(
            painter: AppleLogoPainter(
              color: color!,
            ),
          ),
        );
      case SignInSupplier.facebook:
        return Image.asset(
          "assets/images/facebook-logo.png",
          width: size,
          height: size,
          package: "sign_in",
        );
      case SignInSupplier.email:
      case SignInSupplier.emailLink:
        return Icon(
          Icons.email_outlined,
          color: color,
          size: size * 1.2,
        );
      case SignInSupplier.phone:
        return Icon(
          Icons.phone_android,
          color: color,
          size: size * 1.2,
        );
      default:
        return const SizedBox.shrink();
    }
  }

  SettingsAccountEvent? get settingsAccountEvent {
    switch (this) {
      case SignInSupplier.google:
        return const SettingsAccountEvent.signInWithGoogle();
      case SignInSupplier.apple:
        return const SettingsAccountEvent.signInWithApple();
      case SignInSupplier.facebook:
        return const SettingsAccountEvent.signInWithFacebook();
      default:
        return null;
    }
  }

  SignInButtonsEvent get signInButtonsEvent {
    switch (this) {
      case SignInSupplier.google:
        return const SignInButtonsEvent.signInWithGoogle();
      case SignInSupplier.apple:
        return const SignInButtonsEvent.signInWithApple();
      case SignInSupplier.facebook:
        return const SignInButtonsEvent.signInWithFacebook();
      case SignInSupplier.anonymous:
        return const SignInButtonsEvent.signInAnonymously();
      case SignInSupplier.emailLink:
        return const SignInButtonsEvent.signInWithEmailLink("");
      case SignInSupplier.email:
        return const SignInButtonsEvent.signInWithEmail();
      case SignInSupplier.phone:
        return const SignInButtonsEvent.signInWithPhone();
    }
  }
}
