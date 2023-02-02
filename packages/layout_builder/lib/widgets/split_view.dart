part of 'widgets.dart';

class SplitView extends StatelessWidget {
  const SplitView({
    required this.sideView,
    required this.mainView,
    Key? key,
  }) : super(key: key);

  final Widget sideView;
  final Widget mainView;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= Breakpoints.tablet) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 370,
            child: sideView,
          ),
          const VerticalDivider(),
          Expanded(
            child: mainView,
          ),
        ],
      );
    } else {
      return mainView;
    }
  }
}
