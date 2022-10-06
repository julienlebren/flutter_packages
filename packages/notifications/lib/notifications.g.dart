// GENERATED CODE - DO NOT MODIFY BY HAND

part of notifications;

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

String $fcmTokenHandlerHash() => r'c1eff5545fb97bb07904a081144a480e0d612717';

/// See also [fcmTokenHandler].
final fcmTokenHandlerProvider = AutoDisposeProvider<dynamic Function(String)>(
  fcmTokenHandler,
  name: r'fcmTokenHandlerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $fcmTokenHandlerHash,
);
typedef FcmTokenHandlerRef = AutoDisposeProviderRef<dynamic Function(String)>;
String $messageHandlerHash() => r'a6880318c85878f96bdc932265cc7b3f81a570e7';

/// See also [messageHandler].
final messageHandlerProvider =
    AutoDisposeProvider<dynamic Function(RemoteMessage)>(
  messageHandler,
  name: r'messageHandlerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $messageHandlerHash,
);
typedef MessageHandlerRef
    = AutoDisposeProviderRef<dynamic Function(RemoteMessage)>;
String $notificationsServiceHash() =>
    r'80166040619e720b727fcdd5abb5141212f432bd';

/// See also [notificationsService].
final notificationsServiceProvider = AutoDisposeProvider<NotificationsService>(
  notificationsService,
  name: r'notificationsServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $notificationsServiceHash,
);
typedef NotificationsServiceRef = AutoDisposeProviderRef<NotificationsService>;
