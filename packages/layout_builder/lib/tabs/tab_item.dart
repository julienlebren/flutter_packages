import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tab_item.freezed.dart';

@freezed
class TabItem with _$TabItem {
  factory TabItem({
    required String title,
    required IconData icon,
    required IconData selectedIcon,
    required Widget router,
  }) = _TabItem;
}
