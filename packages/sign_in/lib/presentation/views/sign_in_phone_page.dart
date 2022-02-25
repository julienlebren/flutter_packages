part of '../../sign_in.dart';

/// Creates an instance of [SignInPhoneController]
///
/// We are using [StateNotifierProvider] here as a
/// `SignInPhoneController` is a complex object, with
/// advanced business logic like submitting the phone number
final signInPhoneControllerProvider =
    StateNotifierProvider.autoDispose<SignInPhoneController, SignInPhoneState>(
  (ref) {
    final country = ref.watch(selectedCountryProvider);
    final authService = ref.watch(authServiceProvider);
    final localizations = ref.watch(signInLocalizationsProvider);
    return SignInPhoneController(country, authService, localizations);
  },
  dependencies: [
    selectedCountryProvider,
    authServiceProvider,
    signInLocalizationsProvider,
  ],
);

/// Handles a `SignInPhoneEvent` in the [SignInPhoneController]
/// This function avoids too much code repetition in this file
void _handlePhoneEvent(WidgetRef ref, SignInPhoneEvent event) {
  final controller = ref.read(signInPhoneControllerProvider.notifier);
  controller.handleEvent(event);
}

/// Top level of the sign-in phone page
/// Watches the state of the `SignInPhoneModel`
/// to move to the verification page when the [SubmitState] is success.
///
/// On iOS, it will always move to verification page.
/// On Android, as the code will be automatically retrieved by the app,
/// we check the authState to detect if we need to close the sign-in flow
/// or if the user needs to be redirected to the profile form.
class SignInPhonePage extends ConsumerWidget {
  const SignInPhonePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<SignInPhoneState>(signInPhoneControllerProvider, (_, state) {
      if (state.isSuccess) {
        final authState = ref.read(authStateProvider);
        authState.maybeWhen(
          needUserInformation: () {
            //Navigator.of(context).pushNamed(AppRoutes.signInProfilePage);
          },
          authed: (_) {
            //context.read(uiStateProvider).state = UIState.closeSignIn();
          },
          orElse: () {
            Navigator.of(context)
                .pushNamed(SignInRoutes.signInPhoneVerificationPage);
          },
        );
      }
    });

    return const SignInPhonePageBuilder();
  }
}

/// Constructor of the sign-in phone page
/// Watches the state of the [SignInPhoneModel]
/// and builds the page with a [SignInScaffold]
class SignInPhonePageBuilder extends ConsumerWidget {
  const SignInPhonePageBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.read(signInLocalizationsProvider);
    final state = ref.watch(signInPhoneControllerProvider);

    return SignInPageBuilder(
      title: l10n.signInPhoneTitle,
      subtitle: l10n.signInPhoneSubtitle,
      leadingButton: const SignInCloseButton(),
      submitButton: PlatformElevatedButton(
        title: l10n.continueButton,
        onPressed: () => state.canSubmit
            ? _handlePhoneEvent(ref, const SignInPhoneEvent.verifyPhone())
            : null,
      ),
      child: const SignInPhoneForm(),
      errorText: state.errorText,
      isLoading: state.isLoading,
    );
  }
}

/// Interactive part of the sign-in phone page
/// Uses a [StatefulWidget] because it contents a [TextField].
/// This widget watches `countryProvider` to rebuild
/// because both fields (country and phone) use it.
class SignInPhoneForm extends ConsumerStatefulWidget {
  const SignInPhoneForm({Key? key}) : super(key: key);

  @override
  _SignInPhoneFormState createState() => _SignInPhoneFormState();
}

class _SignInPhoneFormState extends ConsumerState<SignInPhoneForm> {
  final controller = TextEditingController();
  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
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
      onFormatFinished: (input) async {
        _handlePhoneEvent(ref, SignInPhoneEvent.phoneChanged(input));
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
            const FormRowDivider(),
            const SizedBox(height: 8),
            PlatformTextField(
              controller: controller,
              focusNode: focusNode,
              keyboardType: TextInputType.phone,
              /*placeholder: l10n.signInPhonePlaceholder(
                  selectedCountry.exampleNumberMobileNational!),
              inputFormatters: [phoneNumberFormatter(selectedCountry)],*/
            ),
            if (isCupertino()) const FormRowDivider(),
            if (isMaterial()) const SignInPhoneAutoRetrieve(),
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
  const SignInPhoneAutoRetrieve({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.read(signInLocalizationsProvider);
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Text(
        l10n.signInPhoneAutoRetrieve,
      ),
    );
  }
}
