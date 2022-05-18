part of theme;

enum ThemeType { system, light, dark }

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
      return WidgetsBinding.instance.window.platformBrightness;
    }
  }
}

extension ThemeDescription on ThemeType {
  String description(WidgetRef ref) {
    final l10n = ref.watch(layoutLocalizationsProvider);
    switch (this) {
      case ThemeType.dark:
        return l10n.dark;
      case ThemeType.light:
        return l10n.light;
      default:
        return l10n.system;
    }
  }

  String description2(BuildContext context) {
    final l10n = LayoutLocalizations.of(context)!;
    switch (this) {
      case ThemeType.dark:
        return l10n.dark;
      case ThemeType.light:
        return l10n.light;
      default:
        return l10n.system;
    }
  }
}
