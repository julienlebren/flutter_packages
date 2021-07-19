library firebase_storage_service;

import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage_service/storage_path.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final storageServiceProvider = Provider.family<StorageService, String>(
    (ref, userId) => StorageService(userId));

class StorageService {
  StorageService(this.userId);

  final String userId;

  Reference storageRef(String path) => FirebaseStorage.instance
      .ref()
      .child("${StoragePath.users}/$userId")
      .child(path);

  UploadTask _upload({
    required File file,
    required Reference ref,
    required String contentType,
  }) {
    return ref.putFile(
      File(file.path),
      SettableMetadata(contentType: contentType),
    );
  }

  Future<void> deleteFileFromURL(String url) {
    final storageReference = FirebaseStorage.instance.refFromURL(url);
    return storageReference.delete();
  }

  Future<void> deleteFile(
    Reference ref,
  ) {
    return ref.delete();
  }

  UploadTask uploadPhoto(
    Reference ref,
    File file,
  ) {
    return _upload(file: file, ref: ref, contentType: 'image/jpeg');
  }
}
