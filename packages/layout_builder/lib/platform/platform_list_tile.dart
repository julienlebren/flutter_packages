part of platform;

class PlatformListTile
    extends PlatformWidgetBase<Material, _CupertinoListTile, Material> {
  const PlatformListTile({
    this.child,
    this.leading,
    this.label,
    this.extraLabel,
    this.caption,
    this.value,
    this.trailing,
    this.onTap,
    Key? key,
  }) : super();

  final Widget? child;
  final Widget? leading;
  final Widget? trailing;
  final String? label;
  final Widget? extraLabel;
  final dynamic caption;
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
          extraLabel: extraLabel,
          caption: caption,
          value: value,
          trailing: trailing,
          onTap: onTap,
        ),
      ),
    );
  }

  @override
  _CupertinoListTile createCupertinoWidget(
      BuildContext context, WidgetRef ref) {
    return _CupertinoListTile(
      child: ListTileContents(
        child: child,
        leading: leading,
        label: label,
        extraLabel: extraLabel,
        caption: caption,
        value: value,
        trailing: trailing,
        onTap: onTap,
      ),
      onTap: onTap,
    );
  }

  @override
  Material createWebWidget(BuildContext context, WidgetRef ref) =>
      createMaterialWidget(context, ref);
}

class _CupertinoListTile extends ConsumerStatefulWidget {
  const _CupertinoListTile({
    required this.child,
    this.onTap,
  }) : super();

  final Widget child;
  final VoidCallback? onTap;

  @override
  _CupertinoListTileState createState() => _CupertinoListTileState();
}

class _CupertinoListTileState extends ConsumerState<_CupertinoListTile> {
  late Color _tileBackground;
  Timer? timer;

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
    timer = Timer(Duration(milliseconds: 200), () {
      _updateHighlight(false);
    });
  }

  void _handleTapCancel() {
    _updateHighlight(false);
  }

  void _updateHighlight(bool isPressed) {
    final appTheme = ref.read(appThemeProvider);
    setState(() {
      _tileBackground =
          (isPressed ? appTheme.selectedColor : appTheme.listTileBackground);
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<Color>(
        appThemeProvider.select((appTheme) => appTheme.listTileBackground),
        (_, listTileBackground) {
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

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}

class ListTileContents extends ConsumerWidget {
  const ListTileContents({
    this.child,
    this.leading,
    this.label,
    this.extraLabel,
    this.caption,
    this.value,
    this.trailing,
    this.onTap,
  }) : super();

  final Widget? child;
  final Widget? leading;
  final Widget? trailing;
  final String? label;
  final Widget? extraLabel;
  final dynamic caption;
  final String? value;
  final VoidCallback? onTap;

  CrossAxisAlignment get alignment {
    if (leading == null && label == null && trailing == null) {
      return CrossAxisAlignment.center;
    } else {
      return CrossAxisAlignment.start;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(appThemeProvider);
    final listTheme = ref.watch(listViewThemeProvider);

    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 48.0,
      ),
      child: Container(
        padding: EdgeInsets.only(left: 15, right: 8),
        child: child != null
            ? Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: child!,
              )
            : Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (leading != null)
                    Padding(
                      padding: EdgeInsets.only(top: 8, bottom: 8, right: 10),
                      child: leading!,
                    ),
                  if (label != null)
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: alignment,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 3, right: 5),
                              child: (() {
                                if (extraLabel == null) {
                                  return PlatformListTileLabel(
                                    value: label!,
                                    listTheme: listTheme,
                                  );
                                } else {
                                  return Row(
                                    children: [
                                      PlatformListTileLabel(
                                        value: label!,
                                        listTheme: listTheme,
                                      ),
                                      const SizedBox(width: 8),
                                      extraLabel!,
                                    ],
                                  );
                                }
                              })(),
                            ),
                            if (caption != null)
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 5),
                                child: (() {
                                  if (caption is Widget) {
                                    return caption;
                                  } else if (caption is String) {
                                    return PlatformListTileCaption(
                                      value: caption!,
                                      listTheme: listTheme,
                                    );
                                  }
                                })(),
                              ),
                          ],
                        ),
                      ),
                    ),
                  if (value !=
                      null) // Removing Expanded for Settings view, dunno why I added Expanded
                    Padding(
                      padding: EdgeInsets.only(right: 7),
                      child: Text(
                        value!,
                        style: TextStyle(
                          fontSize: isCupertino() ? 17 : 16,
                          letterSpacing: isCupertino() ? -0.5 : 0,
                          color: isMaterial() && label != null
                              ? (listTheme.valueColorEnforced
                                  ? listTheme.valueColor
                                  : appTheme.primaryColor)
                              : (label != null
                                  ? listTheme.valueColor
                                  : listTheme.labelColor),
                        ),
                        textAlign:
                            label != null ? TextAlign.right : TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  if (trailing != null) trailing!
                ],
              ),
      ),
    );
  }
}

class PlatformListTileLabel extends StatelessWidget {
  const PlatformListTileLabel({
    required this.value,
    required this.listTheme,
    Key? key,
  }) : super(key: key);

  final String value;
  final ListViewTheme listTheme;

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: TextStyle(
        color: listTheme.labelColor,
        fontSize: listTheme.labelFontSize,
        letterSpacing: isCupertino() ? -0.5 : 0,
      ),
      maxLines: listTheme.labelMaxLines,
      overflow: listTheme.labelMaxLines != null ? TextOverflow.ellipsis : null,
    );
  }
}

class PlatformListTileCaption extends StatelessWidget {
  const PlatformListTileCaption({
    required this.value,
    required this.listTheme,
    Key? key,
  }) : super(key: key);

  final String value;
  final ListViewTheme listTheme;

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: TextStyle(
        color: listTheme.captionColor,
        fontSize: listTheme.captionFontSize,
        letterSpacing: isCupertino() ? -0.5 : 0,
      ),
      textAlign: TextAlign.left,
      maxLines: listTheme.captionMaxLines,
      overflow:
          listTheme.captionMaxLines != null ? TextOverflow.ellipsis : null,
    );
  }
}

class PlatformDisclosureIndicator
    extends PlatformWidgetBase<SizedBox, Icon, SizedBox> {
  const PlatformDisclosureIndicator() : super();

  @override
  SizedBox createMaterialWidget(BuildContext context, WidgetRef ref) {
    return SizedBox.shrink();
  }

  @override
  Icon createCupertinoWidget(BuildContext context, WidgetRef ref) {
    final color = ref.watch(appThemeProvider.select(
      (theme) => theme.disclosureIndicatorColor,
    ));
    return Icon(
      CupertinoIcons.chevron_right,
      size: 22,
      color: color,
    );
  }

  @override
  SizedBox createWebWidget(BuildContext context, WidgetRef ref) =>
      createMaterialWidget(context, ref);
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
