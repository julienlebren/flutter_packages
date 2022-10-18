// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of subscription_service;

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PurchasesEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchOfferings,
    required TResult Function(PackageType type) purchase,
    required TResult Function() restorePurchases,
    required TResult Function() openOffers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchOfferings,
    TResult Function(PackageType type)? purchase,
    TResult Function()? restorePurchases,
    TResult Function()? openOffers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchOfferings,
    TResult Function(PackageType type)? purchase,
    TResult Function()? restorePurchases,
    TResult Function()? openOffers,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchOfferings value) fetchOfferings,
    required TResult Function(_Purchase value) purchase,
    required TResult Function(_RestorePurchases value) restorePurchases,
    required TResult Function(_OpenOffers value) openOffers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchOfferings value)? fetchOfferings,
    TResult Function(_Purchase value)? purchase,
    TResult Function(_RestorePurchases value)? restorePurchases,
    TResult Function(_OpenOffers value)? openOffers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchOfferings value)? fetchOfferings,
    TResult Function(_Purchase value)? purchase,
    TResult Function(_RestorePurchases value)? restorePurchases,
    TResult Function(_OpenOffers value)? openOffers,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchasesEventCopyWith<$Res> {
  factory $PurchasesEventCopyWith(
          PurchasesEvent value, $Res Function(PurchasesEvent) then) =
      _$PurchasesEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$PurchasesEventCopyWithImpl<$Res>
    implements $PurchasesEventCopyWith<$Res> {
  _$PurchasesEventCopyWithImpl(this._value, this._then);

  final PurchasesEvent _value;
  // ignore: unused_field
  final $Res Function(PurchasesEvent) _then;
}

/// @nodoc
abstract class _$$_FetchOfferingsCopyWith<$Res> {
  factory _$$_FetchOfferingsCopyWith(
          _$_FetchOfferings value, $Res Function(_$_FetchOfferings) then) =
      __$$_FetchOfferingsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_FetchOfferingsCopyWithImpl<$Res>
    extends _$PurchasesEventCopyWithImpl<$Res>
    implements _$$_FetchOfferingsCopyWith<$Res> {
  __$$_FetchOfferingsCopyWithImpl(
      _$_FetchOfferings _value, $Res Function(_$_FetchOfferings) _then)
      : super(_value, (v) => _then(v as _$_FetchOfferings));

  @override
  _$_FetchOfferings get _value => super._value as _$_FetchOfferings;
}

/// @nodoc

class _$_FetchOfferings implements _FetchOfferings {
  const _$_FetchOfferings();

  @override
  String toString() {
    return 'PurchasesEvent.fetchOfferings()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_FetchOfferings);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchOfferings,
    required TResult Function(PackageType type) purchase,
    required TResult Function() restorePurchases,
    required TResult Function() openOffers,
  }) {
    return fetchOfferings();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchOfferings,
    TResult Function(PackageType type)? purchase,
    TResult Function()? restorePurchases,
    TResult Function()? openOffers,
  }) {
    return fetchOfferings?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchOfferings,
    TResult Function(PackageType type)? purchase,
    TResult Function()? restorePurchases,
    TResult Function()? openOffers,
    required TResult orElse(),
  }) {
    if (fetchOfferings != null) {
      return fetchOfferings();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchOfferings value) fetchOfferings,
    required TResult Function(_Purchase value) purchase,
    required TResult Function(_RestorePurchases value) restorePurchases,
    required TResult Function(_OpenOffers value) openOffers,
  }) {
    return fetchOfferings(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchOfferings value)? fetchOfferings,
    TResult Function(_Purchase value)? purchase,
    TResult Function(_RestorePurchases value)? restorePurchases,
    TResult Function(_OpenOffers value)? openOffers,
  }) {
    return fetchOfferings?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchOfferings value)? fetchOfferings,
    TResult Function(_Purchase value)? purchase,
    TResult Function(_RestorePurchases value)? restorePurchases,
    TResult Function(_OpenOffers value)? openOffers,
    required TResult orElse(),
  }) {
    if (fetchOfferings != null) {
      return fetchOfferings(this);
    }
    return orElse();
  }
}

abstract class _FetchOfferings implements PurchasesEvent {
  const factory _FetchOfferings() = _$_FetchOfferings;
}

/// @nodoc
abstract class _$$_PurchaseCopyWith<$Res> {
  factory _$$_PurchaseCopyWith(
          _$_Purchase value, $Res Function(_$_Purchase) then) =
      __$$_PurchaseCopyWithImpl<$Res>;
  $Res call({PackageType type});
}

/// @nodoc
class __$$_PurchaseCopyWithImpl<$Res> extends _$PurchasesEventCopyWithImpl<$Res>
    implements _$$_PurchaseCopyWith<$Res> {
  __$$_PurchaseCopyWithImpl(
      _$_Purchase _value, $Res Function(_$_Purchase) _then)
      : super(_value, (v) => _then(v as _$_Purchase));

  @override
  _$_Purchase get _value => super._value as _$_Purchase;

  @override
  $Res call({
    Object? type = freezed,
  }) {
    return _then(_$_Purchase(
      type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PackageType,
    ));
  }
}

/// @nodoc

class _$_Purchase implements _Purchase {
  const _$_Purchase(this.type);

  @override
  final PackageType type;

