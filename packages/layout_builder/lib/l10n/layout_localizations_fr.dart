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
  String get networkErrorTitle => 'Vous n\'êtes actuellement pas connecté à internet';

  @override
  String get networkErrorCaption => 'L\'app nécessite une connexion internet pour fonctionner, merci de vérifier vos paramètres de connexion';

  @override
  String get networkErrorWaiting => 'En attente de connexion...';
}
