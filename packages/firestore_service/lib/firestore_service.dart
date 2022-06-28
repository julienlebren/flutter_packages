library firestore_service;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'firestore_converters.dart';
part 'firestore_errors.dart';

final firestoreServiceProvider =
    Provider<FirestoreService>((ref) => FirestoreService.instance);

class FirestoreService {
  FirestoreService._() {
    firestore.settings = const Settings(
      persistenceEnabled: true,
      cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
    );
  }

  static final instance = FirestoreService._();
  static final firestore = FirebaseFirestore.instance;

  void setPersistence() {}

  String newDocumentId(String path) {
    return firestore.collection(path).doc().id;
  }

  WriteBatch batch() => firestore.batch();

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
