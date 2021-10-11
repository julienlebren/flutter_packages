part of theme;

enum ThemeType { system, light, dark }

extension ThemeTypeX on ThemeType {
  Brightness get brightness {
    if (this == ThemeType.dark) {
      return Brightness.dark;
    } else if (this == ThemeType.light) {
      return Brightness.light;
    } else {
      return WidgetsBinding.instance!.window.platformBrightness;
    }
  }
}

class ThemeTypeConverter implements JsonConverter<ThemeType, int> {
  const ThemeTypeConverter();

  @override
  ThemeType fromJson(int value) {
    return ThemeType.values[value];
  }

  @override
  int toJson(ThemeType value) => value.index;
}

extension ThemeBrightness on ThemeType {
  Brightness get brightness {
    if (this == ThemeType.dark) {
      return Brightness.dark;
    } else if (this == ThemeType.light) {
      return Brightness.light;
    } else {
      return WidgetsBinding.instance!.window.platformBrightness;
    }
  }
}

extension ThemeDescription on ThemeType {
  String description(ThemeLocalizations l10n) {
    switch (this) {
      case ThemeType.dark:
        return l10n.darkTheme;
      case ThemeType.light:
        return l10n.lightTheme;
      default:
        return l10n.systemTheme;
    }
  }
}

@freezed
class ThemeLocalizations with _$ThemeLocalizations {
  const factory ThemeLocalizations({
    @Default("Dark") String darkTheme,
    @Default("Light") String lightTheme,
    @Default("System") String systemTheme,
  }) = _ThemeLocalizations;
}
