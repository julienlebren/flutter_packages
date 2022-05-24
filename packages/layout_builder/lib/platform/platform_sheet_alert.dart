part of platform;

class AlertAction {
  AlertAction({
    required this.title,
    this.icon,
    required this.onPressed,
    this.isDestructiveAction = false,
    this.isDefaultAction = false,
  });

  final String title;
  final IconData? icon;
  final VoidCallback onPressed;
  final bool isDestructiveAction;
  final bool isDefaultAction;
}

void showPlatformSheetAlert({
  required BuildContext context,
  required WidgetRef ref,
  required String title,
  required List<AlertAction> actions,
  bool displayCancelButton = true,
}) {
  if (isCupertino()) {
    showPlatformModalSheet(
      context: context,
      ref: ref,
      title: title,
      actions: actions
          .map((action) => PlatformModalSheetAction(
                title: action.title,
                icon: action.icon,
                onPressed: action.onPressed,
                isDestructiveAction: action.isDestructiveAction,
                isDefaultAction: action.isDefaultAction,
              ))
          .toList(),
    );
  } else {
    showAlertDialog(
      context,
      ref,
      title: title,
      actions: actions
          .map((action) => PlatformDialogAction(
                buttonText: action.title,
                onPressed: action.onPressed,
                isDestructiveAction: action.isDestructiveAction,
                isDefaultAction: action.isDefaultAction,
              ))
          .toList(),
      displayCancelButton: displayCancelButton,
    );
  }
}
