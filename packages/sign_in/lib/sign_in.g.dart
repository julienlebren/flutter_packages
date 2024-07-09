// GENERATED CODE - DO NOT MODIFY BY HAND

part of sign_in;

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

String $authStateChangesHash() => r'56a259e140aceabd28f195864320802f0044fcd3';

/// A provider which returns the auth changes in Firebase
/// We use a [StreamProvider] here to handle the status of the stream,
/// it allows us to know when the stream is loading or when it has data.
///
/// Copied from [authStateChanges].
final authStateChangesProvider = Provider<Stream<User?>>(
  authStateChanges,
  name: r'authStateChangesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $authStateChangesHash,
);
typedef AuthStateChangesRef = ProviderRef<Stream<User?>>;
String $userChangesHash() => r'760657fc2719e0fc465e172487a33ec2f93625a9';

/// See also [userChanges].
final userChangesProvider = Provider<Stream<User?>>(
  userChanges,
  name: r'userChangesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $userChangesHash,
);
typedef UserChangesRef = ProviderRef<Stream<User?>>;
String $authServiceHash() => r'8d1036029c890942be61636cbb32691091e2deb1';

/// A provider which returns an instance of [FirebaseAuthService]
///
/// Copied from [authService].
final authServiceProvider = Provider<FirebaseAuthService>(
  authService,
  name: r'authServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $authServiceHash,
);
typedef AuthServiceRef = ProviderRef<FirebaseAuthService>;
