part of 'extensions.dart';

extension StringX on String {
  String get initials {
    return trim().isEmpty
        ? ''
        : trim()
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
}
