part of 'upload.dart';

class UploadController extends StateNotifier<UploadState> {
  UploadController(
    this._storage,
    this._ref,
  ) : super(UploadState.initial());

  final StorageService _storage;
  final Reference _ref;

  void reset() {
    state = UploadState.initial();
  }

  Future<void> uploadPhoto(File file) async {
    state = UploadState.startingUpload(file);

    final task = _storage.uploadPhoto(_ref, file);

    task.snapshotEvents.listen((TaskSnapshot snapshot) {
      final progress = (snapshot.bytesTransferred / snapshot.totalBytes);
      state = UploadState.uploading(file, progress);
    }, onError: (e) {
      state = UploadState.error(e.toString());
    });

    try {
      await task.whenComplete(() async {
        final photoURL = await task.snapshot.ref.getDownloadURL();
        state = UploadState.success(file, photoURL);
      });
    } catch (e) {
      state = UploadState.error(e.toString());
    }
  }
}
