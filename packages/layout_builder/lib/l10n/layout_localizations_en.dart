import 'layout_localizations.dart';

/// The translations for English (`en`).
class LayoutLocalizationsEn extends LayoutLocalizations {
  LayoutLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get dark => 'Dark';

  @override
  String get light => 'Light';

  @override
  String get system => 'System';

  @override
  String get errorTitle => 'Oops! Something went wrong...';

  @override
  String get errorDescription => 'We are unable to handle your request at the moment.';

  @override
  String get networkErrorTitle => 'You are currently not connected to the internet';

  @override
  String get networkErrorCaption => 'The app requires an internet connection to work, please check your connection settings';

  @override
  String get networkErrorWaiting => 'Waiting for connection...';
}
