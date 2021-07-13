import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layout_builder/platform/platform_widget_base.dart';

class PlatformIconButton
    extends PlatformWidgetBase<IconButton, CupertinoButton> {
  PlatformIconButton({
    required this.icon,
    this.onPressed,
  }) : super();
  final IconData icon;
  final VoidCallback? onPressed;

  @override
  IconButton createMaterialWidget(BuildContext context, WidgetRef ref) {
    return IconButton(
      icon: Icon(icon),
      onPressed: onPressed,
    );
  }

  @override
  CupertinoButton createCupertinoWidget(BuildContext context, WidgetRef ref) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      borderRadius: BorderRadius.circular(32.0),
      child: Icon(icon, size: 28),
    );
  }
}

class PlatformIconPlainButton
    extends PlatformWidgetBase<RawMaterialButton, CupertinoButton> {
  PlatformIconPlainButton({
    required this.icon,
    this.onPressed,
    this.backgroundColor = Colors.transparent,
    this.color = Colors.black,
  }) : super();
  final IconData icon;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color color;

  @override
  RawMaterialButton createMaterialWidget(BuildContext context, WidgetRef ref) {
    return RawMaterialButton(
      onPressed: onPressed,
      fillColor: backgroundColor,
      child: Icon(icon, color: color, size: 22),
      padding: EdgeInsets.all(5.0),
      shape: CircleBorder(),
    );
  }

  @override
  CupertinoButton createCupertinoWidget(BuildContext context, WidgetRef ref) {
    return CupertinoButton(
      color: backgroundColor,
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      borderRadius: BorderRadius.circular(26.0),
      child: Icon(icon, color: color, size: 26),
      minSize: 32,
    );
  }
}
