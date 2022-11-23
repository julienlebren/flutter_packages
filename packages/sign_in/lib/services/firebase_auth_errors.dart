part of '../sign_in.dart';

extension Description on FirebaseAuthException {
  String description(
    SignInLocalizations l10n, [
    String? param,
  ]) {
    switch (code) {
      case "expired-action-code":
        return l10n.errorExpiredActionCode;
      case "invalid-email":
        return l10n.errorInvalidEmail;
      case "invalid-verification-code":
        return l10n.errorInvalidVerificationCode;
      case "user-disabled":
        return l10n.errorUserDisabled;
      case "user-not-found":
        return l10n.errorUserNotFound;
      case "wrong-password":
        return l10n.errorWrongPassword;
      case "email-already-in-use":
        return l10n.errorEmailAlreadyInUse;
      case "credential-already-in-use":
        return l10n.errorCredentialAlreadyInUse(param!);
      case "weak-password":
        return l10n.errorWeakPassword;
      case "operation-not-allowed":
        return l10n.errorOperationNotAllowed;
      case "phone-not-mobile":
        return l10n.errorPhoneNotMobile;
      default:
        return code; //l10n.errorUnknown;
    }
  }
}
