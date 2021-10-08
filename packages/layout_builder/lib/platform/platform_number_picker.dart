part of platform;

final valueProvider = StateProvider<int>((_) => 0);

showPlatformNumberPicker(
  BuildContext context,
  WidgetRef ref, {
  required String title,
  required int minValue,
  required int maxValue,
  required int selectedValue,
  required Function(int) onChanged,
}) async {
  ref.read(valueProvider).state = selectedValue;

  if (isMaterial()) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: _MaterialNumberPicker(),
          /*NumberPicker(
            value: ref.watch(valueProvider).state,
            minValue: minValue,
            maxValue: maxValue,
            onChanged: (value) {
              print("new value is $value");
              ref.read(valueProvider).state = value;
            },
          ),*/
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

class _MaterialNumberPicker extends ConsumerStatefulWidget {
  @override
  _MaterialNumberPickerState createState() => _MaterialNumberPickerState();
}

class _MaterialNumberPickerState extends ConsumerState<_MaterialNumberPicker> {
  //int _currentValue = 3;

  @override
  Widget build(BuildContext context) {
    return NumberPicker(
      value: ref.read(valueProvider).state,
      minValue: 0,
      maxValue: 100,
      onChanged: (value) {
        ref.read(valueProvider).state = value;
        //setState(() => _currentValue = value);
      },
    );
  }
}
