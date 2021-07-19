import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateTimeX on DateTime {
  String get toHour => DateFormat('Hm').format(this);

  String toLocaleDate(BuildContext context) =>
      DateFormat.yMMMMd(Localizations.localeOf(context).toString())
          .format(this);

  String toLocaleDateTime(BuildContext context) =>
      DateFormat.yMMMMEEEEd(Localizations.localeOf(context).toString())
          .format(this);
}
