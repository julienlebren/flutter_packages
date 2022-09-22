library selection_controls;

import 'dart:io' show Platform;

import 'package:flutter/rendering.dart';
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

class CustomTextSelectionControls extends TextSelectionControls {
  CustomTextSelectionControls({
    this.buttons = const [],
  }) : handle = defaultHandle;

  final TextSelectionControls handle;
  List<TextSelectionToolbarButton> buttons;

  static TextSelectionControls get defaultHandle {
    if (Platform.isIOS || Platform.isMacOS) {
      return CupertinoTextSelectionControls();
    } else if (Platform.isAndroid || Platform.isFuchsia) {
      return MaterialTextSelectionControls();
    }
    throw UnimplementedError();
  }

  @override
  bool canSelectAll(TextSelectionDelegate delegate) {
    // Android allows SelectAll when selection is not collapsed, unless
    // everything has already been selected.
    final TextEditingValue value = delegate.textEditingValue;
    return delegate.selectAllEnabled &&
        value.text.isNotEmpty &&
        !(value.selection.start == 0 &&
            value.selection.end == value.text.length);
  }

  /// Returns the size of the Material handle.
  @override
  Size getHandleSize(double textLineHeight) =>
      handle.getHandleSize(textLineHeight);

  /// Builder for material-style text selection handles.
  @override
  Widget buildHandle(
    BuildContext context,
    TextSelectionHandleType type,
    double textLineHeight, [
    VoidCallback? onTap,
  ]) {
    return handle.buildHandle(context, type, textLineHeight, onTap);
  }

  /// Gets anchor for material-style text selection handles.
  ///
  /// See [TextSelectionControls.getHandleAnchor].
  @override
  Offset getHandleAnchor(TextSelectionHandleType type, double textLineHeight) {
    return handle.getHandleAnchor(type, textLineHeight);
  }

  @override
  Widget buildToolbar(
    BuildContext context,
    Rect globalEditableRegion,
    double textLineHeight,
    Offset position,
    List<TextSelectionPoint> endpoints,
    TextSelectionDelegate delegate,
    ClipboardStatusNotifier? clipboardStatus,
    Offset? lastSecondaryTapDownPosition,
  ) {
    return handle.buildToolbar(
      context,
      globalEditableRegion,
      textLineHeight,
      position,
      endpoints,
      delegate,
      clipboardStatus,
      lastSecondaryTapDownPosition,
    );
  }
}
