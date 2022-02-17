part of '../sign_in.dart';

class SignInPhonePage extends StatelessWidget {
  const SignInPhonePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("SignInEmailPhonePage"));
  }
}

/// Creates an instance of [SignInPhoneModel]
///
/// We are using [StateNotifierProvider] here as a `SignInPhoneModel` is a complex
/// object, with advanced business logic like submitting the phone number
final signInPhoneModelProvider =
    StateNotifierProvider.autoDispose<SignInPhoneController, SignInPhoneState>(
        (ref) {
  final authService = ref.watch(authServiceProvider);
  return SignInPhoneController(authService);
});

/// Top level of the sign-in phone page
/// Watches the state of the `SignInPhoneModel`
/// to move to the verification page when the [SubmitState] is success.
///
/// On iOS, it will always move to verification page.
/// On Android, as the code will be automatically retrieved by the app,
/// we check the authState to detect if we need to close the sign-in flow
/// or if the user needs to be redirected to the profile form.
class SignInPhonePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<SubmitState>(signInPhoneModelProvider, (_, state) {
      if (state == SubmitState.success()) {
        /*final authState = ref.read(authStateProvider).state;
          if (authState == AuthState.needsProfile()) {
            Navigator.of(context).pushNamed(AppRoutes.signInProfilePage);
          } else if (authState == AuthState.authed()) {
            context.read(uiStateProvider).state = UIState.closeSignIn();
          } else {
            Navigator.of(context).pushNamed(AppRoutes.signInVerificationPage);
          }*/
      }
    });

    return SignInPhonePageBuilder();
  }
}

/// Constructor of the sign-in phone page
/// Watches the state of the [SignInPhoneModel]
/// and builds the page with a [SignInScaffold]
class SignInPhonePageBuilder extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.read(localizationProvider);
    final state = ref.watch(signInPhoneModelProvider);
    return SignInPageBuilder(
      title: l10n.signInPhoneTitle,
      subtitle: l10n.signInPhoneSubtitle,
      leadingButton: SignInCloseButton(),
      submitButton: FormSubmitButton(
        onPressed: state.maybeWhen(
          canSubmit: () =>
              ref.read(signInPhoneModelProvider.notifier).verifyPhone,
          error: (_) => ref.read(signInPhoneModelProvider.notifier).verifyPhone,
          orElse: () => null,
        ),
      ),
      child: SignInPhoneForm(),
      errorText: state.maybeWhen(
        error: (error) => error.toString(),
        orElse: () => null,
      ),
      isLoading: state.maybeWhen(
        saving: () => true,
        orElse: () => false,
      ),
    );
  }
}

/// Interactive part of the sign-in phone page
/// Uses a [StatefulWidget] because it contents a [TextField].
/// This widget watches `countryProvider` to rebuild
/// because both fields (country and phone) use it.
class SignInPhoneForm extends ConsumerStatefulWidget {
  @override
  _SignInPhoneFormState createState() => _SignInPhoneFormState();
}

class _SignInPhoneFormState extends ConsumerState<SignInPhoneForm> {
  final controller = TextEditingController();
  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 100), () {
      focusNode.requestFocus();
    });
  }

  void _openCountries(BuildContext context) {
    /*if (isCupertino()) {
      showCupertinoModalBottomSheet(
        context: context,
        duration: Duration(milliseconds: 300),
        builder: (context) => CountriesPage(),
      );
    } else {
      context.read(uiStateProvider).state = UIState.openCountries();
    }*/
  }

  LibPhonenumberTextFormatter phoneNumberFormatter(
      CountryWithPhoneCode country) {
    return LibPhonenumberTextFormatter(
      phoneNumberType: PhoneNumberType.mobile,
      phoneNumberFormat: PhoneNumberFormat.national,
      country: country,
      onFormatFinished: (inputText) async {
        final model = ref.read(signInPhoneModelProvider.notifier);
        model.parsePhoneNumber(country, inputText);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return /*ProviderListener<StateController<CountryWithPhoneCode>>(
      provider: countryProvider,
      onChange: (context, state) async {
        controller.clear();
      },
      child:*/
        Consumer(
      builder: (_, watch, child) {
        //final selectedCountry = ref.watch(countryProvider).state;
        return Column(
          children: [
            FormTappableField(
              value: "xxx", //selectedCountry.countryName!,
              onPressed: () => _openCountries(context),
            ),
            FormRowDivider(),
            SizedBox(height: 8),
            PlatformTextField(
              controller: controller,
              focusNode: focusNode,
              keyboardType: TextInputType.phone,
              /*placeholder: l10n.signInPhonePlaceholder(
                  selectedCountry.exampleNumberMobileNational!),
              inputFormatters: [phoneNumberFormatter(selectedCountry)],*/
            ),
            if (isCupertino()) FormRowDivider(),
            if (isMaterial()) SignInPhoneAutoRetrieve(),
          ],
        );
      },
      //),
    );
  }
}

/// Displays a message on Android devices informing that
/// the app will detect automatically the code
class SignInPhoneAutoRetrieve extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.read(localizationProvider);
    return Padding(
      padding: EdgeInsets.only(top: 30),
      child: Text(
        l10n.signInPhoneAutoRetrieve,
      ),
    );
  }
}
