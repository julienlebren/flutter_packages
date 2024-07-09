part of platform;

class PlatformTextStyle {
  PlatformTextStyle._();

  static TextStyle get hugeTitle => TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w800,
        letterSpacing: isCupertino() ? -1 : 0,
      );

  static TextStyle get largeTitle => TextStyle(
        fontSize: 27,
        fontWeight: isCupertino() ? FontWeight.bold : FontWeight.w600,
        letterSpacing: isCupertino() ? -1 : 0,
      );

  static TextStyle get mediumTitle => TextStyle(
        fontSize: 22,
        fontWeight: isCupertino() ? FontWeight.bold : FontWeight.w700,
        letterSpacing: isCupertino() ? -1 : 0,
      );

  static TextStyle get smallTitle => TextStyle(
        fontSize: 16,
        letterSpacing: isCupertino() ? -0.3 : 0,
      );

  static TextStyle get n15 => TextStyle(
        fontSize: 15,
        letterSpacing: isCupertino() ? -0.25 : 0,
      );

  static TextStyle get n16 => TextStyle(
        fontSize: 16,
        letterSpacing: isCupertino() ? -0.25 : 0,
      );

  static TextStyle get n17 => TextStyle(
        fontSize: 17,
        letterSpacing: isCupertino() ? -0.3 : 0,
      );

  static TextStyle get n18 => TextStyle(
        fontSize: 18,
        letterSpacing: isCupertino() ? -0.35 : 0,
      );
}
