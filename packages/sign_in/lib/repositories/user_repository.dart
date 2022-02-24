part of '../sign_in.dart';

class BaseUser {
  BaseUser(this.id);

  String id;

  factory BaseUser.fromJson(Map<String, dynamic> json) =>
      BaseUser(json['id'] as String);

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

  Future<void> set(BaseUser user) => _userRef.doc(user.id).set(user);
}
