part of platform;

showPlatformNumberPicker(
  BuildContext context,
  WidgetRef ref, {
  required String title,
  required int minValue,
  required int maxValue,
  required int selectedValue,
  required Function(int) onChanged,
}) {
  final valueProvider = StateProvider<int>((_) => selectedValue);

  if (isMaterial()) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: NumberPicker(
            value: selectedValue,
            minValue: 0,
            maxValue: 100,
            onChanged: (value) {
              ref.read(valueProvider).state = value;
            },
          ),
          actions: <Widget>[
            PlatformDialogAction(
              buttonText: MaterialLocalizations.of(context)
                  .cancelButtonLabel
                  .toUpperCase(),
              onPressed: () => Navigator.of(context).pop(false),
            ),
            PlatformDialogAction(
              buttonText: MaterialLocalizations.of(context)
                  .saveButtonLabel
                  .toUpperCase(),
              onPressed: () => onChanged(ref.read(valueProvider).state),
              isDefaultAction: true,
            ),
          ],
        );
      },
    );
  } else {}
}
