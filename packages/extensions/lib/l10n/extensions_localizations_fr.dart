import 'extensions_localizations.dart';

/// The translations for French (`fr`).
class ExtensionsLocalizationsFr extends ExtensionsLocalizations {
  ExtensionsLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String daysAgo(String days) {
    return 'il y a $days jours';
  }

  @override
  String get yesterday => 'hier';

  @override
  String get oneHourAgo => '1 hour ago';

  @override
  String hoursAgo(String hours) {
    return 'il y a $hours heures';
  }

  @override
  String minutesAgo(String minutes) {
    return 'il y a $minutes minutes';
  }

  @override
  String get oneMinuteAgo => '1 minute ago';

  @override
  String get justNow => 'À l\'instant';
}
