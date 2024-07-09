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
    TResult? Function()? fetchOfferings,
    TResult? Function(PackageType type)? purchase,
    TResult? Function()? restorePurchases,
    TResult? Function()? openOffers,
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
    TResult? Function(_FetchOfferings value)? fetchOfferings,
    TResult? Function(_Purchase value)? purchase,
    TResult? Function(_RestorePurchases value)? restorePurchases,
    TResult? Function(_OpenOffers value)? openOffers,
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
      _$PurchasesEventCopyWithImpl<$Res, PurchasesEvent>;
}

/// @nodoc
class _$PurchasesEventCopyWithImpl<$Res, $Val extends PurchasesEvent>
    implements $PurchasesEventCopyWith<$Res> {
  _$PurchasesEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_FetchOfferingsCopyWith<$Res> {
  factory _$$_FetchOfferingsCopyWith(
          _$_FetchOfferings value, $Res Function(_$_FetchOfferings) then) =
      __$$_FetchOfferingsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_FetchOfferingsCopyWithImpl<$Res>
    extends _$PurchasesEventCopyWithImpl<$Res, _$_FetchOfferings>
    implements _$$_FetchOfferingsCopyWith<$Res> {
  __$$_FetchOfferingsCopyWithImpl(
      _$_FetchOfferings _value, $Res Function(_$_FetchOfferings) _then)
      : super(_value, _then);
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
    TResult? Function()? fetchOfferings,
    TResult? Function(PackageType type)? purchase,
    TResult? Function()? restorePurchases,
    TResult? Function()? openOffers,
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
    TResult? Function(_FetchOfferings value)? fetchOfferings,
    TResult? Function(_Purchase value)? purchase,
    TResult? Function(_RestorePurchases value)? restorePurchases,
    TResult? Function(_OpenOffers value)? openOffers,
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
  @useResult
  $Res call({PackageType type});
}

/// @nodoc
class __$$_PurchaseCopyWithImpl<$Res>
    extends _$PurchasesEventCopyWithImpl<$Res, _$_Purchase>
    implements _$$_PurchaseCopyWith<$Res> {
  __$$_PurchaseCopyWithImpl(
      _$_Purchase _value, $Res Function(_$_Purchase) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
  }) {
    return _then(_$_Purchase(
      null == type
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
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
    TResult? Function()? fetchOfferings,
    TResult? Function(PackageType type)? purchase,
    TResult? Function()? restorePurchases,
    TResult? Function()? openOffers,
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
    TResult? Function(_FetchOfferings value)? fetchOfferings,
    TResult? Function(_Purchase value)? purchase,
    TResult? Function(_RestorePurchases value)? restorePurchases,
    TResult? Function(_OpenOffers value)? openOffers,
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
    extends _$PurchasesEventCopyWithImpl<$Res, _$_RestorePurchases>
    implements _$$_RestorePurchasesCopyWith<$Res> {
  __$$_RestorePurchasesCopyWithImpl(
      _$_RestorePurchases _value, $Res Function(_$_RestorePurchases) _then)
      : super(_value, _then);
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
    TResult? Function()? fetchOfferings,
    TResult? Function(PackageType type)? purchase,
    TResult? Function()? restorePurchases,
    TResult? Function()? openOffers,
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
    TResult? Function(_FetchOfferings value)? fetchOfferings,
    TResult? Function(_Purchase value)? purchase,
    TResult? Function(_RestorePurchases value)? restorePurchases,
    TResult? Function(_OpenOffers value)? openOffers,
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
    extends _$PurchasesEventCopyWithImpl<$Res, _$_OpenOffers>
    implements _$$_OpenOffersCopyWith<$Res> {
  __$$_OpenOffersCopyWithImpl(
      _$_OpenOffers _value, $Res Function(_$_OpenOffers) _then)
      : super(_value, _then);
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
    TResult? Function()? fetchOfferings,
    TResult? Function(PackageType type)? purchase,
    TResult? Function()? restorePurchases,
    TResult? Function()? openOffers,
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
    TResult? Function(_FetchOfferings value)? fetchOfferings,
    TResult? Function(_Purchase value)? purchase,
    TResult? Function(_RestorePurchases value)? restorePurchases,
    TResult? Function(_OpenOffers value)? openOffers,
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
      _$PurchasesSettingsCopyWithImpl<$Res, PurchasesSettings>;
  @useResult
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
class _$PurchasesSettingsCopyWithImpl<$Res, $Val extends PurchasesSettings>
    implements $PurchasesSettingsCopyWith<$Res> {
  _$PurchasesSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? publicGoogleKey = freezed,
    Object? publicAppleKey = freezed,
    Object? entitlementId = null,
    Object? userId = null,
    Object? privacyPolicyUrl = null,
    Object? termsUrl = null,
    Object? processHandler = null,
  }) {
    return _then(_value.copyWith(
      publicGoogleKey: freezed == publicGoogleKey
          ? _value.publicGoogleKey
          : publicGoogleKey // ignore: cast_nullable_to_non_nullable
              as String?,
      publicAppleKey: freezed == publicAppleKey
          ? _value.publicAppleKey
          : publicAppleKey // ignore: cast_nullable_to_non_nullable
              as String?,
      entitlementId: null == entitlementId
          ? _value.entitlementId
          : entitlementId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      privacyPolicyUrl: null == privacyPolicyUrl
          ? _value.privacyPolicyUrl
          : privacyPolicyUrl // ignore: cast_nullable_to_non_nullable
              as String,
      termsUrl: null == termsUrl
          ? _value.termsUrl
          : termsUrl // ignore: cast_nullable_to_non_nullable
              as String,
      processHandler: null == processHandler
          ? _value.processHandler
          : processHandler // ignore: cast_nullable_to_non_nullable
              as dynamic Function(bool, DateTime?),
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PurchasesSettingsCopyWith<$Res>
    implements $PurchasesSettingsCopyWith<$Res> {
  factory _$$_PurchasesSettingsCopyWith(_$_PurchasesSettings value,
          $Res Function(_$_PurchasesSettings) then) =
      __$$_PurchasesSettingsCopyWithImpl<$Res>;
  @override
  @useResult
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
    extends _$PurchasesSettingsCopyWithImpl<$Res, _$_PurchasesSettings>
    implements _$$_PurchasesSettingsCopyWith<$Res> {
  __$$_PurchasesSettingsCopyWithImpl(
      _$_PurchasesSettings _value, $Res Function(_$_PurchasesSettings) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? publicGoogleKey = freezed,
    Object? publicAppleKey = freezed,
    Object? entitlementId = null,
    Object? userId = null,
    Object? privacyPolicyUrl = null,
    Object? termsUrl = null,
    Object? processHandler = null,
  }) {
    return _then(_$_PurchasesSettings(
      publicGoogleKey: freezed == publicGoogleKey
          ? _value.publicGoogleKey
          : publicGoogleKey // ignore: cast_nullable_to_non_nullable
              as String?,
      publicAppleKey: freezed == publicAppleKey
          ? _value.publicAppleKey
          : publicAppleKey // ignore: cast_nullable_to_non_nullable
              as String?,
      entitlementId: null == entitlementId
          ? _value.entitlementId
          : entitlementId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      privacyPolicyUrl: null == privacyPolicyUrl
          ? _value.privacyPolicyUrl
          : privacyPolicyUrl // ignore: cast_nullable_to_non_nullable
              as String,
      termsUrl: null == termsUrl
          ? _value.termsUrl
          : termsUrl // ignore: cast_nullable_to_non_nullable
              as String,
      processHandler: null == processHandler
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
            (identical(other.publicGoogleKey, publicGoogleKey) ||
                other.publicGoogleKey == publicGoogleKey) &&
            (identical(other.publicAppleKey, publicAppleKey) ||
                other.publicAppleKey == publicAppleKey) &&
            (identical(other.entitlementId, entitlementId) ||
                other.entitlementId == entitlementId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.privacyPolicyUrl, privacyPolicyUrl) ||
                other.privacyPolicyUrl == privacyPolicyUrl) &&
            (identical(other.termsUrl, termsUrl) ||
                other.termsUrl == termsUrl) &&
            (identical(other.processHandler, processHandler) ||
                other.processHandler == processHandler));
  }

  @override
  int get hashCode => Object.hash(runtimeType, publicGoogleKey, publicAppleKey,
      entitlementId, userId, privacyPolicyUrl, termsUrl, processHandler);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
  int? get annualDiscount => throw _privateConstructorUsedError;
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
      _$PurchasesStateCopyWithImpl<$Res, PurchasesState>;
  @useResult
  $Res call(
      {String? weeklyPrice,
      String? monthlyPrice,
      String? twoMonthPrice,
      String? threeMonthPrice,
      String? sixMonthPrice,
      String? annualPrice,
      int? annualDiscount,
      bool isReady,
      bool hasPackage,
      bool isPurchasing,
      bool isSuccess,
      String? errorText});
}

/// @nodoc
class _$PurchasesStateCopyWithImpl<$Res, $Val extends PurchasesState>
    implements $PurchasesStateCopyWith<$Res> {
  _$PurchasesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weeklyPrice = freezed,
    Object? monthlyPrice = freezed,
    Object? twoMonthPrice = freezed,
    Object? threeMonthPrice = freezed,
    Object? sixMonthPrice = freezed,
    Object? annualPrice = freezed,
    Object? annualDiscount = freezed,
    Object? isReady = null,
    Object? hasPackage = null,
    Object? isPurchasing = null,
    Object? isSuccess = null,
    Object? errorText = freezed,
  }) {
    return _then(_value.copyWith(
      weeklyPrice: freezed == weeklyPrice
          ? _value.weeklyPrice
          : weeklyPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      monthlyPrice: freezed == monthlyPrice
          ? _value.monthlyPrice
          : monthlyPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      twoMonthPrice: freezed == twoMonthPrice
          ? _value.twoMonthPrice
          : twoMonthPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      threeMonthPrice: freezed == threeMonthPrice
          ? _value.threeMonthPrice
          : threeMonthPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      sixMonthPrice: freezed == sixMonthPrice
          ? _value.sixMonthPrice
          : sixMonthPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      annualPrice: freezed == annualPrice
          ? _value.annualPrice
          : annualPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      annualDiscount: freezed == annualDiscount
          ? _value.annualDiscount
          : annualDiscount // ignore: cast_nullable_to_non_nullable
              as int?,
      isReady: null == isReady
          ? _value.isReady
          : isReady // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPackage: null == hasPackage
          ? _value.hasPackage
          : hasPackage // ignore: cast_nullable_to_non_nullable
              as bool,
      isPurchasing: null == isPurchasing
          ? _value.isPurchasing
          : isPurchasing // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      errorText: freezed == errorText
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PurchasesStateCopyWith<$Res>
    implements $PurchasesStateCopyWith<$Res> {
  factory _$$_PurchasesStateCopyWith(
          _$_PurchasesState value, $Res Function(_$_PurchasesState) then) =
      __$$_PurchasesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? weeklyPrice,
      String? monthlyPrice,
      String? twoMonthPrice,
      String? threeMonthPrice,
      String? sixMonthPrice,
      String? annualPrice,
      int? annualDiscount,
      bool isReady,
      bool hasPackage,
      bool isPurchasing,
      bool isSuccess,
      String? errorText});
}

/// @nodoc
class __$$_PurchasesStateCopyWithImpl<$Res>
    extends _$PurchasesStateCopyWithImpl<$Res, _$_PurchasesState>
    implements _$$_PurchasesStateCopyWith<$Res> {
  __$$_PurchasesStateCopyWithImpl(
      _$_PurchasesState _value, $Res Function(_$_PurchasesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weeklyPrice = freezed,
    Object? monthlyPrice = freezed,
    Object? twoMonthPrice = freezed,
    Object? threeMonthPrice = freezed,
    Object? sixMonthPrice = freezed,
    Object? annualPrice = freezed,
    Object? annualDiscount = freezed,
    Object? isReady = null,
    Object? hasPackage = null,
    Object? isPurchasing = null,
    Object? isSuccess = null,
    Object? errorText = freezed,
  }) {
    return _then(_$_PurchasesState(
      weeklyPrice: freezed == weeklyPrice
          ? _value.weeklyPrice
          : weeklyPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      monthlyPrice: freezed == monthlyPrice
          ? _value.monthlyPrice
          : monthlyPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      twoMonthPrice: freezed == twoMonthPrice
          ? _value.twoMonthPrice
          : twoMonthPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      threeMonthPrice: freezed == threeMonthPrice
          ? _value.threeMonthPrice
          : threeMonthPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      sixMonthPrice: freezed == sixMonthPrice
          ? _value.sixMonthPrice
          : sixMonthPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      annualPrice: freezed == annualPrice
          ? _value.annualPrice
          : annualPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      annualDiscount: freezed == annualDiscount
          ? _value.annualDiscount
          : annualDiscount // ignore: cast_nullable_to_non_nullable
              as int?,
      isReady: null == isReady
          ? _value.isReady
          : isReady // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPackage: null == hasPackage
          ? _value.hasPackage
          : hasPackage // ignore: cast_nullable_to_non_nullable
              as bool,
      isPurchasing: null == isPurchasing
          ? _value.isPurchasing
          : isPurchasing // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      errorText: freezed == errorText
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
      this.annualDiscount,
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
  final int? annualDiscount;
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
    return 'PurchasesState(weeklyPrice: $weeklyPrice, monthlyPrice: $monthlyPrice, twoMonthPrice: $twoMonthPrice, threeMonthPrice: $threeMonthPrice, sixMonthPrice: $sixMonthPrice, annualPrice: $annualPrice, annualDiscount: $annualDiscount, isReady: $isReady, hasPackage: $hasPackage, isPurchasing: $isPurchasing, isSuccess: $isSuccess, errorText: $errorText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PurchasesState &&
            (identical(other.weeklyPrice, weeklyPrice) ||
                other.weeklyPrice == weeklyPrice) &&
            (identical(other.monthlyPrice, monthlyPrice) ||
                other.monthlyPrice == monthlyPrice) &&
            (identical(other.twoMonthPrice, twoMonthPrice) ||
                other.twoMonthPrice == twoMonthPrice) &&
            (identical(other.threeMonthPrice, threeMonthPrice) ||
                other.threeMonthPrice == threeMonthPrice) &&
            (identical(other.sixMonthPrice, sixMonthPrice) ||
                other.sixMonthPrice == sixMonthPrice) &&
            (identical(other.annualPrice, annualPrice) ||
                other.annualPrice == annualPrice) &&
            (identical(other.annualDiscount, annualDiscount) ||
                other.annualDiscount == annualDiscount) &&
            (identical(other.isReady, isReady) || other.isReady == isReady) &&
            (identical(other.hasPackage, hasPackage) ||
                other.hasPackage == hasPackage) &&
            (identical(other.isPurchasing, isPurchasing) ||
                other.isPurchasing == isPurchasing) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.errorText, errorText) ||
                other.errorText == errorText));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      weeklyPrice,
      monthlyPrice,
      twoMonthPrice,
      threeMonthPrice,
      sixMonthPrice,
      annualPrice,
      annualDiscount,
      isReady,
      hasPackage,
      isPurchasing,
      isSuccess,
      errorText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
      final int? annualDiscount,
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
  int? get annualDiscount;
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
      _$PurchasesThemeCopyWithImpl<$Res, PurchasesTheme>;
  @useResult
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
class _$PurchasesThemeCopyWithImpl<$Res, $Val extends PurchasesTheme>
    implements $PurchasesThemeCopyWith<$Res> {
  _$PurchasesThemeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backgroundImage = freezed,
    Object? backgroundColor = null,
    Object? primaryColor = null,
    Object? textColor = null,
    Object? appBarButtonColor = freezed,
    Object? textButtonColor = null,
    Object? cupertinoDisclaimerColor = null,
    Object? featureBackgroundColor = null,
    Object? featureIconColor = null,
    Object? featureTitleColor = null,
    Object? featureCaptionColor = null,
    Object? purchaseButtonBackgroundColor = freezed,
    Object? purchaseButtonBorderRadius = null,
    Object? purchaseButtonBorderColor = freezed,
    Object? spaceBetweenButtons = null,
  }) {
    return _then(_value.copyWith(
      backgroundImage: freezed == backgroundImage
          ? _value.backgroundImage
          : backgroundImage // ignore: cast_nullable_to_non_nullable
              as String?,
      backgroundColor: null == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as Color,
      primaryColor: null == primaryColor
          ? _value.primaryColor
          : primaryColor // ignore: cast_nullable_to_non_nullable
              as Color,
      textColor: null == textColor
          ? _value.textColor
          : textColor // ignore: cast_nullable_to_non_nullable
              as Color,
      appBarButtonColor: freezed == appBarButtonColor
          ? _value.appBarButtonColor
          : appBarButtonColor // ignore: cast_nullable_to_non_nullable
              as Color?,
      textButtonColor: null == textButtonColor
          ? _value.textButtonColor
          : textButtonColor // ignore: cast_nullable_to_non_nullable
              as Color,
      cupertinoDisclaimerColor: null == cupertinoDisclaimerColor
          ? _value.cupertinoDisclaimerColor
          : cupertinoDisclaimerColor // ignore: cast_nullable_to_non_nullable
              as Color,
      featureBackgroundColor: null == featureBackgroundColor
          ? _value.featureBackgroundColor
          : featureBackgroundColor // ignore: cast_nullable_to_non_nullable
              as Color,
      featureIconColor: null == featureIconColor
          ? _value.featureIconColor
          : featureIconColor // ignore: cast_nullable_to_non_nullable
              as Color,
      featureTitleColor: null == featureTitleColor
          ? _value.featureTitleColor
          : featureTitleColor // ignore: cast_nullable_to_non_nullable
              as Color,
      featureCaptionColor: null == featureCaptionColor
          ? _value.featureCaptionColor
          : featureCaptionColor // ignore: cast_nullable_to_non_nullable
              as Color,
      purchaseButtonBackgroundColor: freezed == purchaseButtonBackgroundColor
          ? _value.purchaseButtonBackgroundColor
          : purchaseButtonBackgroundColor // ignore: cast_nullable_to_non_nullable
              as Color?,
      purchaseButtonBorderRadius: null == purchaseButtonBorderRadius
          ? _value.purchaseButtonBorderRadius
          : purchaseButtonBorderRadius // ignore: cast_nullable_to_non_nullable
              as double,
      purchaseButtonBorderColor: freezed == purchaseButtonBorderColor
          ? _value.purchaseButtonBorderColor
          : purchaseButtonBorderColor // ignore: cast_nullable_to_non_nullable
              as Color?,
      spaceBetweenButtons: null == spaceBetweenButtons
          ? _value.spaceBetweenButtons
          : spaceBetweenButtons // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PurchasesThemeCopyWith<$Res>
    implements $PurchasesThemeCopyWith<$Res> {
  factory _$$_PurchasesThemeCopyWith(
          _$_PurchasesTheme value, $Res Function(_$_PurchasesTheme) then) =
      __$$_PurchasesThemeCopyWithImpl<$Res>;
  @override
  @useResult
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
    extends _$PurchasesThemeCopyWithImpl<$Res, _$_PurchasesTheme>
    implements _$$_PurchasesThemeCopyWith<$Res> {
  __$$_PurchasesThemeCopyWithImpl(
      _$_PurchasesTheme _value, $Res Function(_$_PurchasesTheme) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backgroundImage = freezed,
    Object? backgroundColor = null,
    Object? primaryColor = null,
    Object? textColor = null,
    Object? appBarButtonColor = freezed,
    Object? textButtonColor = null,
    Object? cupertinoDisclaimerColor = null,
    Object? featureBackgroundColor = null,
    Object? featureIconColor = null,
    Object? featureTitleColor = null,
    Object? featureCaptionColor = null,
    Object? purchaseButtonBackgroundColor = freezed,
    Object? purchaseButtonBorderRadius = null,
    Object? purchaseButtonBorderColor = freezed,
    Object? spaceBetweenButtons = null,
  }) {
    return _then(_$_PurchasesTheme(
      backgroundImage: freezed == backgroundImage
          ? _value.backgroundImage
          : backgroundImage // ignore: cast_nullable_to_non_nullable
              as String?,
      backgroundColor: null == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as Color,
      primaryColor: null == primaryColor
          ? _value.primaryColor
          : primaryColor // ignore: cast_nullable_to_non_nullable
              as Color,
      textColor: null == textColor
          ? _value.textColor
          : textColor // ignore: cast_nullable_to_non_nullable
              as Color,
      appBarButtonColor: freezed == appBarButtonColor
          ? _value.appBarButtonColor
          : appBarButtonColor // ignore: cast_nullable_to_non_nullable
              as Color?,
      textButtonColor: null == textButtonColor
          ? _value.textButtonColor
          : textButtonColor // ignore: cast_nullable_to_non_nullable
              as Color,
      cupertinoDisclaimerColor: null == cupertinoDisclaimerColor
          ? _value.cupertinoDisclaimerColor
          : cupertinoDisclaimerColor // ignore: cast_nullable_to_non_nullable
              as Color,
      featureBackgroundColor: null == featureBackgroundColor
          ? _value.featureBackgroundColor
          : featureBackgroundColor // ignore: cast_nullable_to_non_nullable
              as Color,
      featureIconColor: null == featureIconColor
          ? _value.featureIconColor
          : featureIconColor // ignore: cast_nullable_to_non_nullable
              as Color,
      featureTitleColor: null == featureTitleColor
          ? _value.featureTitleColor
          : featureTitleColor // ignore: cast_nullable_to_non_nullable
              as Color,
      featureCaptionColor: null == featureCaptionColor
          ? _value.featureCaptionColor
          : featureCaptionColor // ignore: cast_nullable_to_non_nullable
              as Color,
      purchaseButtonBackgroundColor: freezed == purchaseButtonBackgroundColor
          ? _value.purchaseButtonBackgroundColor
          : purchaseButtonBackgroundColor // ignore: cast_nullable_to_non_nullable
              as Color?,
      purchaseButtonBorderRadius: null == purchaseButtonBorderRadius
          ? _value.purchaseButtonBorderRadius
          : purchaseButtonBorderRadius // ignore: cast_nullable_to_non_nullable
              as double,
      purchaseButtonBorderColor: freezed == purchaseButtonBorderColor
          ? _value.purchaseButtonBorderColor
          : purchaseButtonBorderColor // ignore: cast_nullable_to_non_nullable
              as Color?,
      spaceBetweenButtons: null == spaceBetweenButtons
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
            (identical(other.backgroundImage, backgroundImage) ||
                other.backgroundImage == backgroundImage) &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor) &&
            (identical(other.primaryColor, primaryColor) ||
                other.primaryColor == primaryColor) &&
            (identical(other.textColor, textColor) ||
                other.textColor == textColor) &&
            (identical(other.appBarButtonColor, appBarButtonColor) ||
                other.appBarButtonColor == appBarButtonColor) &&
            (identical(other.textButtonColor, textButtonColor) ||
                other.textButtonColor == textButtonColor) &&
            (identical(
                    other.cupertinoDisclaimerColor, cupertinoDisclaimerColor) ||
                other.cupertinoDisclaimerColor == cupertinoDisclaimerColor) &&
            (identical(other.featureBackgroundColor, featureBackgroundColor) ||
                other.featureBackgroundColor == featureBackgroundColor) &&
            (identical(other.featureIconColor, featureIconColor) ||
                other.featureIconColor == featureIconColor) &&
            (identical(other.featureTitleColor, featureTitleColor) ||
                other.featureTitleColor == featureTitleColor) &&
            (identical(other.featureCaptionColor, featureCaptionColor) ||
                other.featureCaptionColor == featureCaptionColor) &&
            (identical(other.purchaseButtonBackgroundColor,
                    purchaseButtonBackgroundColor) ||
                other.purchaseButtonBackgroundColor ==
                    purchaseButtonBackgroundColor) &&
            (identical(other.purchaseButtonBorderRadius,
                    purchaseButtonBorderRadius) ||
                other.purchaseButtonBorderRadius ==
                    purchaseButtonBorderRadius) &&
            (identical(other.purchaseButtonBorderColor,
                    purchaseButtonBorderColor) ||
                other.purchaseButtonBorderColor == purchaseButtonBorderColor) &&
            (identical(other.spaceBetweenButtons, spaceBetweenButtons) ||
                other.spaceBetweenButtons == spaceBetweenButtons));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      backgroundImage,
      backgroundColor,
      primaryColor,
      textColor,
      appBarButtonColor,
      textButtonColor,
      cupertinoDisclaimerColor,
      featureBackgroundColor,
      featureIconColor,
      featureTitleColor,
      featureCaptionColor,
      purchaseButtonBackgroundColor,
      purchaseButtonBorderRadius,
      purchaseButtonBorderColor,
      spaceBetweenButtons);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
