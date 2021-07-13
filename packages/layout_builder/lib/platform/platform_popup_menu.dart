import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layout_builder/platform/platform.dart';
import 'package:layout_builder/platform/platform_icon_button.dart';
import 'package:layout_builder/platform/platform_widget_base.dart';

const TextStyle _cupertinoActionSheetTextStyle = TextStyle(
  fontSize: 19.0,
  letterSpacing: -0.8,
);

class PlatformPopupMenuItem {
  PlatformPopupMenuItem({
    this.icon,
    required this.title,
    required this.value,
  });

  final IconData? icon;
  final String title;
  final dynamic value;
}

void showPlatformPopupMenu({
  required BuildContext context,
  required WidgetRef ref,
  required String title,
  required List<PlatformPopupMenuItem> items,
  required void Function(dynamic) onPressed,
}) {
  if (isCupertino()) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: Text(title),
          actions: [
            for (PlatformPopupMenuItem item in items)
              CupertinoActionSheetAction(
                child: Text(
                  item.title,
                  style: _cupertinoActionSheetTextStyle,
                ),
                onPressed: () => onPressed(item.value),
              ),
          ],
          cancelButton: CupertinoActionSheetAction(
            child: Text(
              MaterialLocalizations.of(context).cancelButtonLabel,
              style: _cupertinoActionSheetTextStyle.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  } else {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(1000.0, 0.0, 0.0, 0.0),
      items: [
        for (PlatformPopupMenuItem item in items)
          PopupMenuItem(
            value: item.value,
            child: ListTile(
              leading: item.icon != null ? Icon(item.icon) : null,
              title: Text(item.title),
            ),
          ),
      ],
    );
  }
}

class PlatformPopupMenu<T>
    extends PlatformWidgetBase<PopupMenuButton, CupertinoButton> {
  PlatformPopupMenu({
    this.title,
    required this.items,
    required this.onPressed,
    required this.icon,
    required this.backgroundColor,
    required this.color,
  });

  final String? title;
  final List<PlatformPopupMenuItem> items;
  final void Function(dynamic) onPressed; // for Android only
  final IconData icon;
  final Color backgroundColor;
  final Color color;

  @override
  PopupMenuButton createMaterialWidget(BuildContext context, WidgetRef ref) {
    return PopupMenuButton<T>(
      child: PlatformIconPlainButton(
        icon: icon,
        color: color,
        backgroundColor: backgroundColor,
      ),
      onSelected: onPressed,
      itemBuilder: (BuildContext context) => [
        for (PlatformPopupMenuItem item in items)
          PopupMenuItem(
            value: item.value,
            child: ListTile(
              leading: item.icon != null ? Icon(item.icon) : null,
              title: Text(item.title),
            ),
          ),
      ],
    );
  }

  @override
  CupertinoButton createCupertinoWidget(BuildContext context, WidgetRef ref) {
    return CupertinoButton(
      color: backgroundColor,
      padding: EdgeInsets.zero,
      borderRadius: BorderRadius.circular(26.0),
      child: Icon(icon, color: color, size: 26),
      minSize: 32,
      onPressed: () {
        showCupertinoModalPopup(
          context: context,
          builder: (BuildContext context) {
            return CupertinoActionSheet(
              title: title != null ? Text(title!) : null,
              actions: [
                for (PlatformPopupMenuItem item in items)
                  CupertinoActionSheetAction(
                    child: Text(
                      item.title,
                      style: _cupertinoActionSheetTextStyle,
                    ),
                    onPressed: () => onPressed(item.value),
                  ),
              ],
              cancelButton: CupertinoActionSheetAction(
                child: Text(
                  MaterialLocalizations.of(context).cancelButtonLabel,
                  style: _cupertinoActionSheetTextStyle.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            );
          },
        );
      },
    );
  }
}
