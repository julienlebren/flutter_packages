part of platform;

void showPlatformModalSheet({
  required BuildContext context,
  required WidgetRef ref,
  String? title,
  required List<PlatformModalSheetAction> actions,
}) {
  if (isCupertino()) {
    showCupertinoModalPopup(
      context: context,
      useRootNavigator: true,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: title != null ? Text(title) : null,
          actions: actions,
          cancelButton: CupertinoActionSheetAction(
            child: Text(
              MaterialLocalizations.of(context)
                  .cancelButtonLabel
                  .toLowerCase()
                  .capitalize(),
              style: TextStyle(
                fontSize: 19.0,
                fontWeight: FontWeight.w500,
                letterSpacing: -0.8,
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
    showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      builder: (BuildContext context) {
        return Container(
          //color: appTheme.scaffoldBackgroundColor,
          child: Wrap(
            children: <Widget>[
              if (title != null)
                Padding(
                  padding:
                      EdgeInsets.only(top: 16, left: 20, right: 20, bottom: 10),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              for (Widget widget in actions) widget,
              Container(height: 20),
            ],
          ),
        );
      },
    );
  }
}

class PlatformModalSheet
    extends PlatformWidgetBase<Container, CupertinoActionSheet> {
  const PlatformModalSheet({
    required this.title,
    required this.actions,
  }) : super();

  final String title;
  final List<PlatformModalSheetAction> actions;

  @override
  Container createMaterialWidget(BuildContext context, WidgetRef ref) {
    return Container(
      child: Wrap(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          for (Widget widget in actions) widget
        ],
      ),
    );
  }

  @override
  CupertinoActionSheet createCupertinoWidget(
      BuildContext context, WidgetRef ref) {
    return CupertinoActionSheet(
      title: Text(title),
      actions: actions,
    );
  }
}

class PlatformModalSheetAction
    extends PlatformWidgetBase<ListTile, CupertinoActionSheetAction> {
  const PlatformModalSheetAction({
    required this.title,
    this.icon,
    required this.onPressed,
    this.isDestructiveAction = false,
    this.isDefaultAction = false,
  }) : super();

  final String title;
  final IconData? icon;
  final VoidCallback onPressed;
  final bool isDestructiveAction;
  final bool isDefaultAction;

  @override
  ListTile createMaterialWidget(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: Icon(
        icon,
        color: isDestructiveAction ? Colors.red : null,
      ),
      title: Text(
        title,
        style: isDestructiveAction ? TextStyle(color: Colors.red) : null,
      ),
      onTap: () {
        Navigator.of(context).pop();
        onPressed.call();
      },
    );
  }

  @override
  CupertinoActionSheetAction createCupertinoWidget(
      BuildContext context, WidgetRef ref) {
    return CupertinoActionSheetAction(
      child: Text(
        title,
        style: TextStyle(
          fontSize: 19.0,
          letterSpacing: -0.8,
        ),
      ),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
        onPressed.call();
      },
      isDefaultAction: isDefaultAction,
      isDestructiveAction: isDestructiveAction,
    );
  }
}

void showPlatformModalPopup({
  required BuildContext context,
  required WidgetRef ref,
  required double height,
  String? title,
  VoidCallback? onPressed,
  required Widget child,
}) {
  final appTheme = ref.watch(appThemeProvider);
  final formTheme = ref.watch(formThemeProvider);
  showCupertinoModalPopup(
    context: context,
    builder: (context) {
      final safePadding = MediaQuery.of(context).padding.bottom;
      return Container(
        color: formTheme.rowBackgroundColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (onPressed != null || title != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (title != null) ...[
                    Container(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: appTheme.textColor,
                        ),
                      ),
                    ),
                  ],
                  Spacer(),
                  if (onPressed != null)
                    CupertinoButton(
                      child: Text(
                        MaterialLocalizations.of(context).okButtonLabel,
                      ),
                      onPressed: () {
                        onPressed.call();
                      },
                    ),
                ],
              ),
            ProviderScope(
              overrides: [
                formThemeProvider.overrideWithValue(
                  formTheme.copyWith(rowDividerPadding: 0),
                )
              ],
              child: FormRowDivider(),
            ),
            Container(
              height: height + safePadding,
              child: Align(
                alignment: Alignment.topRight,
                child: child,
              ),
            ),
          ],
        ),
      );
    },
  );
}
