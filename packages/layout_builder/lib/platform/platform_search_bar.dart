part of platform;

class PlatformSearchBar extends PlatformWidgetBase<TextField, Container> {
  PlatformSearchBar({
    required this.controller,
    this.focusNode,
    this.placeholder,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final String? placeholder;

  @override
  TextField createMaterialWidget(BuildContext context, WidgetRef ref) {
    return TextField(
      style: TextStyle(fontSize: 18),
      focusNode: focusNode,
      controller: controller,
      decoration: InputDecoration(
        hintText: placeholder,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        suffixIcon: Container(
          //transform: Matrix4.translationValues(10.0, 0.0, 0.0),
          child: IconButton(
            onPressed: () => controller.clear(),
            icon: Icon(Icons.clear, color: Colors.black, size: 24),
          ),
        ),
      ),
    );
  }

  @override
  Container createCupertinoWidget(BuildContext context, WidgetRef ref) {
    final searchBarRadius = ref.watch(appThemeProvider.select(
      (theme) => theme.searchBarRadius,
    ));

    return Container(
      color: CupertinoTheme.of(context).barBackgroundColor,
      padding: EdgeInsets.only(
        left: 15,
        right: 15,
        bottom: 10,
      ),
      child: CupertinoSearchTextField(
        borderRadius: BorderRadius.circular(searchBarRadius),
        controller: controller,
        focusNode: focusNode,
        placeholder: placeholder,
      ),
    );
  }
}
