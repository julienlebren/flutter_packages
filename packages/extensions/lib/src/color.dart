part of extensions;

extension ColorX on Color {
  Color darken([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  Color lighten([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }

  SystemUiOverlayStyle get uiOverlayStyle {
    return (computeLuminance() > 0.179)
        ? SystemUiOverlayStyle.dark
        : SystemUiOverlayStyle.light;
  }

  Brightness get brightness {
    return computeLuminance() > 0.5 ? Brightness.light : Brightness.dark;
  }

  Brightness get invertedBrightness {
    return computeLuminance() <= 0.5 ? Brightness.light : Brightness.dark;
  }

  Color textColorFromBackgroundColor() {
    if (brightness == Brightness.light) {
      return Colors.black;
    } else {
      return Colors.white;
    }
  }
}