  @override
  String toString() {
    return 'PurchasesEvent.purchase(type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Purchase &&
            const DeepCollectionEquality().equals(other.type, type));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(type));

  @JsonKey(ignore: true)
  @override
  _$$_PurchaseCopyWith<_$_Purchase> get copyWith =>
      __$$_PurchaseCopyWithImpl<_$_Purchase>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchOfferings,
    required TResult Function(PackageType type) purchase,
    required TResult Function() restorePurchases,
    required TResult Function() openOffers,
  }) {
    return purchase(type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchOfferings,
    TResult Function(PackageType type)? purchase,
    TResult Function()? restorePurchases,
    TResult Function()? openOffers,
  }) {
    return purchase?.call(type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchOfferings,
    TResult Function(PackageType type)? purchase,
    TResult Function()? restorePurchases,
    TResult Function()? openOffers,
    required TResult orElse(),
  }) {
    if (purchase != null) {
      return purchase(type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchOfferings value) fetchOfferings,
    required TResult Function(_Purchase value) purchase,
    required TResult Function(_RestorePurchases value) restorePurchases,
    required TResult Function(_OpenOffers value) openOffers,
  }) {
    return purchase(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchOfferings value)? fetchOfferings,
    TResult Function(_Purchase value)? purchase,
    TResult Function(_RestorePurchases value)? restorePurchases,
    TResult Function(_OpenOffers value)? openOffers,
  }) {
    return purchase?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchOfferings value)? fetchOfferings,
    TResult Function(_Purchase value)? purchase,
    TResult Function(_RestorePurchases value)? restorePurchases,
    TResult Function(_OpenOffers value)? openOffers,
    required TResult orElse(),
  }) {
    if (purchase != null) {
      return purchase(this);
    }
    return orElse();
  }
}

abstract class _Purchase implements PurchasesEvent {
  const factory _Purchase(final PackageType type) = _$_Purchase;

  PackageType get type;
  @JsonKey(ignore: true)
  _$$_PurchaseCopyWith<_$_Purchase> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RestorePurchasesCopyWith<$Res> {
  factory _$$_RestorePurchasesCopyWith(
          _$_RestorePurchases value, $Res Function(_$_RestorePurchases) then) =
      __$$_RestorePurchasesCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_RestorePurchasesCopyWithImpl<$Res>
    extends _$PurchasesEventCopyWithImpl<$Res>
    implements _$$_RestorePurchasesCopyWith<$Res> {
  __$$_RestorePurchasesCopyWithImpl(
      _$_RestorePurchases _value, $Res Function(_$_RestorePurchases) _then)
      : super(_value, (v) => _then(v as _$_RestorePurchases));

  @override
  _$_RestorePurchases get _value => super._value as _$_RestorePurchases;
}

/// @nodoc

class _$_RestorePurchases implements _RestorePurchases {
  const _$_RestorePurchases();

  @override
  String toString() {
    return 'PurchasesEvent.restorePurchases()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_RestorePurchases);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchOfferings,
    required TResult Function(PackageType type) purchase,
    required TResult Function() restorePurchases,
    required TResult Function() openOffers,
  }) {
    return restorePurchases();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchOfferings,
    TResult Function(PackageType type)? purchase,
    TResult Function()? restorePurchases,
    TResult Function()? openOffers,
  }) {
    return restorePurchases?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchOfferings,
    TResult Function(PackageType type)? purchase,
    TResult Function()? restorePurchases,
    TResult Function()? openOffers,
    required TResult orElse(),
  }) {
    if (restorePurchases != null) {
      return restorePurchases();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchOfferings value) fetchOfferings,
    required TResult Function(_Purchase value) purchase,
    required TResult Function(_RestorePurchases value) restorePurchases,
    required TResult Function(_OpenOffers value) openOffers,
  }) {
    return restorePurchases(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchOfferings value)? fetchOfferings,
    TResult Function(_Purchase value)? purchase,
    TResult Function(_RestorePurchases value)? restorePurchases,
    TResult Function(_OpenOffers value)? openOffers,
  }) {
    return restorePurchases?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchOfferings value)? fetchOfferings,
    TResult Function(_Purchase value)? purchase,
    TResult Function(_RestorePurchases value)? restorePurchases,
    TResult Function(_OpenOffers value)? openOffers,
    required TResult orElse(),
  }) {
    if (restorePurchases != null) {
      return restorePurchases(this);
    }
    return orElse();
  }
}

abstract class _RestorePurchases implements PurchasesEvent {
  const factory _RestorePurchases() = _$_RestorePurchases;
}

/// @nodoc
abstract class _$$_OpenOffersCopyWith<$Res> {
  factory _$$_OpenOffersCopyWith(
          _$_OpenOffers value, $Res Function(_$_OpenOffers) then) =
      __$$_OpenOffersCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_OpenOffersCopyWithImpl<$Res>
    extends _$PurchasesEventCopyWithImpl<$Res>
    implements _$$_OpenOffersCopyWith<$Res> {
  __$$_OpenOffersCopyWithImpl(
      _$_OpenOffers _value, $Res Function(_$_OpenOffers) _then)
      : super(_value, (v) => _then(v as _$_OpenOffers));

  @override
  _$_OpenOffers get _value => super._value as _$_OpenOffers;
}

/// @nodoc

class _$_OpenOffers implements _OpenOffers {
  const _$_OpenOffers();

  @override
  String toString() {
    return 'PurchasesEvent.openOffers()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_OpenOffers);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchOfferings,
    required TResult Function(PackageType type) purchase,
    required TResult Function() restorePurchases,
    required TResult Function() openOffers,
  }) {
    return openOffers();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchOfferings,
    TResult Function(PackageType type)? purchase,
    TResult Function()? restorePurchases,
    TResult Function()? openOffers,
  }) {
    return openOffers?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchOfferings,
    TResult Function(PackageType type)? purchase,
    TResult Function()? restorePurchases,
    TResult Function()? openOffers,
    required TResult orElse(),
  }) {
    if (openOffers != null) {
      return openOffers();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchOfferings value) fetchOfferings,
    required TResult Function(_Purchase value) purchase,
    required TResult Function(_RestorePurchases value) restorePurchases,
    required TResult Function(_OpenOffers value) openOffers,
  }) {
    return openOffers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchOfferings value)? fetchOfferings,
    TResult Function(_Purchase value)? purchase,
    TResult Function(_RestorePurchases value)? restorePurchases,
    TResult Function(_OpenOffers value)? openOffers,
  }) {
    return openOffers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchOfferings value)? fetchOfferings,
    TResult Function(_Purchase value)? purchase,
    TResult Function(_RestorePurchases value)? restorePurchases,
    TResult Function(_OpenOffers value)? openOffers,
    required TResult orElse(),
  }) {
    if (openOffers != null) {
      return openOffers(this);
    }
    return orElse();
  }
}

