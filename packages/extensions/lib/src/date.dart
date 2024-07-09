part of extensions;

extension DateTimeX on DateTime {
  String get toHour => DateFormat('Hm').format(this);

  String toLocaleShortDate(BuildContext context) =>
      DateFormat.yMd(Localizations.localeOf(context).toString()).format(this);

  String toLocaleDate(BuildContext context) =>
      DateFormat.yMMMMd(Localizations.localeOf(context).toString())
          .format(this);

  String toLocaleDateTime(BuildContext context) =>
      DateFormat.yMMMMEEEEd(Localizations.localeOf(context).toString())
          .format(this);

  String toLocaleTime(BuildContext context) =>
      DateFormat.Hms(Localizations.localeOf(context).toString()).format(this);

  String timeAgo(BuildContext context, WidgetRef ref) {
    Duration diff = DateTime.now().difference(this);
    final l10n = ref.read(extensionsLocalizationsProvider);

    if (diff.inDays >= 365) {
      return DateFormat.yMMMMd(Localizations.localeOf(context).toString())
          .format(this);
    } else if (diff.inDays >= 7) {
      return DateFormat.MMMMEEEEd(Localizations.localeOf(context).toString())
          .format(this);
    } else if (diff.inDays > 1) {
      return l10n.daysAgo(diff.inDays.toString());
    } else if (diff.inDays == 1) {
      return l10n.yesterday;
    } else if (diff.inHours > 1) {
      return l10n.hoursAgo(diff.inHours.toString());
    } else if (diff.inHours == 1) {
      return l10n.oneHourAgo;
    } else if (diff.inMinutes > 1) {
      return l10n.minutesAgo(diff.inMinutes.toString());
    } else if (diff.inMinutes == 1) {
      return l10n.oneMinuteAgo;
    } else {
      return l10n.justNow;
    }
  }
}
