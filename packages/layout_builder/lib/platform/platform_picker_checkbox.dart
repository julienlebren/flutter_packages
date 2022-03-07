part of platform;

class PlatformPickerCheckbox extends StatelessWidget {
  const PlatformPickerCheckbox({
    Key? key,
    this.isSelected = false,
  }) : super(key: key);

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? Icon(
            PlatformIcons.checkmarkFill,
            size: 26,
            color: isCupertino()
                ? CupertinoTheme.of(context).primaryColor
                : Theme.of(context).primaryColor,
          )
        : Icon(
            CupertinoIcons.circle,
            size: 26,
            color: Colors.grey.shade300,
          );
  }
}
