library firestore_service;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firestoreServiceProvider =
    Provider<FirestoreService>((ref) => FirestoreService.instance);

class FirestoreService {
  FirestoreService._();

  static final instance = FirestoreService._();
  static final firestore = FirebaseFirestore.instance;

  Stream<List<T>> collectionStream<T>({
    required Query<T> query,
  }) {
    return query.snapshots().map((snapshot) {
      return snapshot.docs.map((snapshot) => snapshot.data()).toList();
    });
  }

}
