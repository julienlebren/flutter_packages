import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layout_builder/platform/platform_widget_base.dart';

class PlatformSwitch extends PlatformWidgetBase<Switch, CupertinoSwitch> {
  const PlatformSwitch({
    required this.value,
    required this.onChanged,
  }) : super();

  final bool value;
  final ValueChanged<bool>? onChanged;

  @override
  Switch createMaterialWidget(BuildContext context, WidgetRef ref) {
    return Switch(
      value: value,
      onChanged: onChanged,
    );
  }

  @override
  CupertinoSwitch createCupertinoWidget(BuildContext context, WidgetRef ref) {
    return CupertinoSwitch(
      value: value,
      onChanged: onChanged,
    );
  }
}