abstract class _OpenOffers implements PurchasesEvent {
  const factory _OpenOffers() = _$_OpenOffers;
}

/// @nodoc
mixin _$PurchasesSettings {
  String? get publicGoogleKey => throw _privateConstructorUsedError;
  String? get publicAppleKey => throw _privateConstructorUsedError;
  String get entitlementId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get privacyPolicyUrl => throw _privateConstructorUsedError;
  String get termsUrl => throw _privateConstructorUsedError;
  dynamic Function(bool, DateTime?) get processHandler =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PurchasesSettingsCopyWith<PurchasesSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchasesSettingsCopyWith<$Res> {
  factory $PurchasesSettingsCopyWith(
          PurchasesSettings value, $Res Function(PurchasesSettings) then) =
      _$PurchasesSettingsCopyWithImpl<$Res>;
  $Res call(
      {String? publicGoogleKey,
      String? publicAppleKey,
      String entitlementId,
      String userId,
      String privacyPolicyUrl,
      String termsUrl,
      dynamic Function(bool, DateTime?) processHandler});
}

/// @nodoc
class _$PurchasesSettingsCopyWithImpl<$Res>
    implements $PurchasesSettingsCopyWith<$Res> {
  _$PurchasesSettingsCopyWithImpl(this._value, this._then);

  final PurchasesSettings _value;
  // ignore: unused_field
  final $Res Function(PurchasesSettings) _then;

  @override
  $Res call({
    Object? publicGoogleKey = freezed,
    Object? publicAppleKey = freezed,
    Object? entitlementId = freezed,
    Object? userId = freezed,
    Object? privacyPolicyUrl = freezed,
    Object? termsUrl = freezed,
    Object? processHandler = freezed,
  }) {
    return _then(_value.copyWith(
      publicGoogleKey: publicGoogleKey == freezed
          ? _value.publicGoogleKey
          : publicGoogleKey // ignore: cast_nullable_to_non_nullable
              as String?,
      publicAppleKey: publicAppleKey == freezed
          ? _value.publicAppleKey
          : publicAppleKey // ignore: cast_nullable_to_non_nullable
              as String?,
      entitlementId: entitlementId == freezed
          ? _value.entitlementId
          : entitlementId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      privacyPolicyUrl: privacyPolicyUrl == freezed
          ? _value.privacyPolicyUrl
          : privacyPolicyUrl // ignore: cast_nullable_to_non_nullable
              as String,
      termsUrl: termsUrl == freezed
          ? _value.termsUrl
          : termsUrl // ignore: cast_nullable_to_non_nullable
              as String,
      processHandler: processHandler == freezed
          ? _value.processHandler
          : processHandler // ignore: cast_nullable_to_non_nullable
              as dynamic Function(bool, DateTime?),
    ));
  }
}

/// @nodoc
abstract class _$$_PurchasesSettingsCopyWith<$Res>
    implements $PurchasesSettingsCopyWith<$Res> {
  factory _$$_PurchasesSettingsCopyWith(_$_PurchasesSettings value,
          $Res Function(_$_PurchasesSettings) then) =
      __$$_PurchasesSettingsCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? publicGoogleKey,
      String? publicAppleKey,
      String entitlementId,
      String userId,
      String privacyPolicyUrl,
      String termsUrl,
      dynamic Function(bool, DateTime?) processHandler});
}

/// @nodoc
class __$$_PurchasesSettingsCopyWithImpl<$Res>
    extends _$PurchasesSettingsCopyWithImpl<$Res>
    implements _$$_PurchasesSettingsCopyWith<$Res> {
  __$$_PurchasesSettingsCopyWithImpl(
      _$_PurchasesSettings _value, $Res Function(_$_PurchasesSettings) _then)
      : super(_value, (v) => _then(v as _$_PurchasesSettings));

  @override
  _$_PurchasesSettings get _value => super._value as _$_PurchasesSettings;

  @override
  $Res call({
    Object? publicGoogleKey = freezed,
    Object? publicAppleKey = freezed,
    Object? entitlementId = freezed,
    Object? userId = freezed,
    Object? privacyPolicyUrl = freezed,
    Object? termsUrl = freezed,
    Object? processHandler = freezed,
  }) {
    return _then(_$_PurchasesSettings(
      publicGoogleKey: publicGoogleKey == freezed
          ? _value.publicGoogleKey
          : publicGoogleKey // ignore: cast_nullable_to_non_nullable
              as String?,
      publicAppleKey: publicAppleKey == freezed
          ? _value.publicAppleKey
          : publicAppleKey // ignore: cast_nullable_to_non_nullable
              as String?,
      entitlementId: entitlementId == freezed
          ? _value.entitlementId
          : entitlementId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      privacyPolicyUrl: privacyPolicyUrl == freezed
          ? _value.privacyPolicyUrl
          : privacyPolicyUrl // ignore: cast_nullable_to_non_nullable
              as String,
      termsUrl: termsUrl == freezed
          ? _value.termsUrl
          : termsUrl // ignore: cast_nullable_to_non_nullable
              as String,
      processHandler: processHandler == freezed
          ? _value.processHandler
          : processHandler // ignore: cast_nullable_to_non_nullable
              as dynamic Function(bool, DateTime?),
    ));
  }
}

/// @nodoc

class _$_PurchasesSettings implements _PurchasesSettings {
  _$_PurchasesSettings(
      {this.publicGoogleKey,
      this.publicAppleKey,
      required this.entitlementId,
      required this.userId,
      required this.privacyPolicyUrl,
      required this.termsUrl,
      required this.processHandler})
      : assert(publicGoogleKey != null || publicAppleKey != null,
            'At least one public key is required');

