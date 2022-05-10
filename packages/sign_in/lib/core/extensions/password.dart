part of '../../sign_in.dart';

extension Password on String {
  bool get hasUppercase => contains(RegExp(r'[A-Z]'));
  bool get hasDigits => contains(RegExp(r'[0-9]'));
  bool get hasLowercase => contains(RegExp(r'[a-z]'));
  bool get hasSpecialChars => contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  bool get hasMinLength => length > 6;

  bool get isPasswordCompliant =>
      hasDigits & hasUppercase & hasLowercase & hasSpecialChars & hasMinLength;
}
