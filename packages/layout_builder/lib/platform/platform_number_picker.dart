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
          content: _IntegerExample(),
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

class _IntegerExample extends StatefulWidget {
  @override
  __IntegerExampleState createState() => __IntegerExampleState();
}

class __IntegerExampleState extends State<_IntegerExample> {
  int _currentValue = 3;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NumberPicker(
          value: _currentValue,
          minValue: 0,
          maxValue: 100,
          onChanged: (value) => setState(() => _currentValue = value),
        ),
        Text('Current value: $_currentValue'),
      ],
    );
  }
}
