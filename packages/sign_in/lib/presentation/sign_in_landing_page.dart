part of '../sign_in.dart';

class SignInLandingPage extends ConsumerWidget {
  const SignInLandingPage({
    Key? key,
    required this.logo,
    required this.buttons,
  }) : super(key: key);

  final Widget logo;
  final Widget buttons;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(signInThemeProvider);

    return PlatformScaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: theme.landingBackgroundImage != null
              ? DecorationImage(
                  image: AssetImage(theme.landingBackgroundImage!),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: SafeArea(
          child: Container(
            color: Colors.yellowAccent,
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Spacer(),
                logo,
                const Spacer(),
                buttons,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
