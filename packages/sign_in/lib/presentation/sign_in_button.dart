part of '../sign_in.dart';

class SignInButton extends PlatformWidgetBase<ElevatedButton, CupertinoButton> {
  const SignInButton({
    Key? key,
    this.assetName,
    this.icon,
    required this.iconSize,
    required this.title,
    this.onPressed,
    required this.color,
    required this.textColor,
    required this.radius,
    required this.padding,
    required this.fontSize,
  }) : super(key: key);

  final String? assetName;
  final Widget? icon;
  final double? iconSize;
  final String title;
  final VoidCallback? onPressed;
  final Color color;
  final Color textColor;
  final double radius;
  final double padding;
  final double fontSize;

  @override
  ElevatedButton createMaterialWidget(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: padding),
        child: socialButtonContents,
      ),
      onPressed: onPressed,
    );
  }

  @override
  CupertinoButton createCupertinoWidget(BuildContext context, WidgetRef ref) {
    return CupertinoButton(
      color: color,
      padding: EdgeInsets.all(padding),
      borderRadius: BorderRadius.circular(radius),
      child: socialButtonContents,
      onPressed: onPressed,
    );
  }

  Widget get socialButtonContents {
    return Row(
      children: <Widget>[
        if (assetName != null)
          Image.asset(
            assetName!,
            width: iconSize,
            height: iconSize,
            package: 'sign_in',
          ),
        if (icon != null)
          SizedBox(
            width: iconSize,
            height: iconSize,
            child: Center(child: icon!),
          ),
        const Spacer(),
        Text(
          title,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w400,
            color: textColor,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
