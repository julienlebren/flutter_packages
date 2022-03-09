library localization;

import 'dart:ui';
import 'package:extensions/extensions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localization/locale_names.dart';

/// This extension provides the names of the available locales, in order to
/// display it in their native localization in the user settings.
extension LocaleName on Locale {
  String get name {
    return (localeNames[languageCode] ?? "Unknown").capitalize();
  }

  String get regionalName {
    return (localeNames["${languageCode}_$countryCode"] ?? "Unknown")
        .capitalize();
  }
}

/// The default locales available in the apps that are using this package
/// I always develop my apps in english as native language and provide
/// a french translation since I am french 🇫🇷🙈
/// But it can be overridden in the main [ProviderScope] of the app if needed.
final availableLocalesProvider = Provider(
  (_) => const [
    Locale('en'),
    Locale('fr'),
  ],
);

/// The locale provided by the user settings (not the device locale, which
/// is provided by window.locale, but the locale defined in the user settings)
final userLocaleProvider = Provider((_) => null);

/// The provider of the [Locale] which will be watched by the `localizationProvider`
/// in the app and the packages which are using localization.
final localeProvider = Provider((ref) {
  final availableLocales = ref.watch(availableLocalesProvider);
  final deviceLocale = window.locale;

  if (availableLocales.isEmpty) {
    throw UnimplementedError();
  }

  final userLocale = ref.watch(userLocaleProvider);

  var _locales = availableLocales.where(
    (locale) => locale == userLocale,
  );
  if (_locales.isNotEmpty) {
    return _locales.first;
  }

  if (availableLocales.contains(deviceLocale)) {
    return deviceLocale;
  }

  return availableLocales.first;
}, dependencies: [
  availableLocalesProvider,
  userLocaleProvider,
]);
