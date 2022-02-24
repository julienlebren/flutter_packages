library localization;

import 'dart:ui';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localesProvider = Provider<List<Locale>>((ref) {
  return const [
    Locale('en', 'US'),
    Locale('fr', 'FR'),
  ];
});

final localeProvider = Provider.family<Locale, String?>(
  (ref, languageCode) {
    final availableLocales = ref.read(localesProvider);
    final deviceLocale = window.locale;

    if (availableLocales.isEmpty) {
      throw UnimplementedError();
    }

    var _locales = availableLocales.where(
      (locale) => locale.languageCode == languageCode,
    );
    if (_locales.isNotEmpty) {
      return _locales.first;
    }

    if (availableLocales.contains(deviceLocale)) {
      return deviceLocale;
    }

    return availableLocales.first;
  },
  dependencies: [localesProvider],
);
