part of 'upload.dart';

class UploadWidget extends ConsumerWidget {
  const UploadWidget({
    Key? key,
    this.width = 120,
    this.height = 120,
    this.isRounded = true,
    this.showDeleteButton = false,
    this.isUpdateSuccess = false,
    required this.storageRef,
    required this.title,
    required this.onDelete,
    required this.onStart,
    required this.onSuccess,
    required this.child,
    this.maxWidth,
    this.l10n = const UploadLocalizations(),
  });

  final Reference storageRef;
  final String title;
  final bool isUpdateSuccess;
  final bool showDeleteButton;
  final double width;
  final double height;
  final bool isRounded;
  final VoidCallback onDelete;
  final VoidCallback onStart;
  final Function(String url) onSuccess;
  final Widget child;
  final double? maxWidth;
  final UploadLocalizations l10n;

  UploadController _controller(WidgetRef ref) {
    return ref.read(uploadControllerProvider(storageRef).notifier);
  }

  void _showModalSheet(BuildContext context, WidgetRef ref) {
    showPlatformModalSheet(
      context: context,
      ref: ref,
      title: title,
      actions: [
        PlatformModalSheetAction(
          title: l10n.takePhoto,
          icon: Icons.photo_camera_outlined,
          onPressed: () => _openCamera(ref),
        ),
        PlatformModalSheetAction(
          title: l10n.openPhotoLibrary,
          icon: Icons.photo_library_outlined,
          onPressed: () => _openLibrary(ref),
        ),
        if (showDeleteButton)
          PlatformModalSheetAction(
            title: l10n.deletePhoto,
            icon: Icons.delete_outlined,
            onPressed: () {
              onDelete.call();
              _controller(ref).reset();
            },
            isDestructiveAction: true,
          ),
      ],
    );
  }

  void _openCamera(WidgetRef ref) {
    _getImage(ref, ImageSource.camera);
  }

  void _openLibrary(WidgetRef ref) {
    _getImage(ref, ImageSource.gallery);
  }

  Future _getImage(
    WidgetRef ref,
    ImageSource source,
  ) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: source,
      maxWidth: maxWidth,
    );

    if (pickedFile != null) {
      _cropImage(ref, File(pickedFile.path));
    }
  }

  Future<void> _cropImage(WidgetRef ref, File imageFile) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      aspectRatio: isRounded ? CropAspectRatio(ratioX: 1, ratioY: 1) : null,
      cropStyle: isRounded ? CropStyle.circle : CropStyle.rectangle,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: l10n.cropPicture,
          toolbarColor: Colors.black,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(
          title: l10n.cropPicture,
        ),
      ],
    );
    if (croppedFile != null) {
      _controller(ref).uploadPhoto(File(croppedFile.path));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(appThemeProvider);
    final formTheme = ref.watch(formThemeProvider);
    final photoFile = ref.watch(photoFileProvider(storageRef));
    final isUploading = ref.watch(uploadingProvider(storageRef));
    final isUploadSuccess = ref.watch(uploadSuccessProvider(storageRef));

    ref.listen<UploadState>(uploadControllerProvider(storageRef), (_, state) {
      state.maybeWhen(
        startingUpload: (_) => onStart,
        success: (_, url) => onSuccess(url),
        error: (errorText) => showAlertDialog(
          context,
          ref,
          title: l10n.errorTitle,
          content: l10n.errorDescription,
        ),
        orElse: () => null,
      );
    });
    return Center(
      child: GestureDetector(
        child: SizedBox(
          height: height,
          width: width,
          child: Stack(
            alignment: isRounded
                ? AlignmentDirectional.bottomEnd
                : AlignmentDirectional.center,
            children: [
              ClipRRect(
                borderRadius:
                    BorderRadius.circular(isRounded ? width / 2 : 0.0),
                child: SizedBox(
                  height: height,
                  width: width,
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 200),
                    opacity: isUploading ? 0.5 : 1,
                    child: photoFile != null ? Image.file(photoFile) : child,
                  ),
                ),
              ),
              if (isUploading)
                SizedBox(
                  height: isRounded ? width : 60,
                  width: isRounded ? height : 60,
                  child: Consumer(builder: (context, watch, child) {
                    final progress =
                        ref.watch(uploadProgressProvider(storageRef));
                    return CircularProgressIndicator(
                      strokeWidth: 5,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                      value: progress,
                    );
                  }),
                ),
              if (isRounded)
                Transform(
                  transform: Matrix4.translationValues(8.0, 0.0, 0.0),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: formTheme.backgroundColor, width: 2),
                          borderRadius: BorderRadius.circular(20.0),
                          color: isUploadSuccess && isUpdateSuccess
                              ? Colors.green
                              : appTheme.primaryColor,
                        ),
                      ),
                      Icon(
                        isUploadSuccess && isUpdateSuccess
                            ? PlatformIcons.checkmark
                            : Icons.add_a_photo,
                        size: 20,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
        onTap: isUploading ? null : () => _showModalSheet(context, ref),
      ),
    );
  }
}
