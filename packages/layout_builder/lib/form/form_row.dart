part of 'form.dart';

/// A row inside a list inside a row with a minimum height
/// (48px on iOS and 53px on Android)
class FormRow extends StatelessWidget {
  const FormRow({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: isCupertino() ? 48.0 : 53.0,
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 15, right: isCupertino() ? 8 : 15),
        child: Center(child: child),
      ),
    );
  }
}
