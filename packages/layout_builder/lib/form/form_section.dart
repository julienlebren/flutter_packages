part of 'form.dart';

/// The section of a form, with a title header, optionally a text
/// in the footer and some children displayed inside rows.
class FormSection extends ConsumerWidget {
  const FormSection({
    Key? key,
    this.title,
    this.caption,
    this.displayCaptionOnlyOnIOS = false,
    this.child,
    this.children,
  })  : assert((child != null || children != null)),
        super(key: key);

  final String? title;
  final String? caption;
  final bool displayCaptionOnlyOnIOS;
  final Widget? child;
  final List<Widget>? children;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(appThemeProvider);
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) FormSectionTitle(title: title!),
        ClipRRect(
          borderRadius: BorderRadius.circular(isCupertino() ? 10.0 : 0.0),
          child: Container(
            color: appTheme.listTileBackground,
            child: child != null
                ? Padding(
                    padding: EdgeInsets.only(
                      top: isMaterial() ? 5 : 0,
                      //bottom: isMaterial() ? 10 : 0,
                    ),
                    child: child)
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (isMaterial()) ...[
                        SizedBox(height: 5),
                        if (caption != null && !displayCaptionOnlyOnIOS)
                          FormSectionCaption(caption: caption!),
                      ],
                      for (var child in children!) ...[
                        child,
                        if (child != children!.last && !isTextField(child))
                          FormRowDivider(),
                      ],
                      //if (isMaterial()) SizedBox(height: 10),
                    ],
                  ),
          ),
        ),
        if (isCupertino() && caption != null)
          FormSectionCaption(caption: caption!)
      ],
    );
  }

  bool isTextField(Widget widget) =>
      widget is FormRow && widget.child is PlatformTextField;
}

class FormSectionTitle extends PlatformWidgetBase<Container, Container> {
  const FormSectionTitle({
    required this.title,
  }) : super();

  final String title;

  @override
  Container createMaterialWidget(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(appThemeProvider);
    return Container(
      width: double.infinity,
      color: appTheme.formBackgroundColor,
      padding: EdgeInsets.only(
        left: 15,
        bottom: 0,
        top: 15,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w800,
          color: appTheme.textColor,
        ),
      ),
    );
  }

  @override
  Container createCupertinoWidget(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      color: Colors.transparent,
      padding: EdgeInsets.only(
        left: 15,
        bottom: 5,
        top: 5,
      ),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: Color(0xFF757575),
        ),
      ),
    );
  }
}

class FormSectionCaption extends StatelessWidget {
  const FormSectionCaption({
    Key? key,
    required this.caption,
  }) : super(key: key);
  final String caption;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: isCupertino() ? 8 : 0,
        left: 15,
        right: 15,
        bottom: isMaterial() ? 8 : 0,
      ),
      child: Text(
        caption,
        overflow: TextOverflow.clip,
        style: TextStyle(
          fontSize: isCupertino() ? 14 : 13,
          color: Colors.grey.shade600,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}
