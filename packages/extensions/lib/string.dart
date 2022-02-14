part of 'extensions.dart';

extension StringX on String {
  String get initials {
    return trim().isEmpty
        ? ''
        : trim()
            .toUpperCase()
            .replaceAll(RegExp(' +'), ' ')
            .split(' ')
            .map((l) => l[0])
            .take(3)
            .join();
  }

  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  DateTime get hourToDate => DateFormat('Hm').parse(this);

  String get onlyDigits => this.replaceAll("\\D+", "");

  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}
