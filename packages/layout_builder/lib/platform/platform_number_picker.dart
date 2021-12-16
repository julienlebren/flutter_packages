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
  ref.read(valueProvider.state).state = selectedValue;

  if (isMaterial()) {
    print("test 2");
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: _MaterialNumberPicker(initialValue: selectedValue),
        actions: <Widget>[
          PlatformDialogAction(
            buttonText: MaterialLocalizations.of(context)
                .cancelButtonLabel
                .toUpperCase(),
            //onPressed: () => Navigator.of(context).pop(false),
          ),
          PlatformDialogAction(
            buttonText:
                MaterialLocalizations.of(context).saveButtonLabel.toUpperCase(),
            onPressed: () {
              onChanged(ref.read(valueProvider));
            },
            isDefaultAction: true,
          ),
        ],
      ),
    );
  } else {
    var data = [for (var i = minValue; i <= maxValue; i++) i];
    final appTheme = ref.watch(appThemeProvider);

    showPlatformModalPopup(
      context: context,
      ref: ref,
      title: title,
      height: 200,
      onPressed: () {
        onChanged(ref.read(valueProvider.state).state);
        Navigator.of(context, rootNavigator: true).pop();
      },
      child: CupertinoPicker(
        backgroundColor: appTheme.scaffoldBackgroundColor,
        itemExtent: 30,
        useMagnifier: true,
        scrollController: FixedExtentScrollController(
          initialItem: data.indexOf(selectedValue),
        ),
        children: data.map((item) => Text(item.toString())).toList(),
        onSelectedItemChanged: (index) {
          ref.read(valueProvider.state).state = data[index];
        },
      ),
    );
  }
}

class _MaterialNumberPicker extends ConsumerStatefulWidget {
  const _MaterialNumberPicker({
    Key? key,
    required this.initialValue,
  }) : super(key: key);

  final int initialValue;

  @override
  _MaterialNumberPickerState createState() =>
      _MaterialNumberPickerState(initialValue);
}

class _MaterialNumberPickerState extends ConsumerState<_MaterialNumberPicker> {
  _MaterialNumberPickerState(this._currentValue);

  int _currentValue = 3;

  @override
  Widget build(BuildContext context) {
    return NumberPicker(
      value: _currentValue,
      minValue: 0,
      maxValue: 100,
      onChanged: (value) {
        ref.read(valueProvider.state).state = value;
        setState(() => _currentValue = value);
      },
    );
  }
}
