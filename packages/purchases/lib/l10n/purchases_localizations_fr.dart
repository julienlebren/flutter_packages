import 'purchases_localizations.dart';

/// The translations for French (`fr`).
class PurchasesLocalizationsFr extends PurchasesLocalizations {
  PurchasesLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get annualCaption => 'Abonnement annuel';

  @override
  String annualPrice(String price) {
    return '$price/an';
  }

  @override
  String get closeAlertTitle => 'Un achat est actuellement en cours, êtes-vous sûr de vouloir quitter maintenant ?';

  @override
  String get closeAlertCloseButton => 'Oui, quitter cette vue';

  @override
  String get closeAlertCancelButton => 'Non, attendre la fin de l\'achat';

  @override
  String get cupertinoDisclaimer => 'Le paiement sera effectué sur le compte iTunes et l\'abonnement se renouvellera automatiquement à moins que le renouvellement automatique ne soit désactivé au moins 24 heures avant la fin de la période en cours. Le compte sera facturé pour le renouvellement dans les 24 heures précédant la fin de la période en cours. Gérez le renouvellement automatique en accédant à l\'application Paramètres de votre appareil.';

  @override
  String get errorTitle => 'Il y a eu un problème...';

  @override
  String get monthlyCaption => 'Abonnement mensuel';

  @override
  String monthlyPrice(String price) {
    return '$price/mois';
  }

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
  String get sixMonthCaption => 'Abonnement pour 6 mois';

  @override
  String sixMonthPrice(String price) {
    return '$price/6 mois';
  }

  @override
  String get threeMonthCaption => 'Abonnement pour 3 mois';

  @override
  String threeMonthPrice(String price) {
    return '$price/3 mois';
  }

  @override
  String get twoMonthCaption => 'Abonnement pour 2 mois';

  @override
  String twoMonthPrice(String price) {
    return '$price/2 mois';
  }

  @override
  String get weeklyCaption => 'Abonnement hebdommadaire';

  @override
  String weeklyPrice(String price) {
    return '$price/semaine';
  }

  @override
  String get noSubscriptionToRestore => 'Il n\'y a aucun abonnement actif à restaurer.';
}
