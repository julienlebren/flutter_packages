library selection_controls;

import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/src/rendering/editable.dart';
import 'package:flutter/widgets.dart';

import 'src/cupertino_text_selection.dart';
import 'src/material_text_selection.dart';

@immutable
class TextSelectionToolbarButton {
  const TextSelectionToolbarButton({
    required this.title,
    required this.onPressed,
  });
  final String title;
  final VoidCallback onPressed;
}

class CustomSelectionControls implements TextSelectionControls {
  static TextSelectionControls withButtons(
    List<TextSelectionToolbarButton> buttons,
  ) {
    if (Platform.isIOS || Platform.isMacOS) {
      return CupertinoTextSelectionControls(buttons: buttons);
    } else if (Platform.isAndroid || Platform.isFuchsia) {
      return MaterialTextSelectionControls(buttons: buttons);
    }
    throw UnimplementedError();
  }

  @override
  Widget buildHandle(BuildContext _, TextSelectionHandleType __, double ___,
      [VoidCallback? ____]) {
    throw UnimplementedError();
  }

  @override
  Widget buildToolbar(
      BuildContext _,
      Rect __,
      double ___,
      Offset ____,
      List<TextSelectionPoint> _____,
      TextSelectionDelegate ______,
      ValueListenable<ClipboardStatus>? _______,
      Offset? ________) {
    throw UnimplementedError();
  }

  @override
  bool canCopy(TextSelectionDelegate _) {
    throw UnimplementedError();
  }

  @override
  bool canCut(TextSelectionDelegate _) {
    throw UnimplementedError();
  }

  @override
  bool canPaste(TextSelectionDelegate _) {
    throw UnimplementedError();
  }

  @override
  bool canSelectAll(TextSelectionDelegate _) {
    throw UnimplementedError();
  }

  @override
  Offset getHandleAnchor(TextSelectionHandleType _, double __) {
    throw UnimplementedError();
  }

  @override
  Size getHandleSize(double _) {
    throw UnimplementedError();
  }

  @override
  void handleCopy(TextSelectionDelegate _, [ClipboardStatusNotifier? __]) {}

  @override
  void handleCut(TextSelectionDelegate _, [ClipboardStatusNotifier? __]) {}

  @override
  Future<void> handlePaste(TextSelectionDelegate _) {
    throw UnimplementedError();
  }

  @override
  void handleSelectAll(TextSelectionDelegate _) {}
}
