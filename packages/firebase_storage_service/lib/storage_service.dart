library firebase_storage_service;

import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final storageServiceProvider =
    Provider<StorageService>((ref) => StorageService.instance);

class StorageService {
  StorageService._();
  static final instance = StorageService._();

  UploadTask _upload({
    required File file,
    required String path,
    required String contentType,
  }) {
    final storageReference = FirebaseStorage.instance.ref().child(path);
    return storageReference.putFile(
      File(file.path),
      SettableMetadata(contentType: contentType),
    );
  }

  Future<void> deleteFileFromURL(String url) {
    final storageReference = FirebaseStorage.instance.refFromURL(url);
    return storageReference.delete();
  }

  Future<void> deleteFile({
    required String path,
  }) {
    final storageReference = FirebaseStorage.instance.ref().child(path);
    return storageReference.delete();
  }

  UploadTask uploadPhoto({
    required File file,
    required String path,
  }) =>
      _upload(file: file, path: path, contentType: 'image/jpeg');
}
