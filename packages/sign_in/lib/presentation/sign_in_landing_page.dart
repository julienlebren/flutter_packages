part of '../sign_in.dart';

final signInSupplierProvider =
    StateProvider<SignInSupplier>((_) => SignInSupplier.anonymous);

class SignInLandingPageBuilder extends ConsumerWidget {
  const SignInLandingPageBuilder({
    Key? key,
    required this.logo,
    required this.buttons,
  }) : super(key: key);

  final Widget logo;
  final Widget buttons;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(signInThemeProvider);
    final authSettings = ref.watch(authSettingsProvider);
    final needUserInfo = (authSettings.needUserInfoProvider != null
        ? ref.read(authSettings.needUserInfoProvider!)
        : false);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.orangeAccent,
        image: theme.landingBackgroundImage != null
            ? DecorationImage(
                image: AssetImage(theme.landingBackgroundImage!),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: PlatformScaffold(
        body: Container(
          color: Colors.yellowAccent,
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Spacer(),
              logo,
              const Spacer(),
              if (needUserInfo) const SignInCompleteButton() else buttons,
            ],
          ),
        ),
      ),
    );
  }
}
