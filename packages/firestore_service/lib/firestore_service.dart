library firestore_service;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firestoreServiceProvider =
    Provider<FirestoreService>((ref) => FirestoreService.instance);

class FirestoreService {
  FirestoreService._();

  static final instance = FirestoreService._();
  static final firestore = FirebaseFirestore.instance;

  String newDocumentId(String path) {
    return firestore.collection(path).doc().id;
  }

  Stream<List<T>> streamDocuments<T>(Query<T> query) {
    return query.snapshots().map((snapshot) {
      return snapshot.docs.map((snapshot) => snapshot.data()).toList();
    });
  }

  Future<List<T>> getDocuments<T>(Query<T> query) {
    return query.get().then((snapshot) {
      return snapshot.docs.map((snapshot) => snapshot.data()).toList();
    });
  }

  Stream<T?> streamDocument<T>(DocumentReference<T> ref) {
    return ref.snapshots().map((snapshot) => snapshot.data());
  }

  Future<T?> getDocument<T>(DocumentReference<T> ref) async {
    return ref.get().then((snapshot) => snapshot.data());
  }
}