  @override
  final String? publicGoogleKey;
  @override
  final String? publicAppleKey;
  @override
  final String entitlementId;
  @override
  final String userId;
  @override
  final String privacyPolicyUrl;
  @override
  final String termsUrl;
  @override
  final dynamic Function(bool, DateTime?) processHandler;

  @override
  String toString() {
    return 'PurchasesSettings(publicGoogleKey: $publicGoogleKey, publicAppleKey: $publicAppleKey, entitlementId: $entitlementId, userId: $userId, privacyPolicyUrl: $privacyPolicyUrl, termsUrl: $termsUrl, processHandler: $processHandler)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PurchasesSettings &&
            const DeepCollectionEquality()
                .equals(other.publicGoogleKey, publicGoogleKey) &&
            const DeepCollectionEquality()
                .equals(other.publicAppleKey, publicAppleKey) &&
            const DeepCollectionEquality()
                .equals(other.entitlementId, entitlementId) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality()
                .equals(other.privacyPolicyUrl, privacyPolicyUrl) &&
            const DeepCollectionEquality().equals(other.termsUrl, termsUrl) &&
            (identical(other.processHandler, processHandler) ||
                other.processHandler == processHandler));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(publicGoogleKey),
      const DeepCollectionEquality().hash(publicAppleKey),
      const DeepCollectionEquality().hash(entitlementId),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(privacyPolicyUrl),
      const DeepCollectionEquality().hash(termsUrl),
      processHandler);

  @JsonKey(ignore: true)
  @override
  _$$_PurchasesSettingsCopyWith<_$_PurchasesSettings> get copyWith =>
      __$$_PurchasesSettingsCopyWithImpl<_$_PurchasesSettings>(
          this, _$identity);
}

abstract class _PurchasesSettings implements PurchasesSettings {
  factory _PurchasesSettings(
          {final String? publicGoogleKey,
          final String? publicAppleKey,
          required final String entitlementId,
          required final String userId,
          required final String privacyPolicyUrl,
          required final String termsUrl,
          required final dynamic Function(bool, DateTime?) processHandler}) =
      _$_PurchasesSettings;

