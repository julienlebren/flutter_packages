library localization;

import 'dart:ui';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localesProvider = Provider<List<Locale>>((ref) {
  return const [
    Locale('en', 'US'),
    Locale('fr', 'FR'),
  ];
});

final userLanguageProvider = Provider<String?>((_) => null);

final localeProvider = Provider<Locale>(
  (ref) {
    final availableLocales = ref.read(localesProvider);
    final deviceLocale = window.locale;

    if (availableLocales.isEmpty) {
      throw UnimplementedError();
    }

    final userLanguage = ref.watch(userLanguageProvider);
    var _locales = availableLocales.where(
      (locale) => locale.languageCode == userLanguage,
    );
    if (_locales.isNotEmpty) {
      return _locales.first;
    }

    if (availableLocales.contains(deviceLocale)) {
      return deviceLocale;
    }

    return availableLocales.first;
  },
  dependencies: [localesProvider, userLanguageProvider],
);
