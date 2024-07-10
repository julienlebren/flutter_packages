part of '../../../sign_in.dart';

/// Handles a `SignInPhoneEvent` in the [SignInPhoneController]
/// This function avoids too much code repetition in this file
void _handlePhoneEvent(WidgetRef ref, SignInPhoneEvent event) {
  final controller = ref.read(signInPhoneControllerProvider.notifier);
  //controller.handleEvent(event);
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
    final l10n = ref.watch(signInLocalizationsProvider);
    final errorText = ref.watch(signInPhoneControllerProvider.select(
      (state) => state.errorText,
    ));
    final isLoading = ref.watch(signInPhoneControllerProvider.select(
      (state) => state.isLoading,
    ));

    ref.listen<SignInPhoneState>(signInPhoneControllerProvider, (_, state) {
      if (state.isSuccess) {
        final navigator = SignInNavigatorKeys.modal.currentState!;
        navigator.pushNamed(SignInRoutes.signInPhoneVerificationPage);
      }
    });

    return SignInPageBuilder(
      title: l10n.signInPhoneTitle,
      subtitle: l10n.signInPhoneSubtitle,
      leadingButton: const SignInCloseButton(),
      errorText: errorText,
      isLoading: isLoading,
      child: const SignInPhoneForm(),
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
  createState() => _SignInPhoneFormState();
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
        _handlePhoneEvent(ref, SignInPhoneEvent.phoneChanged(input));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(signInLocalizationsProvider);
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
          placeholder: state.country.exampleNumberMobileNational != null
              ? l10n.signInPhonePlaceholder(
                  state.country.exampleNumberMobileNational!,
                )
              : null,
          inputFormatters: [phoneNumberFormatter(state.country)],
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
    final l10n = ref.watch(signInLocalizationsProvider);
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Text(
        l10n.signInPhoneAutoRetrieve,
      ),
    );
  }
}
