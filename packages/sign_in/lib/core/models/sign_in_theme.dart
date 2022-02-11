part of '../../sign_in.dart';

@freezed
class SignInTheme with _$SignInTheme {
  const factory SignInTheme({
    String? landingBackgroundImage,
    @Default(400) double maxWidth,
    @Default(8.0) double buttonRadius,
    @Default(16.0) double buttonPadding,
    required Color buttonBackgroundColor,
    required Color buttonTextColor,
    @Default(18.0) double buttonFontSize,
    @Default(15.0) double spaceBetweenButtons,
  }) = _SignInTheme;
}
