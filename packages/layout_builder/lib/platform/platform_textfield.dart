part of platform;

class PlatformTextField
    extends PlatformWidgetBase<TextField, CupertinoTextField> {
  PlatformTextField({
    this.controller,
    this.focusNode,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.textCapitalization = TextCapitalization.sentences,
    this.autocorrect = true,
    this.placeholder,
    this.placeholderStyle,
    this.inputFormatters,
    this.onChanged,
    this.onSubmitted,
    this.enabled = true,
    this.decoration,
    this.maxLines = 1,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final bool autocorrect;
  final String? placeholder;
  final TextStyle? placeholderStyle;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final bool enabled;
  final BoxDecoration? decoration;
  final int maxLines;

  @override
  TextField createMaterialWidget(BuildContext context, WidgetRef ref) {
    return TextField(
      enabled: enabled,
      focusNode: focusNode,
      autocorrect: autocorrect,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      textCapitalization: textCapitalization,
      controller: controller,
      decoration: InputDecoration(
        hintText: placeholder,
        /*border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,*/
      ),
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      maxLines: maxLines,
    );
  }

  @override
  CupertinoTextField createCupertinoWidget(
      BuildContext context, WidgetRef ref) {
    return CupertinoTextField(
      enabled: enabled,
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: decoration != null ? 5 : 0,
      ),
      autocorrect: autocorrect,
      focusNode: focusNode,
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      textCapitalization: textCapitalization,
      placeholder: placeholder,
      decoration: decoration,
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      maxLines: maxLines,
    );
  }
}

const BorderSide kDefaultRoundedBorderSide = BorderSide(
  color: CupertinoDynamicColor.withBrightness(
    color: Color(0x33000000),
    darkColor: Color(0x33FFFFFF),
  ),
  style: BorderStyle.solid,
  width: 0.0,
);

const Border kDefaultRoundedBorder = Border(
  top: kDefaultRoundedBorderSide,
  bottom: kDefaultRoundedBorderSide,
  left: kDefaultRoundedBorderSide,
  right: kDefaultRoundedBorderSide,
);

const BoxDecoration kDefaultRoundedBorderDecoration = BoxDecoration(
  color: CupertinoDynamicColor.withBrightness(
    color: CupertinoColors.white,
    darkColor: CupertinoColors.black,
  ),
  border: kDefaultRoundedBorder,
  borderRadius: BorderRadius.all(Radius.circular(5.0)),
);
