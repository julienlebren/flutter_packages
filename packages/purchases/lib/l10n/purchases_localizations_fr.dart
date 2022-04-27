


import 'purchases_localizations.dart';

/// The translations for French (`fr`).
class PurchasesLocalizationsFr extends PurchasesLocalizations {
  PurchasesLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get cupertinoDisclaimer => 'Le paiement sera effectué sur le compte iTunes et l\'abonnement se renouvellera automatiquement à moins que le renouvellement automatique ne soit désactivé au moins 24 heures avant la fin de la période en cours. Le compte sera facturé pour le renouvellement dans les 24 heures précédant la fin de la période en cours. Gérez le renouvellement automatique en accédant à l\'application Paramètres de votre appareil.';

  @override
  String get errorTitle => 'Il y a eu un problème...';

  @override
  String get priceNotLoaded => 'Impossible d\'accéder au Store pour le moment.';

  @override
  String get privacyPolicyButton => 'Politique de confidentialité';

  @override
  String get restoreButton => 'Restaurer les achats';

  @override
  String get retryButton => 'Réessayer';

  @override
  String get termsButton => 'Conditions d\'utilisation';

  @override
  String yearPrice(String price) {
    return '$price/an';
  }
}
