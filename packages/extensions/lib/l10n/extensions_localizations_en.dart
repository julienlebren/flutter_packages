import 'extensions_localizations.dart';

/// The translations for English (`en`).
class ExtensionsLocalizationsEn extends ExtensionsLocalizations {
  ExtensionsLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String daysAgo(String days) {
    return '$days days ago';
  }

  @override
  String get yesterday => 'yesterday';

  @override
  String get oneHourAgo => '1 hour ago';

  @override
  String hoursAgo(String hours) {
    return '$hours hours ago';
  }

  @override
  String minutesAgo(String minutes) {
    return '$minutes minutes ago';
  }

  @override
  String get oneMinuteAgo => '1 minute ago';

  @override
  String get justNow => 'Just now';
}
