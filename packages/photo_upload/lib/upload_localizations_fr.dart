


import 'upload_localizations.dart';

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get cropPicture => 'Recadrer la photo';

  @override
  String get takePhoto => 'Prendre une photo';

  @override
  String get openPhotoLibrary => 'Choisir parmi vos photos';

  @override
  String get deletePhoto => 'Supprimer la photo';

  @override
  String get errorTitle => 'Il y a eu un problème...';

  @override
  String get errorDescription => 'Nous ne pouvons pas traiter votre requête pour le moment.';
}
