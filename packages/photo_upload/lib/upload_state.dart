part of 'upload.dart';

@freezed
class UploadState with _$UploadState {
  const factory UploadState.initial() = _Initial;
  const factory UploadState.startingUpload(File file) = _StartingUpload;
  const factory UploadState.uploading(File file, double progress) = _Uploading;
  const factory UploadState.success(File file, String url) = _Success;
  const factory UploadState.error(String errorText) = _Error;
}
