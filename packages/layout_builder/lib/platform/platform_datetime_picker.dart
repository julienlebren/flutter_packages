part of platform;

void showPlatformDatePicker(
  BuildContext context,
  WidgetRef ref, {
  required DateTime initialDate,
  required DateTime firstDate,
  required DateTime lastDate,
  required Function(DateTime newDate) onChanged,
}) async {
  if (isMaterial()) {
    final date = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    if (date != null) {
      onChanged(date);
    }
  } else {
    final dateProvider = StateProvider<DateTime>((_) => initialDate);

    showPlatformModalPopup(
      context: context,
      ref: ref,
      height: 200,
      onPressed: () {
        onChanged(
          ref.read(dateProvider),
        );
        Navigator.of(context, rootNavigator: true).pop();
      },
      child: CupertinoDatePicker(
        mode: CupertinoDatePickerMode.date,
        maximumDate: lastDate,
        minimumDate: firstDate,
        initialDateTime: initialDate,
        onDateTimeChanged: (value) {
          ref.read(dateProvider.notifier).state = value;
        },
      ),
    );
  }
}

void showPlatformTimePicker(
  BuildContext context,
  WidgetRef ref, {
  DateTime? initialDate,
  required Function(String time) onChanged,
}) async {
  /// We store the date in a final to workaround this issue:
  /// https://twitter.com/Hikeland/status/1395381430293876736
  final now = DateTime.now().add(const Duration(seconds: 1));

  if (isMaterial()) {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(initialDate ?? now),
    );
    if (time != null) {
      onChanged(time.format(context));
    }
  } else {
    final timeProvider = StateProvider<DateTime>((_) => initialDate ?? now);

    showPlatformModalPopup(
      context: context,
      ref: ref,
      height: 200,
      onPressed: () {
        onChanged(
          TimeOfDay.fromDateTime(ref.read(timeProvider)).format(context),
        );
        Navigator.of(context, rootNavigator: true).pop();
      },
      child: CupertinoDatePicker(
        mode: CupertinoDatePickerMode.time,
        maximumDate: now,
        minimumYear: now.year - 15,
        initialDateTime: initialDate ?? now,
        onDateTimeChanged: (value) {
          ref.read(timeProvider.notifier).state = value;
        },
      ),
    );
  }
}
