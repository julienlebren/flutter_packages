part of '../../sign_in.dart';

@freezed
class SignInTheme with _$SignInTheme {
  const factory SignInTheme({
    @Default(400) double maxWidth,
    @Default(8.0) double buttonRadius,
    @Default(16.0) double buttonPadding,
    String? backgroundImage,
    required Color primaryColor,
    required Color scaffoldBackgroundColor,
    required Color textColor,
    required Color buttonBackgroundColor,
    required Color buttonTextColor,
    required Color borderColor,
    required Color dividerColor,
    @Default(18.0) double buttonFontSize,
    @Default(15.0) double spaceBetweenButtons,
  }) = _SignInTheme;
}
