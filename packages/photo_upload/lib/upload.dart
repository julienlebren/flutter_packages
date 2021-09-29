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
import 'package:layout_builder/layout_builder.dart';

part 'upload_state.dart';
part 'upload_controller.dart';
part 'upload_widget.dart';
part 'upload.freezed.dart';

final uploadControllerProvider = StateNotifierProvider.autoDispose
    .family<UploadController, UploadState, Reference>((ref, storageRef) {
  final service = ref.watch(storageServiceProvider);
  return UploadController(service, storageRef);
});

final photoFileProvider =
    Provider.family.autoDispose<File?, Reference>((ref, storageRef) {
  final controller = ref.watch(uploadControllerProvider(storageRef));
  return controller.maybeWhen(
    uploading: (file, _) => file,
    success: (file, _) => file,
    orElse: () => null,
  );
});

final uploadingProvider =
    Provider.family.autoDispose<bool, Reference>((ref, storageRef) {
  final controller = ref.watch(uploadControllerProvider(storageRef));
  return controller.maybeWhen(
    uploading: (_, __) => true,
    orElse: () => false,
  );
});

final uploadProgressProvider =
    Provider.family.autoDispose<double, Reference>((ref, storageRef) {
  final controller = ref.watch(uploadControllerProvider(storageRef));
  return controller.maybeWhen(
    uploading: (_, progress) => progress,
    orElse: () => 0,
  );
});

final uploadSuccessProvider =
    Provider.family.autoDispose<bool, Reference>((ref, storageRef) {
  final controller = ref.watch(uploadControllerProvider(storageRef));
  return controller.maybeWhen(
    success: (_, __) => true,
    orElse: () => false,
  );
});

@freezed
class UploadLocalizations with _$UploadLocalizations {
  const factory UploadLocalizations({
    @Default("Crop photo") String cropPicture,
    @Default("Take a photo") String takePhoto,
    @Default("Open photo library") String openPhotoLibrary,
    @Default("Delete photo") String deletePhoto,
    @Default("Oops! Something went wrong...") String errorTitle,
    @Default("We are unable to handle your request at the moment.")
        String errorDescription,
  }) = _UploadLocalizations;
}
