part of platform;

Future<bool?> showAlertDialog(
  BuildContext context,
  WidgetRef ref, {
  required String title,
  Widget? child,
  String? content,
  List<PlatformDialogAction>? actions,
  bool displayCancelButton = true,
}) {
  if (isMaterial()) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: child != null
            ? Padding(padding: EdgeInsets.only(top: 6), child: child)
            : (content != null ? Text(content) : null),
        actions: <Widget>[
          if (displayCancelButton)
            TextButton(
              child: Text(MaterialLocalizations.of(context)
                  .cancelButtonLabel
                  .toUpperCase()),
              onPressed: () => Navigator.of(context).pop(false),
            ),
          if (actions != null) ...actions,
        ],
      ),
    );
  }
  return showCupertinoDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: Text(title),
      content: child ?? (content != null ? Text(content) : null),
      actions: <Widget>[
        if (displayCancelButton)
          CupertinoDialogAction(
            child: Text(MaterialLocalizations.of(context)
                .cancelButtonLabel
                .toLowerCase()
                .capitalize()),
            onPressed: () => Navigator.of(context).pop(false),
          ),
        if (actions != null) ...actions,
      ],
    ),
  );
}

class PlatformDialogAction
    extends PlatformWidgetBase<TextButton, CupertinoDialogAction> {
  PlatformDialogAction({
    required this.buttonText,
    this.onPressed,
    this.isDestructiveAction = false,
    this.isDefaultAction = false,
  });

  final String buttonText;
  final VoidCallback? onPressed;
  final bool isDestructiveAction;
  final bool isDefaultAction;

  @override
  TextButton createMaterialWidget(BuildContext context, WidgetRef ref) {
    return TextButton(
      child: Text(
        buttonText.toUpperCase(),
        style: TextStyle(
          fontSize: 15,
          fontWeight: isDefaultAction ? FontWeight.bold : FontWeight.normal,
          color:
              isDestructiveAction ? Colors.red : Theme.of(context).primaryColor,
        ),
        textAlign: TextAlign.right,
      ),
      onPressed: () {
        onPressed?.call();
      },
    );
  }

  @override
  CupertinoDialogAction createCupertinoWidget(
      BuildContext context, WidgetRef ref) {
    return CupertinoDialogAction(
      child: Text(buttonText, style: TextStyle(letterSpacing: -0.5)),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
        onPressed?.call();
      },
      isDefaultAction: isDefaultAction,
      isDestructiveAction: isDestructiveAction,
    );
  }
}

/*
Future<bool?> showFirestoreErrorDialog(
  BuildContext context,
  WidgetRef ref, {
  VoidCallback? retryAction,
}) {
  return showAlertDialog(
    context,
    ref,
    title: l10n.errorTitle,
    content: "${l10n.errorFirestoreDescription}\n${l10n.errorContact}",
    actions: [
      PlatformDialogAction(
          buttonText: l10n.errorReportButton, onPressed: () => {}),
      if (retryAction != null)
        PlatformDialogAction(
            buttonText: l10n.errorRetryButton, onPressed: () => retryAction),
      PlatformDialogAction(
          buttonText: MaterialLocalizations.of(context).closeButtonLabel,
          onPressed: () => {},
          isDefaultAction: true),
    ],
    displayCancelButton: false,
  );
}*/
