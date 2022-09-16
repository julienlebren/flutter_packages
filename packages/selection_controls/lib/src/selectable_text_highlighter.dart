// ignore_for_file: library_private_types_in_public_api

part of selection_controls;

class HighlightedOffset {
  int start;
  int end;
  String highlightedText;
  HighlightedOffset(this.start, this.end, this.highlightedText);
}

typedef OnHighlightedCallback = void Function(
    List<HighlightedOffset> updatedHighlightedOffsetsList);

class SelectableHighlighterText extends StatefulWidget {
  final String text;
  final TextStyle? unHighlightedStyle;
  final TextStyle? highlightedStyle;
  final ToolbarOptions? toolbarOptions;
  final List<HighlightedOffset>? preHighlightedTexts;
  final OnHighlightedCallback? onHighlightedCallback;

  const SelectableHighlighterText(
      {Key? key,
      required this.text,
      this.toolbarOptions,
      this.unHighlightedStyle,
      this.highlightedStyle,
      this.preHighlightedTexts,
      this.onHighlightedCallback})
      : super(key: key);

  @override
  _SelectableHighlighterTextState createState() =>
      _SelectableHighlighterTextState();
}

class _SelectableHighlighterTextState extends State<SelectableHighlighterText> {
  int tempBaseOffset = 0;
  int tempExtentOffset = 0;
  List<HighlightedOffset> offsets = [];

  late TextStyle unHighlightedTextStyle;
  late TextStyle highlightedTextStyle;

  @override
  void initState() {
    offsets = widget.preHighlightedTexts ?? offsets;
    unHighlightedTextStyle = widget.unHighlightedStyle ??
        const TextStyle(color: Colors.black, fontSize: 16);
    highlightedTextStyle = widget.highlightedStyle ??
        const TextStyle(color: Colors.blue, fontSize: 16);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SelectableText.rich(
      TextSpan(
        children: textSpanList(),
      ),
      onSelectionChanged: (value, reason) {
        tempBaseOffset = min(value.baseOffset, value.extentOffset);
        tempExtentOffset = max(value.baseOffset, value.extentOffset);
      },
      toolbarOptions: widget.toolbarOptions,
      selectionControls: CupertinoTextSelectionControls(onHighlight: () {
        setState(() {
          offsets.add(HighlightedOffset(tempBaseOffset, tempExtentOffset,
              widget.text.substring(tempBaseOffset, tempExtentOffset)));
          minimize(offsets);
        });
        if (widget.onHighlightedCallback != null) {
          widget.onHighlightedCallback!(offsets);
        }
      }),
    );
  }

  void minimize(List<HighlightedOffset> list) {
    list.sort((a, b) => a.start.compareTo(b.start));
    List<HighlightedOffset> stack = [];
    for (var i in list) {
      if (stack.isEmpty) {
        stack.add(i);
      } else {
        HighlightedOffset top = stack.last;
        if (top.end < i.start) {
          stack.add(i);
        } else if (top.end < i.end) {
          top.end = i.end;
          stack.removeLast();
          stack.add(top);
        }
      }
    }
    offsets = stack;
  }

  List<TextSpan> textSpanList() {
    List<TextSpan> list = [];
    if (offsets.isEmpty) {
      return [TextSpan(text: widget.text, style: unHighlightedTextStyle)];
    }
    list.add(TextSpan(
        text: widget.text.substring(0, offsets.first.start),
        style: unHighlightedTextStyle));

    for (int i = 0; i < offsets.length; i++) {
      HighlightedOffset element = offsets[i];
      if (i == 0) {
        list.add(TextSpan(
            text: widget.text.substring(element.start, element.end),
            style: highlightedTextStyle));
      } else {
        list.add(TextSpan(
          text: widget.text.substring(offsets[i - 1].end, element.start),
          style: unHighlightedTextStyle,
        ));
        list.add(TextSpan(
            text: widget.text.substring(element.start, element.end),
            style: highlightedTextStyle));
      }
    }

    list.add(TextSpan(
        text: widget.text.substring(offsets.last.end, widget.text.length),
        style: unHighlightedTextStyle));
    return list;
  }
}
