part of platform;

showPlatformNumberPicker(
  BuildContext context,
  WidgetRef ref, {
  required String title,
  required int minValue,
  required int maxValue,
  required int selectedValue,
  required Function(int) onChanged,
}) async {
  final valueProvider = StateProvider<int>((_) => selectedValue);

  if (isMaterial()) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: NumberPicker(
            value: ref.watch(valueProvider).state,
            minValue: minValue,
            maxValue: maxValue,
            onChanged: (value) {
              print("new value is $value");
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
              onPressed: () {
                print("value is ${ref.read(valueProvider).state}");
                onChanged(ref.read(valueProvider).state);
                Navigator.of(context).pop();
              },
              isDefaultAction: true,
            ),
          ],
        );
      },
    );
  } else {}
}
