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
import 'package:photo_upload/upload_localizations.dart';

part 'upload_state.dart';
part 'upload_controller.dart';
part 'upload_widget.dart';
part 'upload.freezed.dart';

final uploadL10nProvider = Provider<AppLocalizations>((ref) {
  throw UnimplementedError();
});

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
