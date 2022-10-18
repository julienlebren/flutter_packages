part of '../../purchases.dart';

@freezed
class PurchasesTheme with _$PurchasesTheme {
  const factory PurchasesTheme({
    String? backgroundImage,
    required Color backgroundColor,
    required Color primaryColor,
    required Color textColor,
    Color? appBarButtonColor,
    required Color textButtonColor,
    required Color cupertinoDisclaimerColor,
    required Color featureBackgroundColor,
    required Color featureIconColor,
    required Color featureTitleColor,
    required Color featureCaptionColor,
    Color? purchaseButtonBackgroundColor,
    @Default(5.0) double purchaseButtonBorderRadius,
    Color? purchaseButtonBorderColor,
    @Default(15.0) double spaceBetweenButtons,
  }) = _PurchasesTheme;
}
