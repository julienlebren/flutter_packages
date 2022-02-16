part of '../sign_in.dart';

final signInSupplierProvider =
    StateProvider<SignInSupplier>((_) => SignInSupplier.anonymous);

class SignInLandingPageBuilder extends ConsumerWidget {
  const SignInLandingPageBuilder({
    Key? key,
    required this.logo,
    required this.buttons,
    this.backgroundImage,
  }) : super(key: key);

  final Widget logo;
  final Widget buttons;
  final String? backgroundImage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(appThemeProvider);

    return SafeArea(
      top: false,
      bottom: false,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: appTheme.scaffoldBackgroundColor,
          image: backgroundImage != null
              ? DecorationImage(
                  image: AssetImage(backgroundImage!),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Spacer(),
                  logo,
                  const Spacer(),
                  buttons,
                  //if (needUserInfo) const SignInCompleteButton() else buttons,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
