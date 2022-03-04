part of '../../sign_in.dart';

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

  void _onCountryChanged(CountryWithPhoneCode country) {
    _handlePhoneEvent(ref, SignInPhoneEvent.countryChanged(country));
    controller.clear();
    focusNode.requestFocus();
  }

  void _openCountries(BuildContext contex, CountryWithPhoneCode country) {
    if (isCupertino()) {
      showCupertinoModalBottomSheet(
        context: context,
        duration: const Duration(milliseconds: 300),
        builder: (context) => ProviderScope(
          overrides: [
            selectedCountryProvider.overrideWithValue(country),
            countryHandler.overrideWithValue(_onCountryChanged),
          ],
          child: const CountriesPage(),
        ),
      );
    } else {
      final navigator = SignInNavigatorKeys.modal.currentState!;
      navigator.pushNamed(SignInRoutes.signInCountriesPage);
    }
  }

  LibPhonenumberTextFormatter phoneNumberFormatter(
      CountryWithPhoneCode country) {
    return LibPhonenumberTextFormatter(
      phoneNumberType: PhoneNumberType.mobile,
      phoneNumberFormat: PhoneNumberFormat.national,
      country: country,
      onFormatFinished: (input) async {
        print("country: $country // input is $input");
        _handlePhoneEvent(ref, SignInPhoneEvent.phoneChanged(input));
      },
    );
  }

/*
  TextInputFormatter phoneNumberFormatter(CountryWithPhoneCode country) {
    var m = country.getPhoneMask(
      format: PhoneNumberFormat.national,
      type: PhoneNumberType.mobile,
      removeCountryCodeFromMask: true,
    );
    final _mask = PhoneMask(m);
    final maskedValue = _mask.apply(newValue.text);
  }*/

  @override
  Widget build(BuildContext context) {
    final l10n = ref.read(signInLocalizationsProvider);
    final state = ref.watch(signInPhoneControllerProvider);

    return Column(
      children: [
        SignInTappableField(
          label: state.country.countryName!,
          onPressed: () => _openCountries(context, state.country),
        ),
        const SignInDivider(),
        const SizedBox(height: 8),
        PlatformTextField(
          controller: controller,
          focusNode: focusNode,
          keyboardType: TextInputType.phone,
          placeholder: l10n.signInPhonePlaceholder(
            state.country.exampleNumberMobileNational ?? "",
          ),
          inputFormatters: [phoneNumberFormatter(state.country)],
          onChanged: (text) {
            print("text: $text");
          },
        ),
        if (isCupertino()) const SignInDivider(),
        if (isMaterial()) const SignInPhoneAutoRetrieve(),
        SignInSubmitButton(
          title: l10n.continueButton,
          onPressed: state.canSubmit
              ? () {
                  _handlePhoneEvent(ref, const SignInPhoneEvent.verifyPhone());
                }
              : null,
        ),
      ],
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
