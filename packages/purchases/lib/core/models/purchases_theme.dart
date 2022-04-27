part of '../../purchases.dart';

@freezed
class PurchasesTheme with _$PurchasesTheme {
  const factory PurchasesTheme({
    String? backgroundImage,
    Color? backgroundColor,
    required Color primaryColor,
    required Color textColor,
    Color? appBarButtonColor,
    required Color buttonBackgroundColor,
    required Color buttonTextColor,
    required Color termsButtonColor,
    required Color cupertinoDisclaimerColor,
    @Default(15.0) double spaceBetweenButtons,
  }) = _PurchasesTheme;
}
