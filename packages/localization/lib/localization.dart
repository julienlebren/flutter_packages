library localization;

import 'dart:ui';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localization/locale_names.dart';

extension StringX on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${toLowerCase().substring(1)}";
  }
}

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
final supportedLocalesProvider = Provider(
  (_) => const [
    Locale('en'),
    Locale('fr'),
  ],
);

/// The locale provided by the user settings (not the device locale, which
/// is provided by window.locale, but the locale defined in the user settings)
final userLocaleProvider = Provider<Locale?>((_) => null);

/// The provider of the [Locale] which will be watched by the `localizationProvider`
/// in the app and the packages which are using localization.
final localeProvider = Provider<Locale>((ref) {
  final availableLocales = ref.watch(supportedLocalesProvider);
  final deviceLocale = window.locale;

  if (availableLocales.isEmpty) {
    throw UnimplementedError();
  }

  final userLocale = ref.watch(userLocaleProvider);

  if (userLocale != null &&
      availableLocales.contains(Locale(userLocale.languageCode))) {
    return userLocale;
  }

  if (availableLocales.contains(Locale(deviceLocale.languageCode))) {
    return deviceLocale;
  }

  return availableLocales.first;
}, dependencies: [
  supportedLocalesProvider,
  userLocaleProvider,
]);
