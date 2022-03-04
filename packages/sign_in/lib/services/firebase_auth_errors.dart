part of '../sign_in.dart';

extension Description on FirebaseAuthException {
  String description(SignInLocalizations l10n) {
    switch (code) {
      case "expired-action-code":
        return l10n.errorExpiredActionCode;
      case "invalid-email":
        return l10n.errorInvalidEmail;
      case "invalid-verification-code":

      case "user-disabled":
        return l10n.errorUserDisabled;
      case "user-not-found":
        return l10n.errorUserNotFound;
      case "wrong-password":
        return l10n.errorWrongPassword;
      case "email-already-in-use":
        return l10n.errorEmailAlreadyInUse;
      case "weak-password":
        return l10n.errorWeakPassword;
      case "operation-not-allowed":
        return l10n.errorOperationNotAllowed;
      case "phone-not-mobile":
        return l10n.errorPhoneNotMobile;
      default:
        return l10n.errorUnknown;
    }
  }
}
