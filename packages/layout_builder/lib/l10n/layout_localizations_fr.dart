import 'layout_localizations.dart';

/// The translations for French (`fr`).
class LayoutLocalizationsFr extends LayoutLocalizations {
  LayoutLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get dark => 'Sombre';

  @override
  String get light => 'Clair';

  @override
  String get system => 'Système';

  @override
  String get errorTitle => 'Il y a eu un problème...';

  @override
  String get errorDescription => 'Nous ne pouvons pas traiter votre requête pour le moment.';

  @override
  String get networkErrorTitle => 'You are currently not connected to the internet';

  @override
  String get networkErrorCaption => 'The app requires an internet connection to work, please check your connection settings';

  @override
  String get networkErrorWaiting => 'Waiting for connection...';
}
