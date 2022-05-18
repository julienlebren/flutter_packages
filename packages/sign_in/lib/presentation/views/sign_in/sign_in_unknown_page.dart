part of '../../../sign_in.dart';

class SignInUnknownPage extends StatelessWidget {
  const SignInUnknownPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PlatformScaffold(
      body: Center(
        child: Text("Unknown page"),
      ),
    );
  }
}
