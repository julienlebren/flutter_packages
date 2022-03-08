library localization;

import 'dart:ui';
import 'package:extensions/extensions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localization/locale_names.dart';

extension LocaleName on Locale {
  String get name {
    return (localeNames[languageCode] ?? "Unknown").capitalize();
  }

  String get regionalName {
    return (localeNames["${languageCode}_$countryCode"] ?? "Unknown")
        .capitalize();
  }
}

class LocaleSettings {
  LocaleSettings({
    this.availableLocales = const [
      Locale('en', 'US'),
      Locale('fr', 'FR'),
    ],
    this.userLocale,
  });

  final List<Locale> availableLocales;
  final Locale? userLocale;
}

final localeSettingssProvider =
    Provider<LocaleSettings>((_) => throw UnimplementedError());

final localeProvider = Provider.family<Locale, LocaleSettings>((ref, settings) {
  final availableLocales = settings.availableLocales;
  final deviceLocale = window.locale;

  if (availableLocales.isEmpty) {
    throw UnimplementedError();
  }

  var _locales = availableLocales.where(
    (locale) => locale == settings.userLocale,
  );
  if (_locales.isNotEmpty) {
    return _locales.first;
  }

  if (availableLocales.contains(deviceLocale)) {
    return deviceLocale;
  }

  return availableLocales.first;
});
