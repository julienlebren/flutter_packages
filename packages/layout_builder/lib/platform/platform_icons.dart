part of platform;

class PlatformIcons {
  PlatformIcons._();

  static IconData get back =>
      isMaterial() ? Icons.arrow_back : CupertinoIcons.chevron_back;
  static IconData get more =>
      isMaterial() ? Icons.more_vert : CupertinoIcons.ellipsis;
  static IconData get chatBubble => isMaterial()
      ? Icons.forum_outlined
      : CupertinoIcons.bubble_left_bubble_right;

  static IconData get post =>
      isMaterial() ? Icons.create : CupertinoIcons.square_pencil;
  static IconData get addPerson =>
      isMaterial() ? Icons.person_add_alt : CupertinoIcons.person_badge_plus;
  static IconData get settings =>
      isMaterial() ? Icons.tune : CupertinoIcons.slider_horizontal_3;
  static IconData get qrCode =>
      isMaterial() ? Icons.qr_code : CupertinoIcons.qrcode;
  static IconData get people =>
      isMaterial() ? Icons.people_alt : CupertinoIcons.person_2_alt;

  static IconData get checkmark =>
      isMaterial() ? Icons.check : CupertinoIcons.check_mark;
  static IconData get checkmarkFill =>
      isMaterial() ? Icons.check_circle : CupertinoIcons.checkmark_circle_fill;

  static IconData get classesTab =>
      isMaterial() ? Icons.article_outlined : CupertinoIcons.person_2;
  static IconData get classesTabSelected =>
      isMaterial() ? Icons.article : CupertinoIcons.person_2_fill;
  static IconData get chatsTab => isMaterial()
      ? Icons.forum_outlined
      : CupertinoIcons.bubble_left_bubble_right;
  static IconData get chatsTabSelected => isMaterial()
      ? Icons.forum_rounded
      : CupertinoIcons.bubble_left_bubble_right_fill;
  static IconData get calendarTab =>
      isMaterial() ? Icons.calendar_today_outlined : CupertinoIcons.calendar;
  static IconData get calendarTabSelected =>
      isMaterial() ? Icons.calendar_today : CupertinoIcons.calendar;
  static IconData get settingsTab =>
      isMaterial() ? Icons.tune : CupertinoIcons.slider_horizontal_3;
  static IconData get settingsTabSelected =>
      isMaterial() ? Icons.tune : CupertinoIcons.slider_horizontal_3;

  static IconData get person => isMaterial()
      ? Icons.person_outline
      : CupertinoIcons.person_alt_circle_fill;

  static IconData get filterList => isMaterial()
      ? Icons.filter_list
      : CupertinoIcons.line_horizontal_3_decrease;

  static IconData get qrCodeScanner =>
      isMaterial() ? Icons.qr_code_scanner : CupertinoIcons.qrcode_viewfinder;
  static IconData get add => isMaterial() ? Icons.add : CupertinoIcons.plus;

  static IconData get account => isMaterial()
      ? Icons.person_outline_rounded
      : CupertinoIcons.person_crop_square_fill;
  static IconData get phone =>
      isMaterial() ? Icons.phone_outlined : CupertinoIcons.phone_fill;
  static IconData get subscription => isMaterial()
      ? CupertinoIcons.circle_grid_hex_fill
      : CupertinoIcons.circle_grid_hex;
  static IconData get privacy =>
      isMaterial() ? Icons.lock_outlined : CupertinoIcons.lock_fill;
  static IconData get notifications =>
      isMaterial() ? Icons.notifications_outlined : CupertinoIcons.bell_fill;
  static IconData get disturb =>
      isMaterial() ? Icons.bedtime_outlined : CupertinoIcons.moon_stars;
  static IconData get backArrow =>
      isMaterial() ? Icons.arrow_back : CupertinoIcons.chevron_left;

  static IconData get heart =>
      isMaterial() ? Icons.favorite_outlined : CupertinoIcons.suit_heart;
  static IconData get heartFill =>
      isMaterial() ? Icons.favorite : CupertinoIcons.suit_heart_fill;

  static IconData get share =>
      isMaterial() ? Icons.more_vert : CupertinoIcons.square_arrow_up;
}
