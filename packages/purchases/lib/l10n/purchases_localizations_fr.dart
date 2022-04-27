


import 'purchases_localizations.dart';

/// The translations for French (`fr`).
class PurchasesLocalizationsFr extends PurchasesLocalizations {
  PurchasesLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String subscriptionYearPrice(String price) {
    return '$price/an';
  }

  @override
  String get subscriptionCupertinoCaption => 'Le paiement sera effectué sur le compte iTunes et l\'abonnement se renouvellera automatiquement à moins que le renouvellement automatique ne soit désactivé au moins 24 heures avant la fin de la période en cours. Le compte sera facturé pour le renouvellement dans les 24 heures précédant la fin de la période en cours. Gérez le renouvellement automatique en accédant à l\'application Paramètres de votre appareil.';

  @override
  String get subscriptionPrivacyPolicyButton => 'Politique de confidentialité';

  @override
  String get subscriptionTermsButton => 'Conditions d\'utilisation';

  @override
  String get subscriptionRestoreButton => 'Restaurer les achats';

  @override
  String get subscriptionRetryButton => 'Réessayer';
}
