library platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:layout_builder/form/form.dart';
import 'package:layout_builder/theme/theme.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:numberpicker/numberpicker.dart';

part 'platform_activity_indicator.dart';
part 'platform_alert_dialog.dart';
part 'platform_app.dart';
part 'platform_datetime_picker.dart';
part 'platform_elevated_button.dart';
part 'platform_icon_button.dart';
part 'platform_icons.dart';
part 'platform_list_tile.dart';
part 'platform_list_view.dart';
part 'platform_modal_page.dart';
part 'platform_modal_sheet.dart';
part 'platform_multi_picker.dart';
part 'platform_navigation_bar_button.dart';
part 'platform_navigation_bar.dart';
part 'platform_number_picker.dart';
part 'platform_page.dart';
part 'platform_popup_menu.dart';
part 'platform_route.dart';
part 'platform_scaffold.dart';
part 'platform_search_bar.dart';
part 'platform_single_picker.dart';
part 'platform_social_button.dart';
part 'platform_switch.dart';
part 'platform_tab_navigator.dart';
part 'platform_tab_scaffold.dart';
part 'platform_text_button.dart';
part 'platform_textfield.dart';
part 'platform_textstyle.dart';
part 'platform_widget_base.dart';
part 'platform.freezed.dart';

bool isMaterial() {
  return defaultTargetPlatform == TargetPlatform.android;
}

bool isCupertino() {
  return defaultTargetPlatform == TargetPlatform.iOS;
}
