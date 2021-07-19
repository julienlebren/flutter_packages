part of platform;

class PlatformListTile extends PlatformWidgetBase<Material, CupertinoListTile> {
  const PlatformListTile({
    this.child,
    this.leading,
    this.label,
    this.caption,
    this.value,
    this.trailing,
    this.onTap,
  }) : super();

  final Widget? child;
  final Widget? leading;
  final Widget? trailing;
  final String? label;
  final String? caption;
  final String? value;
  final VoidCallback? onTap;

  @override
  Material createMaterialWidget(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(appThemeProvider);
    return Material(
      color: appTheme.listTileBackground,
      child: InkWell(
        highlightColor: appTheme.selectedColor,
        splashColor: appTheme.selectedColor,
        splashFactory: InkRipple.splashFactory,
        onTap: onTap,
        child: ListTileContents(
          child: child,
          leading: leading,
          label: label,
          caption: caption,
          value: value,
          trailing: trailing,
          onTap: onTap,
        ),
      ),
    );
  }

  @override
  CupertinoListTile createCupertinoWidget(BuildContext context, WidgetRef ref) {
    return CupertinoListTile(
      child: ListTileContents(
        child: child,
        leading: leading,
        label: label,
        caption: caption,
        value: value,
        trailing: trailing,
        onTap: onTap,
      ),
      onTap: onTap,
    );
  }
}

class CupertinoListTile extends ConsumerStatefulWidget {
  const CupertinoListTile({
    required this.child,
    this.onTap,
  }) : super();

  final Widget child;
  final VoidCallback? onTap;

  @override
  _CupertinoListTileState createState() => _CupertinoListTileState();
}

class _CupertinoListTileState extends ConsumerState<CupertinoListTile> {
  late Color _tileBackground;

  @override
  void initState() {
    super.initState();
    _tileBackground = ref.read(appThemeProvider).listTileBackground;
  }

  void _handleTapDown(TapDownDetails details) {
    _updateHighlight(true);
  }

  void _handleTapUp(TapUpDetails? details) {
    _updateHighlight(false);
  }

  void _handleTap() {
    _updateHighlight(true);
    widget.onTap!();
    Future.delayed(Duration(milliseconds: 200), () {
      _updateHighlight(false);
    });
  }

  void _handleTapCancel() {
    _updateHighlight(false);
  }

  void _updateHighlight(bool isPressed) {
    final appTheme = ref.watch(appThemeProvider);
    setState(() {
      _tileBackground =
          (isPressed ? appTheme.selectedColor : appTheme.listTileBackground);
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<Color>(
        appThemeProvider.select((appTheme) => appTheme.listTileBackground),
        (listTileBackground) {
      setState(() {
        _tileBackground = listTileBackground;
      });
    });
    if (widget.onTap != null) {
      return GestureDetector(
        onTapDown: _handleTapDown,
        onTapUp: _handleTapUp,
        onTap: _handleTap,
        onTapCancel: _handleTapCancel,
        child: _buildContents(context),
      );
    } else {
      return _buildContents(context);
    }
  }

  Widget _buildContents(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 48.0,
      ),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        color: _tileBackground,
        child: widget.child,
      ),
    );
  }
}

class ListTileContents extends ConsumerWidget {
  const ListTileContents({
    this.child,
    this.leading,
    this.label,
    this.caption,
    this.value,
    this.trailing,
    this.onTap,
  }) : super();

  final Widget? child;
  final Widget? leading;
  final Widget? trailing;
  final String? label;
  final String? caption;
  final String? value;
  final VoidCallback? onTap;

  CrossAxisAlignment get alignment {
    if (leading == null && label == null && trailing == null) {
      return CrossAxisAlignment.center;
    } else {
      return CrossAxisAlignment.center; // was start but dunno why
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(appThemeProvider);
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 48.0,
      ),
      child: Container(
        padding: EdgeInsets.only(top: 8, bottom: 8, left: 15, right: 8),
        child: child ??
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (leading != null)
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: leading!,
                  ),
                if (label != null)
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: alignment,
                      children: [
                        Text(
                          label!,
                          style: TextStyle(
                            color: appTheme.textColor,
                            fontSize: isCupertino() ? 17 : 16,
                          ),
                        ),
                        if (caption != null)
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              caption!,
                              style: TextStyle(
                                  color: Colors.grey.shade600, fontSize: 13),
                              textAlign: TextAlign.left,
                            ),
                          ),
                      ],
                    ),
                  ),
                if (value != null)
                  Padding(
                    padding: EdgeInsets.only(right: 7),
                    child: Text(
                      value!,
                      style: TextStyle(
                        fontSize: isCupertino() ? 17 : 16,
                        color: isMaterial() && label != null
                            ? appTheme.primaryColor
                            : appTheme.textColor,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                if (trailing != null) trailing!
              ],
            ),
      ),
    );
  }
}

class PlatformDisclosureIndicator extends PlatformWidgetBase<SizedBox, Icon> {
  const PlatformDisclosureIndicator() : super();

  @override
  SizedBox createMaterialWidget(BuildContext context, WidgetRef ref) {
    return SizedBox.shrink();
  }

  @override
  Icon createCupertinoWidget(BuildContext context, WidgetRef ref) {
    return Icon(
      CupertinoIcons.chevron_right,
      size: 22,
      color: Colors.grey,
    );
  }
}

class PlatformSelectedIndicator extends ConsumerWidget {
  const PlatformSelectedIndicator(this.isSelected) : super();

  final bool isSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(appThemeProvider);
    if (isSelected) {
      return Icon(PlatformIcons.checkmark, color: appTheme.primaryColor);
    } else {
      return SizedBox.shrink();
    }
  }
}
