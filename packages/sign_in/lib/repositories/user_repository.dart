part of '../sign_in.dart';

class BaseUser {
  const BaseUser();

  factory BaseUser.fromJson(Map<String, dynamic> json) => const BaseUser();

  Map<String, dynamic> toJson() => {};
}

class BaseUserRepository {
  BaseUserRepository(this.service, this.userId);

  final FirestoreService service;
  final String userId;

  final _userRef =
      FirebaseFirestore.instance.collection("users").withConverter<BaseUser>(
            fromFirestore: (snapshot, _) {
              return BaseUser.fromJson(snapshot.data()!);
            },
            toFirestore: (user, _) => user.toJson()..remove('id'),
          );

  CollectionReference<BaseUser> ref(
    String path, {
    required FromFirestore<BaseUser> fromFirestore,
    required ToFirestore<BaseUser> toFirestore,
  }) {
    return _userRef.doc(userId).collection(path).withConverter<BaseUser>(
          fromFirestore: fromFirestore,
          toFirestore: toFirestore,
        );
  }

  Reference storageRef(String path) =>
      FirebaseStorage.instance.ref().child("users/$userId").child(path);

  Stream<BaseUser?> streamUser() {
    return _userRef.doc(userId).snapshots().map((snapshot) => snapshot.data());
  }
}
