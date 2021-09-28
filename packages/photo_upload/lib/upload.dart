library photo_upload;

import 'dart:io';
import 'package:firebase_storage_service/storage_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

part 'upload_state.dart';
part 'upload_controller.dart';
part 'upload_widget.dart';
part 'upload.freezed.dart';

final uploadControllerProvider =
    StateNotifierProvider.autoDispose<UploadController, UploadState, Reference>(
        (ref, storageRef) {
  final service = ref.watch(storageServiceProvider);
  return UploadController(service, storageRef);
});

final photoFileProvider =
    Provider.family.autoDispose<File?, UploadType>((ref, type) {
  final controller = ref.watch(uploadControllerProvider(type));
  return controller.maybeWhen(
    uploading: (file, _) => file,
    success: (file, _) => file,
    orElse: () => null,
  );
});

final uploadingProvider =
    Provider.family.autoDispose<bool, UploadType>((ref, type) {
  final controller = ref.watch(uploadControllerProvider(type));
  return controller.maybeWhen(
    uploading: (_, __) => true,
    orElse: () => false,
  );
});

final uploadProgressProvider =
    Provider.family.autoDispose<double, UploadType>((ref, type) {
  final controller = ref.watch(uploadControllerProvider(type));
  return controller.maybeWhen(
    uploading: (_, progress) => progress,
    orElse: () => 0,
  );
});

final uploadSuccessProvider =
    Provider.family.autoDispose<bool, UploadType>((ref, type) {
  final controller = ref.watch(uploadControllerProvider(type));
  return controller.maybeWhen(
    success: (_, __) => true,
    orElse: () => false,
  );
});
