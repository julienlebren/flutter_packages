part of 'extensions.dart';

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
}
