


import 'upload_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get cropPicture => 'Crop photo';

  @override
  String get takePhoto => 'Take a photo';

  @override
  String get openPhotoLibrary => 'Open photo library';

  @override
  String get deletePhoto => 'Delete photo';

  @override
  String get errorTitle => 'Oops! Something went wrong...';

  @override
  String get errorDescription => 'We are unable to handle your request at the moment.';
}
