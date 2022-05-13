


import 'sign_in_localizations.dart';

/// The translations for French (`fr`).
class SignInLocalizationsFr extends SignInLocalizations {
  SignInLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get continueButton => 'Continuer';

  @override
  String get countriesTitle => 'Pays / Région';

  @override
  String get emailResetTitle => 'Mot de passe oublié';

  @override
  String get emailResetSubtitle => 'Saisissez votre e-mail et nous vous enverrons un lien pour réinitialiser votre mot de passe.';

  @override
  String get emailResetSubmitButton => 'Rénitialiser le mot de passe';

  @override
  String get emailResetSuccessTitle => 'Vérifiez vos e-mails';

  @override
  String emailResetSuccessDescription(String email) {
    return 'Nous venons d\'envoyer un lien sur $email un lien pour réinitialiser votre mot de passe.';
  }

  @override
  String get errorTitle => 'Aïe ! Il y a eu un problème...';

  @override
  String get passwordRequirements => 'Le mot de passe doit remplir les conditions suivantes :';

  @override
  String get passwordRequirementMinLength => '6 caractères minimum';

  @override
  String get passwordRequirementUppercase => 'Au moins une majuscule';

  @override
  String get passwordRequirementLowercase => 'Au moins une minuscule';

  @override
  String get passwordRequirementDigits => 'Au moins un chiffre';

  @override
  String get passwordRequirementSpecialChars => 'Au moins un caractère spécial';

  @override
  String get passwordRequirementMatch => 'La confirmation est identique';

  @override
  String get settingsAccountTitle => 'Compte';

  @override
  String get settingsCreateAccountButton => 'Créer un compte';

  @override
  String get settingsNoAccount => 'Vous n\'êtes actuellement pas connecté, vos réglages et autres données ne sont pas sauvegardées et pourraient être perdus.';

  @override
  String get settingsEmailSectionTitle => 'Informations de connexion';

  @override
  String get settingsEmailLabel => 'Adresse e-mail';

  @override
  String get settingsEmailTitle => 'Adresse e-mail';

  @override
  String get settingsEmailPlaceholder => 'Nouvelle adresse e-mail';

  @override
  String get settingsPasswordTitle => 'Mot de passe';

  @override
  String get settingsPasswordLabel => 'Mot de passe';

  @override
  String get settingsPasswordPlaceholder => 'Nouveau mot de passe';

  @override
  String get settingsPasswordConfirmationPlaceholder => 'Confirmez le mot de passe';

  @override
  String get settingsPasswordEdit => 'Modifier';

  @override
  String get settingsPasswordUndefinedCaption => 'Vous n\'avez pas encore défini de mot de passe, vous ne pourrez donc pas vous connecter à votre compte en utilisant votre adresse e-mail et votre mot de passe. Seule la connexion via un compte tiers sera fonctionnelle.';

  @override
  String get settingsThirdPartySectionTitle => 'Connexion via un compte tiers';

  @override
  String get settingsThirdPartyConnected => 'Connecté';

  @override
  String get settingsThirdPartyNotConnected => 'Non connecté';

  @override
  String get settingsThirdPartyCaption => 'Vous pouvez cumuler plusieurs méthodes de connexion afin de sécuriser l\'accès à votre compte.';

  @override
  String get settingsLogoutButton => 'Déconnexion';

  @override
  String get settingsLogoutConfirmation => 'Êtes-vous sûr de vouloir vous déconnecter ?';

  @override
  String get settingsUndefined => 'Non défini';

  @override
  String get signInAnonymously => 'Continuer sans créer de compte';

  @override
  String get signInWithApple => 'Continuer avec Apple';

  @override
  String get signInWithEmail => 'Continuer avec un e-mail';

  @override
  String get signInWithEmailLinkTitle => 'Sign in with e-mail';

  @override
  String get signInWithEmailLinkSubtitle => 'No password required, we just send you an email with a link to log in to the app.';

  @override
  String get signInWithEmailLinkSuccess => 'Vérifiez vos e-mails, nous vous avons envoyé un lien pour vous identifier.';

  @override
  String get signInWithEmailLinkRetry => 'You did not receive it? Try again or try another identification method.';

  @override
  String get signInWithEmailCreateAccount => 'Pas encore inscrit ? Créez un compte.';

  @override
  String get signInWithEmailForgotPassword => 'Mot de passe oublié ?';

  @override
  String get signInWithEmailPlaceholder => 'Adresse e-mail';

  @override
  String get signInWithEmailPasswordPlaceholder => 'Mot de passe';

  @override
  String get signInWithEmailAlreadyAccount => 'Déjà inscrit ? Identifiez-vous ici.';

  @override
  String get signInWithEmailRegisterButton => 'Créer un compte';

  @override
  String get signInWithEmailRegisterTitle => 'S\'inscrire avec un e-mail';

  @override
  String get signInWithEmailTitle => 'S\'identifier avec un e-mail';

  @override
  String get signInWithEmailSubtitle => 'No password required, we just send you an email with a link to log in to the app.';

  @override
  String get signInWithEmailInvalidPasswordConfirmation => 'Passwords do not match';

  @override
  String get signInWithFacebook => 'Continuer avec Facebook';

  @override
  String get signInWithGoogle => 'Continuer avec Google';

  @override
  String get signInWithPhone => 'Continuer avec un numéro';

  @override
  String get signInPhoneTitle => 'Numéro de téléphone';

  @override
  String get signInPhoneSubtitle => 'Nous allons envoyer un SMS pour confirmer votre numéro, cela ne vous coûtera rien.';

  @override
  String signInPhonePlaceholder(String example) {
    return 'Exemple: $example';
  }

  @override
  String get signInPhoneAutoRetrieve => 'Vous n\'aurez peut-être pas besoin de saisir le code car l\'application tentera de le détecter automatiquement.';

  @override
  String get signInPhoneLoadingDialog => 'En attente de la détection automatique du code...';

  @override
  String get signInVerificationTitle => 'Vérification du numéro';

  @override
  String signInVerificationSubtitle(String phoneNumber) {
    return 'Saisissez le code à 6 chiffres que nous avons envoyé au $phoneNumber';
  }

  @override
  String signInVerificationNotReceived(String seconds) {
    return 'Vous n\'avez pas reçu le code ?\nAttendez $seconds secondes...';
  }

  @override
  String get signInVerificationResend => 'Renvoyer le code';

  @override
  String get errorExpiredActionCode => 'Ce lien a expiré.';

  @override
  String get errorInvalidEmail => 'Cette adresse e-mail n\'est pas valide.';

  @override
  String get errorInvalidVerificationCode => 'Code de vérification non valide !';

  @override
  String get errorUserDisabled => 'Ce compte a été désactivé.';

  @override
  String get errorUserNotFound => 'Nous n\'avons trouvé aucun compte enregistré avec cette adresse e-mail.';

  @override
  String get errorWrongPassword => 'Le mot de passe est incorrect.';

  @override
  String get errorEmailAlreadyInUse => 'Un compte existe déjà avec cette adresse e-mail.';

  @override
  String get errorWeakPassword => 'Le mot de passe n\'est pas assez complexe.';

  @override
  String get errorOperationNotAllowed => 'Cette opération n\'est pas autorisée.';

  @override
  String get errorPhoneNotMobile => 'Vous devez saisir un numéro de téléphone mobile.';

  @override
  String get errorUnknown => 'Une erreur inconnue est survenue.';

  @override
  String get unlinkTitle => 'Que souhaitez-vous faire ?';

  @override
  String unlinkProvider(String provider) {
    return 'Déconnecter $provider';
  }
}
