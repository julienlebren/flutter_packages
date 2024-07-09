part of platform;

showPlatformMultiPicker<T>(
  BuildContext context,
  WidgetRef ref, {
  required String title,
  String? subtitle,
  required List<T> data,
  required List<T> selectedValues,
  required Widget Function(T) itemBuilder,
  required Function(List<T>) onSave,
}) {
  final selectedValuesProvider = StateProvider<List<T>>((_) {
    throw UnimplementedError();
  });

  _onChanged(WidgetRef ref, T item, bool isSelected) {
    final _selectedValues = ref.read(selectedValuesProvider.notifier).state;
    if (isSelected) {
      ref.read(selectedValuesProvider.notifier).state = [..._selectedValues]
        ..remove(item);
    } else {
      ref.read(selectedValuesProvider.notifier).state = [
        ..._selectedValues,
        item
      ];
    }
  }

  _onSave(BuildContext context, WidgetRef ref) {
    onSave(ref.read(selectedValuesProvider.notifier).state);
    Navigator.of(context).pop();
  }

  ref.read(selectedValuesProvider.notifier).state = selectedValues;

  if (isMaterial()) {
    showDialog(
      context: context,
      builder: (context) {
        return Consumer(builder: (context, ref, child) {
          final _selectedValues =
              ref.watch(selectedValuesProvider.notifier).state;
          return AlertDialog(
            title: Text(title),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (subtitle != null)
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                  for (T item in data)
                    CheckboxListTile(
                      contentPadding: EdgeInsets.zero,
                      title: itemBuilder(item),
                      value: _selectedValues.contains(item),
                      onChanged: (_) => _onChanged(
                        ref,
                        item,
                        _selectedValues.contains(item),
                      ),
                    ),
                ],
              ),
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
                onPressed: () => _onSave(context, ref),
                isDefaultAction: true,
              ),
            ],
          );
        });
      },
    );
  } else {
    showCupertinoModalBottomSheet(
      context: context,
      duration: Duration(milliseconds: 300),
      builder: (context) => Consumer(builder: (context, ref, child) {
        final appTheme = ref.watch(appThemeProvider);
        final _selectedValues =
            ref.watch(selectedValuesProvider.notifier).state;

        return PlatformModalScaffold(
          appBar: PlatformNavigationBar(
            title: title,
            leading: PlatformNavigationBarCloseButton(
              onPressed: () => Navigator.pop(context),
            ),
            trailing: PlatformNavigationBarButton(
              onPressed: () => _onSave(context, ref),
              buttonText: MaterialLocalizations.of(context).okButtonLabel,
            ),
          ),
          body: FormPage(
            children: [
              FormSection(
                children: data
                    .map((item) => PlatformListTile(
                          leading: itemBuilder(item),
                          trailing: Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: _selectedValues.contains(item)
                                ? Icon(
                                    PlatformIcons.checkmarkFill,
                                    size: 26,
                                    color: appTheme.primaryColor,
                                  )
                                : Icon(
                                    CupertinoIcons.circle,
                                    size: 26,
                                    color: Colors.grey.shade300,
                                  ),
                          ),
                          onTap: () => _onChanged(
                            ref,
                            item,
                            _selectedValues.contains(item),
                          ),
                        ))
                    .toList(),
                caption: subtitle,
              ),
            ],
          ),
        );
      }),
      useRootNavigator: true,
    );
  }
}
