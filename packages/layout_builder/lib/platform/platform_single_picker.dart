part of platform;

showPlatformSinglePicker<T>(
  BuildContext context,
  WidgetRef ref, {
  required String title,
  required List<T> data,
  T? selectedValue,
  required Widget Function(T) itemBuilder,
  required Function(T) onChanged,
}) {
  if (isMaterial()) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: Container(
              transform: Matrix4.translationValues(-10.0, 0.0, 0.0),
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: data
                    .map(
                      (item) => RadioListTile<T>(
                        contentPadding: EdgeInsets.zero,
                        title: itemBuilder(item),
                        value: item,
                        groupValue: selectedValue,
                        selected: false,
                        onChanged: (value) {
                          onChanged(value!);
                          Navigator.pop(context);
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        );
      },
    );
  } else {
    final valueProvider = StateProvider<T>((_) => selectedValue ?? data.first);
    showPlatformModalPopup(
      context: context,
      ref: ref,
      height: 200,
      onPressed: () {
        onChanged(ref.read(valueProvider.state).state);
        Navigator.of(context, rootNavigator: true).pop();
      },
      child: CupertinoPicker(
        backgroundColor: Colors.white,
        itemExtent: 30,
        useMagnifier: true,
        scrollController: FixedExtentScrollController(
          initialItem: selectedValue != null ? data.indexOf(selectedValue) : 0,
        ),
        children: data.map((item) => itemBuilder(item)).toList(),
        onSelectedItemChanged: (index) {
          ref.read(valueProvider.state).state = data[index];
        },
      ),
    );
  }
}
