part of firestore_service;

extension Description on FirebaseException {
  String description() {
    switch (code) {
      case "unavailable":
        return "unavailable";
      default:
        return "erreur inconnue";
    }
  }
}
