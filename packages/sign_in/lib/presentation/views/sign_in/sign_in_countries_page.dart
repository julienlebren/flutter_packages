part of '../../../sign_in.dart';
/*
/// A provider which returns the list of the country from Libphonenumber
/// sorted by country name.
///
/// Note: Libphonenumber has been init earlier in the app so we don't need
/// anymore to return a Future here, which makes the data easier to handle
/// inside the widgets.
final countriesProvider = Provider<List<CountryWithPhoneCode>>((ref) {
  var countries = CountryManager().countries;
  countries.sort((a, b) {
    return a.countryName!.toLowerCase().compareTo(b.countryName!.toLowerCase());
  });
  return countries;
});

/// A provider which handles the country selected in the country picker.
/// By default, it returns the country from the Locale of the device.
///
/// That's also the only place where FirebaseAuth language is set.
/// Even if the user picks another country in the list, FirebaseAuth
/// language code will remain the same as the device's one.
final selectedCountryProvider = Provider<CountryWithPhoneCode>((ref) {
  final countryCode = ui.window.locale.countryCode;
  final langCode = ui.window.locale.languageCode;

  FirebaseAuth.instance.setLanguageCode(langCode);

  final countries = ref.watch(countriesProvider);

  Iterable<CountryWithPhoneCode> filteredCountries =
      countries.where((item) => item.countryCode == countryCode);

  if (filteredCountries.isEmpty) {
    filteredCountries = countries.where((item) => item.countryCode == 'US');
  }
  if (filteredCountries.isEmpty) {
    throw Exception('Unable to find a default country!');
  }

  return filteredCountries.first;
});

/// A provider that needs to be scoped with the callback that
/// will be used when the user selects a new country in the list.
final countryHandler = Provider<Function(CountryWithPhoneCode)>((ref) {
  throw UnimplementedError();
});

/// A class that handles the arguments passed to the navigator
class CountriesPageArguments {
  final CountryWithPhoneCode country;
  final Function(CountryWithPhoneCode country) onCountryChanged;

  CountriesPageArguments(this.country, this.onCountryChanged);
}

class CountriesPage extends ConsumerWidget {
  const CountriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(signInLocalizationsProvider);
    final listViewTheme = ref.watch(listViewThemeProvider);

    return ProviderScope(
      overrides: [
        listViewThemeProvider.overrideWithValue(
          listViewTheme.copyWith(separatorPadding: 45.0),
        ),
      ],
      child: PlatformModalScaffold(
        appBar: PlatformNavigationBar(
          title: l10n.countriesTitle,
          leading: PlatformNavigationBarCloseButton(
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: const CountriesPageContents(),
      ),
    );
  }
}

/// The list view of the countries
/// Uses a PlatformListView, separated on iOS and without separators on Android.
class CountriesPageContents extends ConsumerWidget {
  const CountriesPageContents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countries = ref.watch(countriesProvider);
    return PlatformListView(
      itemCount: countries.length,
      itemBuilder: (context, index) {
        return ProviderScope(
          overrides: [
            _currentCountry.overrideWithValue(countries[index]),
          ],
          child: const CountryItem(),
        );
      },
    );
  }
}

/// A provider which exposes the [CountryWithPhoneCode] displayed
/// by a [CountryItem].
///
/// By retreiving the [CountryWithPhoneCode] through a provider
/// instead of through its constructor, this allows [CountryItem]
/// to be instantiated using the `const` keyword.
///
/// This ensures that when we pick a new country, only the impacted
/// widgets rebuilds,  instead of the entire list of items (here it means
/// only the previous selected country, where the checkmark disapperears,
/// and the new selected country, where the checkmark appears).
final _currentCountry = Provider<CountryWithPhoneCode>((ref) {
  throw UnimplementedError();
});

class CountryItem extends ConsumerWidget {
  const CountryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final country = ref.watch(_currentCountry);
    final isSelected = (ref.watch(selectedCountryProvider) == country);

    return PlatformListTile(
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            _flag(country.countryCode),
            style: const TextStyle(fontSize: 20.0),
          ),
          const SizedBox(width: 10),
          Text(country.countryName!),
          const SizedBox(width: 5),
          Text(
            '(+${country.phoneCode})',
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
      trailing: PlatformSelectedIndicator(isSelected),
      onTap: () {
        ref.read(countryHandler)(country);
        Navigator.pop(context);
      },
    );
  }

  String _flag(String countryCode) {
    return countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
        (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
  }
}
*/