  @override
  String? get publicGoogleKey;
  @override
  String? get publicAppleKey;
  @override
  String get entitlementId;
  @override
  String get userId;
  @override
  String get privacyPolicyUrl;
  @override
  String get termsUrl;
  @override
  dynamic Function(bool, DateTime?) get processHandler;
  @override
  @JsonKey(ignore: true)
  _$$_PurchasesSettingsCopyWith<_$_PurchasesSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PurchasesState {
  String? get weeklyPrice => throw _privateConstructorUsedError;
  String? get monthlyPrice => throw _privateConstructorUsedError;
  String? get twoMonthPrice => throw _privateConstructorUsedError;
  String? get threeMonthPrice => throw _privateConstructorUsedError;
  String? get sixMonthPrice => throw _privateConstructorUsedError;
  String? get annualPrice => throw _privateConstructorUsedError;
  bool get isReady => throw _privateConstructorUsedError;
  bool get hasPackage => throw _privateConstructorUsedError;
  bool get isPurchasing => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  String? get errorText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PurchasesStateCopyWith<PurchasesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchasesStateCopyWith<$Res> {
  factory $PurchasesStateCopyWith(
          PurchasesState value, $Res Function(PurchasesState) then) =
      _$PurchasesStateCopyWithImpl<$Res>;
  $Res call(
      {String? weeklyPrice,
      String? monthlyPrice,
      String? twoMonthPrice,
      String? threeMonthPrice,
      String? sixMonthPrice,
      String? annualPrice,
      bool isReady,
      bool hasPackage,
      bool isPurchasing,
      bool isSuccess,
      String? errorText});
}

/// @nodoc
class _$PurchasesStateCopyWithImpl<$Res>
    implements $PurchasesStateCopyWith<$Res> {
  _$PurchasesStateCopyWithImpl(this._value, this._then);

  final PurchasesState _value;
  // ignore: unused_field
  final $Res Function(PurchasesState) _then;

  @override
  $Res call({
    Object? weeklyPrice = freezed,
    Object? monthlyPrice = freezed,
    Object? twoMonthPrice = freezed,
    Object? threeMonthPrice = freezed,
    Object? sixMonthPrice = freezed,
    Object? annualPrice = freezed,
    Object? isReady = freezed,
    Object? hasPackage = freezed,
    Object? isPurchasing = freezed,
    Object? isSuccess = freezed,
    Object? errorText = freezed,
  }) {
    return _then(_value.copyWith(
      weeklyPrice: weeklyPrice == freezed
          ? _value.weeklyPrice
          : weeklyPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      monthlyPrice: monthlyPrice == freezed
          ? _value.monthlyPrice
          : monthlyPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      twoMonthPrice: twoMonthPrice == freezed
          ? _value.twoMonthPrice
          : twoMonthPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      threeMonthPrice: threeMonthPrice == freezed
          ? _value.threeMonthPrice
          : threeMonthPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      sixMonthPrice: sixMonthPrice == freezed
          ? _value.sixMonthPrice
          : sixMonthPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      annualPrice: annualPrice == freezed
          ? _value.annualPrice
          : annualPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      isReady: isReady == freezed
          ? _value.isReady
          : isReady // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPackage: hasPackage == freezed
          ? _value.hasPackage
          : hasPackage // ignore: cast_nullable_to_non_nullable
              as bool,
      isPurchasing: isPurchasing == freezed
          ? _value.isPurchasing
          : isPurchasing // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: isSuccess == freezed
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      errorText: errorText == freezed
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_PurchasesStateCopyWith<$Res>
    implements $PurchasesStateCopyWith<$Res> {
  factory _$$_PurchasesStateCopyWith(
          _$_PurchasesState value, $Res Function(_$_PurchasesState) then) =
      __$$_PurchasesStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? weeklyPrice,
      String? monthlyPrice,
      String? twoMonthPrice,
      String? threeMonthPrice,
      String? sixMonthPrice,
      String? annualPrice,
      bool isReady,
      bool hasPackage,
      bool isPurchasing,
      bool isSuccess,
      String? errorText});
}

/// @nodoc
class __$$_PurchasesStateCopyWithImpl<$Res>
    extends _$PurchasesStateCopyWithImpl<$Res>
    implements _$$_PurchasesStateCopyWith<$Res> {
  __$$_PurchasesStateCopyWithImpl(
      _$_PurchasesState _value, $Res Function(_$_PurchasesState) _then)
      : super(_value, (v) => _then(v as _$_PurchasesState));

  @override
  _$_PurchasesState get _value => super._value as _$_PurchasesState;

  @override
  $Res call({
    Object? weeklyPrice = freezed,
    Object? monthlyPrice = freezed,
    Object? twoMonthPrice = freezed,
    Object? threeMonthPrice = freezed,
    Object? sixMonthPrice = freezed,
    Object? annualPrice = freezed,
    Object? isReady = freezed,
    Object? hasPackage = freezed,
    Object? isPurchasing = freezed,
    Object? isSuccess = freezed,
    Object? errorText = freezed,
  }) {
    return _then(_$_PurchasesState(
      weeklyPrice: weeklyPrice == freezed
          ? _value.weeklyPrice
          : weeklyPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      monthlyPrice: monthlyPrice == freezed
          ? _value.monthlyPrice
          : monthlyPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      twoMonthPrice: twoMonthPrice == freezed
          ? _value.twoMonthPrice
          : twoMonthPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      threeMonthPrice: threeMonthPrice == freezed
          ? _value.threeMonthPrice
          : threeMonthPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      sixMonthPrice: sixMonthPrice == freezed
          ? _value.sixMonthPrice
          : sixMonthPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      annualPrice: annualPrice == freezed
          ? _value.annualPrice
          : annualPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      isReady: isReady == freezed
          ? _value.isReady
          : isReady // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPackage: hasPackage == freezed
          ? _value.hasPackage
          : hasPackage // ignore: cast_nullable_to_non_nullable
              as bool,
      isPurchasing: isPurchasing == freezed
          ? _value.isPurchasing
          : isPurchasing // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: isSuccess == freezed
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      errorText: errorText == freezed
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_PurchasesState implements _PurchasesState {
  const _$_PurchasesState(
      {this.weeklyPrice,
      this.monthlyPrice,
      this.twoMonthPrice,
      this.threeMonthPrice,
      this.sixMonthPrice,
      this.annualPrice,
      this.isReady = false,
      this.hasPackage = false,
      this.isPurchasing = false,
      this.isSuccess = false,
      this.errorText});

  @override
  final String? weeklyPrice;
  @override
  final String? monthlyPrice;
  @override
  final String? twoMonthPrice;
  @override
  final String? threeMonthPrice;
  @override
  final String? sixMonthPrice;
  @override
  final String? annualPrice;
  @override
  @JsonKey()
  final bool isReady;
  @override
  @JsonKey()
  final bool hasPackage;
  @override
  @JsonKey()
  final bool isPurchasing;
  @override
  @JsonKey()
  final bool isSuccess;
  @override
  final String? errorText;

  @override
  String toString() {
    return 'PurchasesState(weeklyPrice: $weeklyPrice, monthlyPrice: $monthlyPrice, twoMonthPrice: $twoMonthPrice, threeMonthPrice: $threeMonthPrice, sixMonthPrice: $sixMonthPrice, annualPrice: $annualPrice, isReady: $isReady, hasPackage: $hasPackage, isPurchasing: $isPurchasing, isSuccess: $isSuccess, errorText: $errorText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PurchasesState &&
            const DeepCollectionEquality()
                .equals(other.weeklyPrice, weeklyPrice) &&
            const DeepCollectionEquality()
                .equals(other.monthlyPrice, monthlyPrice) &&
            const DeepCollectionEquality()
                .equals(other.twoMonthPrice, twoMonthPrice) &&
            const DeepCollectionEquality()
                .equals(other.threeMonthPrice, threeMonthPrice) &&
            const DeepCollectionEquality()
                .equals(other.sixMonthPrice, sixMonthPrice) &&
            const DeepCollectionEquality()
                .equals(other.annualPrice, annualPrice) &&
            const DeepCollectionEquality().equals(other.isReady, isReady) &&
            const DeepCollectionEquality()
                .equals(other.hasPackage, hasPackage) &&
            const DeepCollectionEquality()
                .equals(other.isPurchasing, isPurchasing) &&
            const DeepCollectionEquality().equals(other.isSuccess, isSuccess) &&
            const DeepCollectionEquality().equals(other.errorText, errorText));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(weeklyPrice),
      const DeepCollectionEquality().hash(monthlyPrice),
      const DeepCollectionEquality().hash(twoMonthPrice),
      const DeepCollectionEquality().hash(threeMonthPrice),
      const DeepCollectionEquality().hash(sixMonthPrice),
      const DeepCollectionEquality().hash(annualPrice),
      const DeepCollectionEquality().hash(isReady),
      const DeepCollectionEquality().hash(hasPackage),
      const DeepCollectionEquality().hash(isPurchasing),
      const DeepCollectionEquality().hash(isSuccess),
      const DeepCollectionEquality().hash(errorText));

  @JsonKey(ignore: true)
  @override
  _$$_PurchasesStateCopyWith<_$_PurchasesState> get copyWith =>
      __$$_PurchasesStateCopyWithImpl<_$_PurchasesState>(this, _$identity);
}

abstract class _PurchasesState implements PurchasesState {
  const factory _PurchasesState(
      {final String? weeklyPrice,
      final String? monthlyPrice,
      final String? twoMonthPrice,
      final String? threeMonthPrice,
      final String? sixMonthPrice,
      final String? annualPrice,
      final bool isReady,
      final bool hasPackage,
      final bool isPurchasing,
      final bool isSuccess,
      final String? errorText}) = _$_PurchasesState;

  @override
  String? get weeklyPrice;
  @override
  String? get monthlyPrice;
  @override
  String? get twoMonthPrice;
  @override
  String? get threeMonthPrice;
  @override
  String? get sixMonthPrice;
  @override
  String? get annualPrice;
  @override
  bool get isReady;
  @override
  bool get hasPackage;
  @override
  bool get isPurchasing;
  @override
  bool get isSuccess;
  @override
  String? get errorText;
  @override
  @JsonKey(ignore: true)
  _$$_PurchasesStateCopyWith<_$_PurchasesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PurchasesTheme {
  String? get backgroundImage => throw _privateConstructorUsedError;
  Color get backgroundColor => throw _privateConstructorUsedError;
  Color get primaryColor => throw _privateConstructorUsedError;
  Color get textColor => throw _privateConstructorUsedError;
  Color? get appBarButtonColor => throw _privateConstructorUsedError;
  Color get textButtonColor => throw _privateConstructorUsedError;
  Color get cupertinoDisclaimerColor => throw _privateConstructorUsedError;
  Color get featureBackgroundColor => throw _privateConstructorUsedError;
  Color get featureIconColor => throw _privateConstructorUsedError;
  Color get featureTitleColor => throw _privateConstructorUsedError;
  Color get featureCaptionColor => throw _privateConstructorUsedError;
  Color? get purchaseButtonBackgroundColor =>
      throw _privateConstructorUsedError;
  double get purchaseButtonBorderRadius => throw _privateConstructorUsedError;
  Color? get purchaseButtonBorderColor => throw _privateConstructorUsedError;
  double get spaceBetweenButtons => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PurchasesThemeCopyWith<PurchasesTheme> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchasesThemeCopyWith<$Res> {
  factory $PurchasesThemeCopyWith(
          PurchasesTheme value, $Res Function(PurchasesTheme) then) =
      _$PurchasesThemeCopyWithImpl<$Res>;
  $Res call(
      {String? backgroundImage,
      Color backgroundColor,
      Color primaryColor,
      Color textColor,
      Color? appBarButtonColor,
      Color textButtonColor,
      Color cupertinoDisclaimerColor,
      Color featureBackgroundColor,
      Color featureIconColor,
      Color featureTitleColor,
      Color featureCaptionColor,
      Color? purchaseButtonBackgroundColor,
      double purchaseButtonBorderRadius,
      Color? purchaseButtonBorderColor,
      double spaceBetweenButtons});
}

/// @nodoc
class _$PurchasesThemeCopyWithImpl<$Res>
    implements $PurchasesThemeCopyWith<$Res> {
  _$PurchasesThemeCopyWithImpl(this._value, this._then);

  final PurchasesTheme _value;
  // ignore: unused_field
  final $Res Function(PurchasesTheme) _then;

  @override
  $Res call({
    Object? backgroundImage = freezed,
    Object? backgroundColor = freezed,
    Object? primaryColor = freezed,
    Object? textColor = freezed,
    Object? appBarButtonColor = freezed,
    Object? textButtonColor = freezed,
    Object? cupertinoDisclaimerColor = freezed,
    Object? featureBackgroundColor = freezed,
    Object? featureIconColor = freezed,
    Object? featureTitleColor = freezed,
    Object? featureCaptionColor = freezed,
    Object? purchaseButtonBackgroundColor = freezed,
    Object? purchaseButtonBorderRadius = freezed,
    Object? purchaseButtonBorderColor = freezed,
    Object? spaceBetweenButtons = freezed,
  }) {
    return _then(_value.copyWith(
      backgroundImage: backgroundImage == freezed
          ? _value.backgroundImage
          : backgroundImage // ignore: cast_nullable_to_non_nullable
              as String?,
      backgroundColor: backgroundColor == freezed
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as Color,
      primaryColor: primaryColor == freezed
          ? _value.primaryColor
          : primaryColor // ignore: cast_nullable_to_non_nullable
              as Color,
      textColor: textColor == freezed
          ? _value.textColor
          : textColor // ignore: cast_nullable_to_non_nullable
              as Color,
      appBarButtonColor: appBarButtonColor == freezed
          ? _value.appBarButtonColor
          : appBarButtonColor // ignore: cast_nullable_to_non_nullable
              as Color?,
      textButtonColor: textButtonColor == freezed
          ? _value.textButtonColor
          : textButtonColor // ignore: cast_nullable_to_non_nullable
              as Color,
      cupertinoDisclaimerColor: cupertinoDisclaimerColor == freezed
          ? _value.cupertinoDisclaimerColor
          : cupertinoDisclaimerColor // ignore: cast_nullable_to_non_nullable
              as Color,
      featureBackgroundColor: featureBackgroundColor == freezed
          ? _value.featureBackgroundColor
          : featureBackgroundColor // ignore: cast_nullable_to_non_nullable
              as Color,
      featureIconColor: featureIconColor == freezed
          ? _value.featureIconColor
          : featureIconColor // ignore: cast_nullable_to_non_nullable
              as Color,
      featureTitleColor: featureTitleColor == freezed
          ? _value.featureTitleColor
          : featureTitleColor // ignore: cast_nullable_to_non_nullable
              as Color,
      featureCaptionColor: featureCaptionColor == freezed
          ? _value.featureCaptionColor
          : featureCaptionColor // ignore: cast_nullable_to_non_nullable
              as Color,
      purchaseButtonBackgroundColor: purchaseButtonBackgroundColor == freezed
          ? _value.purchaseButtonBackgroundColor
          : purchaseButtonBackgroundColor // ignore: cast_nullable_to_non_nullable
              as Color?,
      purchaseButtonBorderRadius: purchaseButtonBorderRadius == freezed
          ? _value.purchaseButtonBorderRadius
          : purchaseButtonBorderRadius // ignore: cast_nullable_to_non_nullable
              as double,
      purchaseButtonBorderColor: purchaseButtonBorderColor == freezed
          ? _value.purchaseButtonBorderColor
          : purchaseButtonBorderColor // ignore: cast_nullable_to_non_nullable
              as Color?,
      spaceBetweenButtons: spaceBetweenButtons == freezed
          ? _value.spaceBetweenButtons
          : spaceBetweenButtons // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$$_PurchasesThemeCopyWith<$Res>
    implements $PurchasesThemeCopyWith<$Res> {
  factory _$$_PurchasesThemeCopyWith(
          _$_PurchasesTheme value, $Res Function(_$_PurchasesTheme) then) =
      __$$_PurchasesThemeCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? backgroundImage,
      Color backgroundColor,
      Color primaryColor,
      Color textColor,
      Color? appBarButtonColor,
      Color textButtonColor,
      Color cupertinoDisclaimerColor,
      Color featureBackgroundColor,
      Color featureIconColor,
      Color featureTitleColor,
      Color featureCaptionColor,
      Color? purchaseButtonBackgroundColor,
      double purchaseButtonBorderRadius,
      Color? purchaseButtonBorderColor,
      double spaceBetweenButtons});
}

/// @nodoc
class __$$_PurchasesThemeCopyWithImpl<$Res>
    extends _$PurchasesThemeCopyWithImpl<$Res>
    implements _$$_PurchasesThemeCopyWith<$Res> {
  __$$_PurchasesThemeCopyWithImpl(
      _$_PurchasesTheme _value, $Res Function(_$_PurchasesTheme) _then)
      : super(_value, (v) => _then(v as _$_PurchasesTheme));

  @override
  _$_PurchasesTheme get _value => super._value as _$_PurchasesTheme;

  @override
  $Res call({
    Object? backgroundImage = freezed,
    Object? backgroundColor = freezed,
    Object? primaryColor = freezed,
    Object? textColor = freezed,
    Object? appBarButtonColor = freezed,
    Object? textButtonColor = freezed,
    Object? cupertinoDisclaimerColor = freezed,
    Object? featureBackgroundColor = freezed,
    Object? featureIconColor = freezed,
    Object? featureTitleColor = freezed,
    Object? featureCaptionColor = freezed,
    Object? purchaseButtonBackgroundColor = freezed,
    Object? purchaseButtonBorderRadius = freezed,
    Object? purchaseButtonBorderColor = freezed,
    Object? spaceBetweenButtons = freezed,
  }) {
    return _then(_$_PurchasesTheme(
      backgroundImage: backgroundImage == freezed
          ? _value.backgroundImage
          : backgroundImage // ignore: cast_nullable_to_non_nullable
              as String?,
      backgroundColor: backgroundColor == freezed
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as Color,
      primaryColor: primaryColor == freezed
          ? _value.primaryColor
          : primaryColor // ignore: cast_nullable_to_non_nullable
              as Color,
      textColor: textColor == freezed
          ? _value.textColor
          : textColor // ignore: cast_nullable_to_non_nullable
              as Color,
      appBarButtonColor: appBarButtonColor == freezed
          ? _value.appBarButtonColor
          : appBarButtonColor // ignore: cast_nullable_to_non_nullable
              as Color?,
      textButtonColor: textButtonColor == freezed
          ? _value.textButtonColor
          : textButtonColor // ignore: cast_nullable_to_non_nullable
              as Color,
      cupertinoDisclaimerColor: cupertinoDisclaimerColor == freezed
          ? _value.cupertinoDisclaimerColor
          : cupertinoDisclaimerColor // ignore: cast_nullable_to_non_nullable
              as Color,
      featureBackgroundColor: featureBackgroundColor == freezed
          ? _value.featureBackgroundColor
          : featureBackgroundColor // ignore: cast_nullable_to_non_nullable
              as Color,
      featureIconColor: featureIconColor == freezed
          ? _value.featureIconColor
          : featureIconColor // ignore: cast_nullable_to_non_nullable
              as Color,
      featureTitleColor: featureTitleColor == freezed
          ? _value.featureTitleColor
          : featureTitleColor // ignore: cast_nullable_to_non_nullable
              as Color,
      featureCaptionColor: featureCaptionColor == freezed
          ? _value.featureCaptionColor
          : featureCaptionColor // ignore: cast_nullable_to_non_nullable
              as Color,
      purchaseButtonBackgroundColor: purchaseButtonBackgroundColor == freezed
          ? _value.purchaseButtonBackgroundColor
          : purchaseButtonBackgroundColor // ignore: cast_nullable_to_non_nullable
              as Color?,
      purchaseButtonBorderRadius: purchaseButtonBorderRadius == freezed
          ? _value.purchaseButtonBorderRadius
          : purchaseButtonBorderRadius // ignore: cast_nullable_to_non_nullable
              as double,
      purchaseButtonBorderColor: purchaseButtonBorderColor == freezed
          ? _value.purchaseButtonBorderColor
          : purchaseButtonBorderColor // ignore: cast_nullable_to_non_nullable
              as Color?,
      spaceBetweenButtons: spaceBetweenButtons == freezed
          ? _value.spaceBetweenButtons
          : spaceBetweenButtons // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_PurchasesTheme implements _PurchasesTheme {
  const _$_PurchasesTheme(
      {this.backgroundImage,
      required this.backgroundColor,
      required this.primaryColor,
      required this.textColor,
      this.appBarButtonColor,
      required this.textButtonColor,
      required this.cupertinoDisclaimerColor,
      required this.featureBackgroundColor,
      required this.featureIconColor,
      required this.featureTitleColor,
      required this.featureCaptionColor,
      this.purchaseButtonBackgroundColor,
      this.purchaseButtonBorderRadius = 5.0,
      this.purchaseButtonBorderColor,
      this.spaceBetweenButtons = 15.0});

  @override
  final String? backgroundImage;
  @override
  final Color backgroundColor;
  @override
  final Color primaryColor;
  @override
  final Color textColor;
  @override
  final Color? appBarButtonColor;
  @override
  final Color textButtonColor;
  @override
  final Color cupertinoDisclaimerColor;
  @override
  final Color featureBackgroundColor;
  @override
  final Color featureIconColor;
  @override
  final Color featureTitleColor;
  @override
  final Color featureCaptionColor;
  @override
  final Color? purchaseButtonBackgroundColor;
  @override
  @JsonKey()
  final double purchaseButtonBorderRadius;
  @override
  final Color? purchaseButtonBorderColor;
  @override
  @JsonKey()
  final double spaceBetweenButtons;

  @override
  String toString() {
    return 'PurchasesTheme(backgroundImage: $backgroundImage, backgroundColor: $backgroundColor, primaryColor: $primaryColor, textColor: $textColor, appBarButtonColor: $appBarButtonColor, textButtonColor: $textButtonColor, cupertinoDisclaimerColor: $cupertinoDisclaimerColor, featureBackgroundColor: $featureBackgroundColor, featureIconColor: $featureIconColor, featureTitleColor: $featureTitleColor, featureCaptionColor: $featureCaptionColor, purchaseButtonBackgroundColor: $purchaseButtonBackgroundColor, purchaseButtonBorderRadius: $purchaseButtonBorderRadius, purchaseButtonBorderColor: $purchaseButtonBorderColor, spaceBetweenButtons: $spaceBetweenButtons)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PurchasesTheme &&
            const DeepCollectionEquality()
                .equals(other.backgroundImage, backgroundImage) &&
            const DeepCollectionEquality()
                .equals(other.backgroundColor, backgroundColor) &&
            const DeepCollectionEquality()
                .equals(other.primaryColor, primaryColor) &&
            const DeepCollectionEquality().equals(other.textColor, textColor) &&
            const DeepCollectionEquality()
                .equals(other.appBarButtonColor, appBarButtonColor) &&
            const DeepCollectionEquality()
                .equals(other.textButtonColor, textButtonColor) &&
            const DeepCollectionEquality().equals(
                other.cupertinoDisclaimerColor, cupertinoDisclaimerColor) &&
            const DeepCollectionEquality()
                .equals(other.featureBackgroundColor, featureBackgroundColor) &&
            const DeepCollectionEquality()
                .equals(other.featureIconColor, featureIconColor) &&
            const DeepCollectionEquality()
                .equals(other.featureTitleColor, featureTitleColor) &&
            const DeepCollectionEquality()
                .equals(other.featureCaptionColor, featureCaptionColor) &&
            const DeepCollectionEquality().equals(
                other.purchaseButtonBackgroundColor,
                purchaseButtonBackgroundColor) &&
            const DeepCollectionEquality().equals(
                other.purchaseButtonBorderRadius, purchaseButtonBorderRadius) &&
            const DeepCollectionEquality().equals(
                other.purchaseButtonBorderColor, purchaseButtonBorderColor) &&
            const DeepCollectionEquality()
                .equals(other.spaceBetweenButtons, spaceBetweenButtons));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(backgroundImage),
      const DeepCollectionEquality().hash(backgroundColor),
      const DeepCollectionEquality().hash(primaryColor),
      const DeepCollectionEquality().hash(textColor),
      const DeepCollectionEquality().hash(appBarButtonColor),
      const DeepCollectionEquality().hash(textButtonColor),
      const DeepCollectionEquality().hash(cupertinoDisclaimerColor),
      const DeepCollectionEquality().hash(featureBackgroundColor),
      const DeepCollectionEquality().hash(featureIconColor),
      const DeepCollectionEquality().hash(featureTitleColor),
      const DeepCollectionEquality().hash(featureCaptionColor),
      const DeepCollectionEquality().hash(purchaseButtonBackgroundColor),
      const DeepCollectionEquality().hash(purchaseButtonBorderRadius),
      const DeepCollectionEquality().hash(purchaseButtonBorderColor),
      const DeepCollectionEquality().hash(spaceBetweenButtons));

  @JsonKey(ignore: true)
  @override
  _$$_PurchasesThemeCopyWith<_$_PurchasesTheme> get copyWith =>
      __$$_PurchasesThemeCopyWithImpl<_$_PurchasesTheme>(this, _$identity);
}

abstract class _PurchasesTheme implements PurchasesTheme {
  const factory _PurchasesTheme(
      {final String? backgroundImage,
      required final Color backgroundColor,
      required final Color primaryColor,
      required final Color textColor,
      final Color? appBarButtonColor,
      required final Color textButtonColor,
      required final Color cupertinoDisclaimerColor,
      required final Color featureBackgroundColor,
      required final Color featureIconColor,
      required final Color featureTitleColor,
      required final Color featureCaptionColor,
      final Color? purchaseButtonBackgroundColor,
      final double purchaseButtonBorderRadius,
      final Color? purchaseButtonBorderColor,
      final double spaceBetweenButtons}) = _$_PurchasesTheme;

  @override
  String? get backgroundImage;
  @override
  Color get backgroundColor;
  @override
  Color get primaryColor;
  @override
  Color get textColor;
  @override
  Color? get appBarButtonColor;
  @override
  Color get textButtonColor;
  @override
  Color get cupertinoDisclaimerColor;
  @override
  Color get featureBackgroundColor;
  @override
  Color get featureIconColor;
  @override
  Color get featureTitleColor;
  @override
  Color get featureCaptionColor;
  @override
  Color? get purchaseButtonBackgroundColor;
  @override
  double get purchaseButtonBorderRadius;
  @override
  Color? get purchaseButtonBorderColor;
  @override
  double get spaceBetweenButtons;
  @override
  @JsonKey(ignore: true)
  _$$_PurchasesThemeCopyWith<_$_PurchasesTheme> get copyWith =>
      throw _privateConstructorUsedError;
}
