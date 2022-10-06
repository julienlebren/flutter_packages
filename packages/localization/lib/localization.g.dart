// GENERATED CODE - DO NOT MODIFY BY HAND

part of localization;

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

String $supportedLocalesHash() => r'59da7c9eb55fb6709ecc18a907440e2131bd06dc';

/// The default locales available in the apps that are using this package
/// I always develop my apps in english as native language and provide
/// a french translation since I am french 🇫🇷🙈
/// But it can be overridden in the main [ProviderScope] of the app if needed.
///
/// Copied from [supportedLocales].
final supportedLocalesProvider = AutoDisposeProvider<List<Locale>>(
  supportedLocales,
  name: r'supportedLocalesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $supportedLocalesHash,
);
typedef SupportedLocalesRef = AutoDisposeProviderRef<List<Locale>>;
String $userLocaleHash() => r'3b499683572347e4fcf52a5ea8fdf631f2b5ca8e';

/// The locale provided by the user settings (not the device locale, which
/// is provided by window.locale, but the locale defined in the user settings)
///
/// Copied from [userLocale].
final userLocaleProvider = AutoDisposeProvider<Locale?>(
  userLocale,
  name: r'userLocaleProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $userLocaleHash,
);
typedef UserLocaleRef = AutoDisposeProviderRef<Locale?>;
String $localeHash() => r'95e6e3ee5f37ce746f86b22bc9d9f30f31d9611f';

/// The provider of the [Locale] which will be watched by the `localizationProvider`
/// in the app and the packages which are using localization.
///
/// Copied from [locale].
final localeProvider = AutoDisposeProvider<Locale>(
  locale,
  name: r'localeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $localeHash,
);
typedef LocaleRef = AutoDisposeProviderRef<Locale>;
