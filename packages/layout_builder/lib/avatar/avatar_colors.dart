part of 'avatar.dart';

class AvatarColors {
  static Color get avatar0 => Color(0xFFF4C946);
  static Color get avatar1 => Color(0xFF3671F5);
  static Color get avatar2 => Color(0xFF52AF9B);
  static Color get avatar3 => Color(0xFFBF3B27);
  static Color get avatar4 => Color(0xFFDB89E8);
  static Color get avatar5 => Color(0xFF5BBFE8);
  static Color get avatar6 => Color(0xFF5BB340);
  static Color get avatar7 => Color(0xFF8E6BE7);
  static Color get avatar8 => Color(0xFFF4C946);
  static Color get avatar9 => Color(0xFF71819C);

  static Color fromIndex(int index) {
    switch (index) {
      case 1:
        return avatar1;
      case 2:
        return avatar2;
      case 3:
        return avatar3;
      case 4:
        return avatar4;
      case 5:
        return avatar5;
      case 6:
        return avatar6;
      case 7:
        return avatar7;
      case 8:
        return avatar8;
      case 9:
        return avatar9;
      default:
        return avatar0;
    }
  }

  static int get random {
    Random random = Random();
    return random.nextInt(10);
  }
}
