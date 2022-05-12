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
  String get name {
    switch (this) {
      case SignInSupplier.google:
        return "Google";
      case SignInSupplier.apple:
        return "Apple";
      case SignInSupplier.facebook:
        return "Facebook";
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
          height: size / (25 / 31),
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
}
