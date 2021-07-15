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
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
    );
  }

  @override
  CupertinoTextField createCupertinoWidget(
      BuildContext context, WidgetRef ref) {
    return CupertinoTextField(
      enabled: enabled,
      padding: EdgeInsets.symmetric(vertical: 10),
      autocorrect: autocorrect,
      focusNode: focusNode,
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      textCapitalization: textCapitalization,
      placeholder: placeholder,
      decoration: null,
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
    );
  }
}
