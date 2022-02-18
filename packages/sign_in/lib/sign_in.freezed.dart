// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of sign_in;

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SignInEmailEventTearOff {
  const _$SignInEmailEventTearOff();

  _EmailChanged emailChanged(String email) {
    return _EmailChanged(
      email,
    );
  }
}

/// @nodoc
const $SignInEmailEvent = _$SignInEmailEventTearOff();

/// @nodoc
mixin _$SignInEmailEvent {
  String get email => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailChanged value) emailChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignInEmailEventCopyWith<SignInEmailEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInEmailEventCopyWith<$Res> {
  factory $SignInEmailEventCopyWith(
          SignInEmailEvent value, $Res Function(SignInEmailEvent) then) =
      _$SignInEmailEventCopyWithImpl<$Res>;
  $Res call({String email});
}

/// @nodoc
class _$SignInEmailEventCopyWithImpl<$Res>
    implements $SignInEmailEventCopyWith<$Res> {
  _$SignInEmailEventCopyWithImpl(this._value, this._then);

  final SignInEmailEvent _value;
  // ignore: unused_field
  final $Res Function(SignInEmailEvent) _then;

  @override
  $Res call({
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$EmailChangedCopyWith<$Res>
    implements $SignInEmailEventCopyWith<$Res> {
  factory _$EmailChangedCopyWith(
          _EmailChanged value, $Res Function(_EmailChanged) then) =
      __$EmailChangedCopyWithImpl<$Res>;
  @override
  $Res call({String email});
}

/// @nodoc
class __$EmailChangedCopyWithImpl<$Res>
    extends _$SignInEmailEventCopyWithImpl<$Res>
    implements _$EmailChangedCopyWith<$Res> {
  __$EmailChangedCopyWithImpl(
      _EmailChanged _value, $Res Function(_EmailChanged) _then)
      : super(_value, (v) => _then(v as _EmailChanged));

  @override
  _EmailChanged get _value => super._value as _EmailChanged;

  @override
  $Res call({
    Object? email = freezed,
  }) {
    return _then(_EmailChanged(
      email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_EmailChanged implements _EmailChanged {
  const _$_EmailChanged(this.email);

  @override
  final String email;

  @override
  String toString() {
    return 'SignInEmailEvent.emailChanged(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EmailChanged &&
            const DeepCollectionEquality().equals(other.email, email));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(email));

  @JsonKey(ignore: true)
  @override
  _$EmailChangedCopyWith<_EmailChanged> get copyWith =>
      __$EmailChangedCopyWithImpl<_EmailChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
  }) {
    return emailChanged(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
  }) {
    return emailChanged?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    required TResult orElse(),
  }) {
    if (emailChanged != null) {
      return emailChanged(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailChanged value) emailChanged,
  }) {
    return emailChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
  }) {
    return emailChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
    required TResult orElse(),
  }) {
    if (emailChanged != null) {
      return emailChanged(this);
    }
    return orElse();
  }
}

abstract class _EmailChanged implements SignInEmailEvent {
  const factory _EmailChanged(String email) = _$_EmailChanged;

  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$EmailChangedCopyWith<_EmailChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$SignInEmailStateTearOff {
  const _$SignInEmailStateTearOff();

  _SignInEmailState call(
      {String email = "",
      bool canSubmit = false,
      bool isLoading = false,
      bool isSuccess = false,
      String? errorText}) {
    return _SignInEmailState(
      email: email,
      canSubmit: canSubmit,
      isLoading: isLoading,
      isSuccess: isSuccess,
      errorText: errorText,
    );
  }
}

/// @nodoc
const $SignInEmailState = _$SignInEmailStateTearOff();

/// @nodoc
mixin _$SignInEmailState {
  String get email => throw _privateConstructorUsedError;
  bool get canSubmit => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  String? get errorText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignInEmailStateCopyWith<SignInEmailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInEmailStateCopyWith<$Res> {
  factory $SignInEmailStateCopyWith(
          SignInEmailState value, $Res Function(SignInEmailState) then) =
      _$SignInEmailStateCopyWithImpl<$Res>;
  $Res call(
      {String email,
      bool canSubmit,
      bool isLoading,
      bool isSuccess,
      String? errorText});
}

/// @nodoc
class _$SignInEmailStateCopyWithImpl<$Res>
    implements $SignInEmailStateCopyWith<$Res> {
  _$SignInEmailStateCopyWithImpl(this._value, this._then);

  final SignInEmailState _value;
  // ignore: unused_field
  final $Res Function(SignInEmailState) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? canSubmit = freezed,
    Object? isLoading = freezed,
    Object? isSuccess = freezed,
    Object? errorText = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      canSubmit: canSubmit == freezed
          ? _value.canSubmit
          : canSubmit // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
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
abstract class _$SignInEmailStateCopyWith<$Res>
    implements $SignInEmailStateCopyWith<$Res> {
  factory _$SignInEmailStateCopyWith(
          _SignInEmailState value, $Res Function(_SignInEmailState) then) =
      __$SignInEmailStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String email,
      bool canSubmit,
      bool isLoading,
      bool isSuccess,
      String? errorText});
}

/// @nodoc
class __$SignInEmailStateCopyWithImpl<$Res>
    extends _$SignInEmailStateCopyWithImpl<$Res>
    implements _$SignInEmailStateCopyWith<$Res> {
  __$SignInEmailStateCopyWithImpl(
      _SignInEmailState _value, $Res Function(_SignInEmailState) _then)
      : super(_value, (v) => _then(v as _SignInEmailState));

  @override
  _SignInEmailState get _value => super._value as _SignInEmailState;

  @override
  $Res call({
    Object? email = freezed,
    Object? canSubmit = freezed,
    Object? isLoading = freezed,
    Object? isSuccess = freezed,
    Object? errorText = freezed,
  }) {
    return _then(_SignInEmailState(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      canSubmit: canSubmit == freezed
          ? _value.canSubmit
          : canSubmit // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
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

class _$_SignInEmailState implements _SignInEmailState {
  const _$_SignInEmailState(
      {this.email = "",
      this.canSubmit = false,
      this.isLoading = false,
      this.isSuccess = false,
      this.errorText});

  @JsonKey()
  @override
  final String email;
  @JsonKey()
  @override
  final bool canSubmit;
  @JsonKey()
  @override
  final bool isLoading;
  @JsonKey()
  @override
  final bool isSuccess;
  @override
  final String? errorText;

  @override
  String toString() {
    return 'SignInEmailState(email: $email, canSubmit: $canSubmit, isLoading: $isLoading, isSuccess: $isSuccess, errorText: $errorText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SignInEmailState &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.canSubmit, canSubmit) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.isSuccess, isSuccess) &&
            const DeepCollectionEquality().equals(other.errorText, errorText));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(canSubmit),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isSuccess),
      const DeepCollectionEquality().hash(errorText));

  @JsonKey(ignore: true)
  @override
  _$SignInEmailStateCopyWith<_SignInEmailState> get copyWith =>
      __$SignInEmailStateCopyWithImpl<_SignInEmailState>(this, _$identity);
}

abstract class _SignInEmailState implements SignInEmailState {
  const factory _SignInEmailState(
      {String email,
      bool canSubmit,
      bool isLoading,
      bool isSuccess,
      String? errorText}) = _$_SignInEmailState;

  @override
  String get email;
  @override
  bool get canSubmit;
  @override
  bool get isLoading;
  @override
  bool get isSuccess;
  @override
  String? get errorText;
  @override
  @JsonKey(ignore: true)
  _$SignInEmailStateCopyWith<_SignInEmailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$SignInEmailLinkEventTearOff {
  const _$SignInEmailLinkEventTearOff();

  _LinkEmailChanged emailChanged(String email) {
    return _LinkEmailChanged(
      email,
    );
  }

  _SendLink sendLink() {
    return const _SendLink();
  }
}

/// @nodoc
const $SignInEmailLinkEvent = _$SignInEmailLinkEventTearOff();

/// @nodoc
mixin _$SignInEmailLinkEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function() sendLink,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function()? sendLink,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function()? sendLink,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LinkEmailChanged value) emailChanged,
    required TResult Function(_SendLink value) sendLink,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LinkEmailChanged value)? emailChanged,
    TResult Function(_SendLink value)? sendLink,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LinkEmailChanged value)? emailChanged,
    TResult Function(_SendLink value)? sendLink,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInEmailLinkEventCopyWith<$Res> {
  factory $SignInEmailLinkEventCopyWith(SignInEmailLinkEvent value,
          $Res Function(SignInEmailLinkEvent) then) =
      _$SignInEmailLinkEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignInEmailLinkEventCopyWithImpl<$Res>
    implements $SignInEmailLinkEventCopyWith<$Res> {
  _$SignInEmailLinkEventCopyWithImpl(this._value, this._then);

  final SignInEmailLinkEvent _value;
  // ignore: unused_field
  final $Res Function(SignInEmailLinkEvent) _then;
}

/// @nodoc
abstract class _$LinkEmailChangedCopyWith<$Res> {
  factory _$LinkEmailChangedCopyWith(
          _LinkEmailChanged value, $Res Function(_LinkEmailChanged) then) =
      __$LinkEmailChangedCopyWithImpl<$Res>;
  $Res call({String email});
}

/// @nodoc
class __$LinkEmailChangedCopyWithImpl<$Res>
    extends _$SignInEmailLinkEventCopyWithImpl<$Res>
    implements _$LinkEmailChangedCopyWith<$Res> {
  __$LinkEmailChangedCopyWithImpl(
      _LinkEmailChanged _value, $Res Function(_LinkEmailChanged) _then)
      : super(_value, (v) => _then(v as _LinkEmailChanged));

  @override
  _LinkEmailChanged get _value => super._value as _LinkEmailChanged;

  @override
  $Res call({
    Object? email = freezed,
  }) {
    return _then(_LinkEmailChanged(
      email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LinkEmailChanged implements _LinkEmailChanged {
  const _$_LinkEmailChanged(this.email);

  @override
  final String email;

  @override
  String toString() {
    return 'SignInEmailLinkEvent.emailChanged(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LinkEmailChanged &&
            const DeepCollectionEquality().equals(other.email, email));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(email));

  @JsonKey(ignore: true)
  @override
  _$LinkEmailChangedCopyWith<_LinkEmailChanged> get copyWith =>
      __$LinkEmailChangedCopyWithImpl<_LinkEmailChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function() sendLink,
  }) {
    return emailChanged(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function()? sendLink,
  }) {
    return emailChanged?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function()? sendLink,
    required TResult orElse(),
  }) {
    if (emailChanged != null) {
      return emailChanged(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LinkEmailChanged value) emailChanged,
    required TResult Function(_SendLink value) sendLink,
  }) {
    return emailChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LinkEmailChanged value)? emailChanged,
    TResult Function(_SendLink value)? sendLink,
  }) {
    return emailChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LinkEmailChanged value)? emailChanged,
    TResult Function(_SendLink value)? sendLink,
    required TResult orElse(),
  }) {
    if (emailChanged != null) {
      return emailChanged(this);
    }
    return orElse();
  }
}

abstract class _LinkEmailChanged implements SignInEmailLinkEvent {
  const factory _LinkEmailChanged(String email) = _$_LinkEmailChanged;

  String get email;
  @JsonKey(ignore: true)
  _$LinkEmailChangedCopyWith<_LinkEmailChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SendLinkCopyWith<$Res> {
  factory _$SendLinkCopyWith(_SendLink value, $Res Function(_SendLink) then) =
      __$SendLinkCopyWithImpl<$Res>;
}

/// @nodoc
class __$SendLinkCopyWithImpl<$Res>
    extends _$SignInEmailLinkEventCopyWithImpl<$Res>
    implements _$SendLinkCopyWith<$Res> {
  __$SendLinkCopyWithImpl(_SendLink _value, $Res Function(_SendLink) _then)
      : super(_value, (v) => _then(v as _SendLink));

  @override
  _SendLink get _value => super._value as _SendLink;
}

/// @nodoc

class _$_SendLink implements _SendLink {
  const _$_SendLink();

  @override
  String toString() {
    return 'SignInEmailLinkEvent.sendLink()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SendLink);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function() sendLink,
  }) {
    return sendLink();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function()? sendLink,
  }) {
    return sendLink?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function()? sendLink,
    required TResult orElse(),
  }) {
    if (sendLink != null) {
      return sendLink();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LinkEmailChanged value) emailChanged,
    required TResult Function(_SendLink value) sendLink,
  }) {
    return sendLink(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LinkEmailChanged value)? emailChanged,
    TResult Function(_SendLink value)? sendLink,
  }) {
    return sendLink?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LinkEmailChanged value)? emailChanged,
    TResult Function(_SendLink value)? sendLink,
    required TResult orElse(),
  }) {
    if (sendLink != null) {
      return sendLink(this);
    }
    return orElse();
  }
}

abstract class _SendLink implements SignInEmailLinkEvent {
  const factory _SendLink() = _$_SendLink;
}

/// @nodoc
class _$SignInEmailLinkStateTearOff {
  const _$SignInEmailLinkStateTearOff();

  _SignInEmailLinkState call(
      {String email = "",
      bool canSubmit = false,
      bool isLoading = false,
      bool isSuccess = false,
      String? errorText}) {
    return _SignInEmailLinkState(
      email: email,
      canSubmit: canSubmit,
      isLoading: isLoading,
      isSuccess: isSuccess,
      errorText: errorText,
    );
  }
}

/// @nodoc
const $SignInEmailLinkState = _$SignInEmailLinkStateTearOff();

/// @nodoc
mixin _$SignInEmailLinkState {
  String get email => throw _privateConstructorUsedError;
  bool get canSubmit => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  String? get errorText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignInEmailLinkStateCopyWith<SignInEmailLinkState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInEmailLinkStateCopyWith<$Res> {
  factory $SignInEmailLinkStateCopyWith(SignInEmailLinkState value,
          $Res Function(SignInEmailLinkState) then) =
      _$SignInEmailLinkStateCopyWithImpl<$Res>;
  $Res call(
      {String email,
      bool canSubmit,
      bool isLoading,
      bool isSuccess,
      String? errorText});
}

/// @nodoc
class _$SignInEmailLinkStateCopyWithImpl<$Res>
    implements $SignInEmailLinkStateCopyWith<$Res> {
  _$SignInEmailLinkStateCopyWithImpl(this._value, this._then);

  final SignInEmailLinkState _value;
  // ignore: unused_field
  final $Res Function(SignInEmailLinkState) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? canSubmit = freezed,
    Object? isLoading = freezed,
    Object? isSuccess = freezed,
    Object? errorText = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      canSubmit: canSubmit == freezed
          ? _value.canSubmit
          : canSubmit // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
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
abstract class _$SignInEmailLinkStateCopyWith<$Res>
    implements $SignInEmailLinkStateCopyWith<$Res> {
  factory _$SignInEmailLinkStateCopyWith(_SignInEmailLinkState value,
          $Res Function(_SignInEmailLinkState) then) =
      __$SignInEmailLinkStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String email,
      bool canSubmit,
      bool isLoading,
      bool isSuccess,
      String? errorText});
}

/// @nodoc
class __$SignInEmailLinkStateCopyWithImpl<$Res>
    extends _$SignInEmailLinkStateCopyWithImpl<$Res>
    implements _$SignInEmailLinkStateCopyWith<$Res> {
  __$SignInEmailLinkStateCopyWithImpl(
      _SignInEmailLinkState _value, $Res Function(_SignInEmailLinkState) _then)
      : super(_value, (v) => _then(v as _SignInEmailLinkState));

  @override
  _SignInEmailLinkState get _value => super._value as _SignInEmailLinkState;

  @override
  $Res call({
    Object? email = freezed,
    Object? canSubmit = freezed,
    Object? isLoading = freezed,
    Object? isSuccess = freezed,
    Object? errorText = freezed,
  }) {
    return _then(_SignInEmailLinkState(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      canSubmit: canSubmit == freezed
          ? _value.canSubmit
          : canSubmit // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
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

class _$_SignInEmailLinkState implements _SignInEmailLinkState {
  const _$_SignInEmailLinkState(
      {this.email = "",
      this.canSubmit = false,
      this.isLoading = false,
      this.isSuccess = false,
      this.errorText});

  @JsonKey()
  @override
  final String email;
  @JsonKey()
  @override
  final bool canSubmit;
  @JsonKey()
  @override
  final bool isLoading;
  @JsonKey()
  @override
  final bool isSuccess;
  @override
  final String? errorText;

  @override
  String toString() {
    return 'SignInEmailLinkState(email: $email, canSubmit: $canSubmit, isLoading: $isLoading, isSuccess: $isSuccess, errorText: $errorText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SignInEmailLinkState &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.canSubmit, canSubmit) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.isSuccess, isSuccess) &&
            const DeepCollectionEquality().equals(other.errorText, errorText));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(canSubmit),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isSuccess),
      const DeepCollectionEquality().hash(errorText));

  @JsonKey(ignore: true)
  @override
  _$SignInEmailLinkStateCopyWith<_SignInEmailLinkState> get copyWith =>
      __$SignInEmailLinkStateCopyWithImpl<_SignInEmailLinkState>(
          this, _$identity);
}

abstract class _SignInEmailLinkState implements SignInEmailLinkState {
  const factory _SignInEmailLinkState(
      {String email,
      bool canSubmit,
      bool isLoading,
      bool isSuccess,
      String? errorText}) = _$_SignInEmailLinkState;

  @override
  String get email;
  @override
  bool get canSubmit;
  @override
  bool get isLoading;
  @override
  bool get isSuccess;
  @override
  String? get errorText;
  @override
  @JsonKey(ignore: true)
  _$SignInEmailLinkStateCopyWith<_SignInEmailLinkState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$SignInPhoneEventTearOff {
  const _$SignInPhoneEventTearOff();

  _CountryChanged countryChanged(CountryWithPhoneCode country) {
    return _CountryChanged(
      country,
    );
  }

  _PhoneChanged phoneChanged(String input) {
    return _PhoneChanged(
      input,
    );
  }

  _VerifyPhone verifyPhone() {
    return const _VerifyPhone();
  }
}

/// @nodoc
const $SignInPhoneEvent = _$SignInPhoneEventTearOff();

/// @nodoc
mixin _$SignInPhoneEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CountryWithPhoneCode country) countryChanged,
    required TResult Function(String input) phoneChanged,
    required TResult Function() verifyPhone,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(CountryWithPhoneCode country)? countryChanged,
    TResult Function(String input)? phoneChanged,
    TResult Function()? verifyPhone,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CountryWithPhoneCode country)? countryChanged,
    TResult Function(String input)? phoneChanged,
    TResult Function()? verifyPhone,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CountryChanged value) countryChanged,
    required TResult Function(_PhoneChanged value) phoneChanged,
    required TResult Function(_VerifyPhone value) verifyPhone,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_CountryChanged value)? countryChanged,
    TResult Function(_PhoneChanged value)? phoneChanged,
    TResult Function(_VerifyPhone value)? verifyPhone,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CountryChanged value)? countryChanged,
    TResult Function(_PhoneChanged value)? phoneChanged,
    TResult Function(_VerifyPhone value)? verifyPhone,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInPhoneEventCopyWith<$Res> {
  factory $SignInPhoneEventCopyWith(
          SignInPhoneEvent value, $Res Function(SignInPhoneEvent) then) =
      _$SignInPhoneEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignInPhoneEventCopyWithImpl<$Res>
    implements $SignInPhoneEventCopyWith<$Res> {
  _$SignInPhoneEventCopyWithImpl(this._value, this._then);

  final SignInPhoneEvent _value;
  // ignore: unused_field
  final $Res Function(SignInPhoneEvent) _then;
}

/// @nodoc
abstract class _$CountryChangedCopyWith<$Res> {
  factory _$CountryChangedCopyWith(
          _CountryChanged value, $Res Function(_CountryChanged) then) =
      __$CountryChangedCopyWithImpl<$Res>;
  $Res call({CountryWithPhoneCode country});
}

/// @nodoc
class __$CountryChangedCopyWithImpl<$Res>
    extends _$SignInPhoneEventCopyWithImpl<$Res>
    implements _$CountryChangedCopyWith<$Res> {
  __$CountryChangedCopyWithImpl(
      _CountryChanged _value, $Res Function(_CountryChanged) _then)
      : super(_value, (v) => _then(v as _CountryChanged));

  @override
  _CountryChanged get _value => super._value as _CountryChanged;

  @override
  $Res call({
    Object? country = freezed,
  }) {
    return _then(_CountryChanged(
      country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as CountryWithPhoneCode,
    ));
  }
}

/// @nodoc

class _$_CountryChanged implements _CountryChanged {
  const _$_CountryChanged(this.country);

  @override
  final CountryWithPhoneCode country;

  @override
  String toString() {
    return 'SignInPhoneEvent.countryChanged(country: $country)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CountryChanged &&
            const DeepCollectionEquality().equals(other.country, country));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(country));

  @JsonKey(ignore: true)
  @override
  _$CountryChangedCopyWith<_CountryChanged> get copyWith =>
      __$CountryChangedCopyWithImpl<_CountryChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CountryWithPhoneCode country) countryChanged,
    required TResult Function(String input) phoneChanged,
    required TResult Function() verifyPhone,
  }) {
    return countryChanged(country);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(CountryWithPhoneCode country)? countryChanged,
    TResult Function(String input)? phoneChanged,
    TResult Function()? verifyPhone,
  }) {
    return countryChanged?.call(country);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CountryWithPhoneCode country)? countryChanged,
    TResult Function(String input)? phoneChanged,
    TResult Function()? verifyPhone,
    required TResult orElse(),
  }) {
    if (countryChanged != null) {
      return countryChanged(country);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CountryChanged value) countryChanged,
    required TResult Function(_PhoneChanged value) phoneChanged,
    required TResult Function(_VerifyPhone value) verifyPhone,
  }) {
    return countryChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_CountryChanged value)? countryChanged,
    TResult Function(_PhoneChanged value)? phoneChanged,
    TResult Function(_VerifyPhone value)? verifyPhone,
  }) {
    return countryChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CountryChanged value)? countryChanged,
    TResult Function(_PhoneChanged value)? phoneChanged,
    TResult Function(_VerifyPhone value)? verifyPhone,
    required TResult orElse(),
  }) {
    if (countryChanged != null) {
      return countryChanged(this);
    }
    return orElse();
  }
}

abstract class _CountryChanged implements SignInPhoneEvent {
  const factory _CountryChanged(CountryWithPhoneCode country) =
      _$_CountryChanged;

  CountryWithPhoneCode get country;
  @JsonKey(ignore: true)
  _$CountryChangedCopyWith<_CountryChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$PhoneChangedCopyWith<$Res> {
  factory _$PhoneChangedCopyWith(
          _PhoneChanged value, $Res Function(_PhoneChanged) then) =
      __$PhoneChangedCopyWithImpl<$Res>;
  $Res call({String input});
}

/// @nodoc
class __$PhoneChangedCopyWithImpl<$Res>
    extends _$SignInPhoneEventCopyWithImpl<$Res>
    implements _$PhoneChangedCopyWith<$Res> {
  __$PhoneChangedCopyWithImpl(
      _PhoneChanged _value, $Res Function(_PhoneChanged) _then)
      : super(_value, (v) => _then(v as _PhoneChanged));

  @override
  _PhoneChanged get _value => super._value as _PhoneChanged;

  @override
  $Res call({
    Object? input = freezed,
  }) {
    return _then(_PhoneChanged(
      input == freezed
          ? _value.input
          : input // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PhoneChanged implements _PhoneChanged {
  const _$_PhoneChanged(this.input);

  @override
  final String input;

  @override
  String toString() {
    return 'SignInPhoneEvent.phoneChanged(input: $input)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PhoneChanged &&
            const DeepCollectionEquality().equals(other.input, input));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(input));

  @JsonKey(ignore: true)
  @override
  _$PhoneChangedCopyWith<_PhoneChanged> get copyWith =>
      __$PhoneChangedCopyWithImpl<_PhoneChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CountryWithPhoneCode country) countryChanged,
    required TResult Function(String input) phoneChanged,
    required TResult Function() verifyPhone,
  }) {
    return phoneChanged(input);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(CountryWithPhoneCode country)? countryChanged,
    TResult Function(String input)? phoneChanged,
    TResult Function()? verifyPhone,
  }) {
    return phoneChanged?.call(input);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CountryWithPhoneCode country)? countryChanged,
    TResult Function(String input)? phoneChanged,
    TResult Function()? verifyPhone,
    required TResult orElse(),
  }) {
    if (phoneChanged != null) {
      return phoneChanged(input);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CountryChanged value) countryChanged,
    required TResult Function(_PhoneChanged value) phoneChanged,
    required TResult Function(_VerifyPhone value) verifyPhone,
  }) {
    return phoneChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_CountryChanged value)? countryChanged,
    TResult Function(_PhoneChanged value)? phoneChanged,
    TResult Function(_VerifyPhone value)? verifyPhone,
  }) {
    return phoneChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CountryChanged value)? countryChanged,
    TResult Function(_PhoneChanged value)? phoneChanged,
    TResult Function(_VerifyPhone value)? verifyPhone,
    required TResult orElse(),
  }) {
    if (phoneChanged != null) {
      return phoneChanged(this);
    }
    return orElse();
  }
}

abstract class _PhoneChanged implements SignInPhoneEvent {
  const factory _PhoneChanged(String input) = _$_PhoneChanged;

  String get input;
  @JsonKey(ignore: true)
  _$PhoneChangedCopyWith<_PhoneChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$VerifyPhoneCopyWith<$Res> {
  factory _$VerifyPhoneCopyWith(
          _VerifyPhone value, $Res Function(_VerifyPhone) then) =
      __$VerifyPhoneCopyWithImpl<$Res>;
}

/// @nodoc
class __$VerifyPhoneCopyWithImpl<$Res>
    extends _$SignInPhoneEventCopyWithImpl<$Res>
    implements _$VerifyPhoneCopyWith<$Res> {
  __$VerifyPhoneCopyWithImpl(
      _VerifyPhone _value, $Res Function(_VerifyPhone) _then)
      : super(_value, (v) => _then(v as _VerifyPhone));

  @override
  _VerifyPhone get _value => super._value as _VerifyPhone;
}

/// @nodoc

class _$_VerifyPhone implements _VerifyPhone {
  const _$_VerifyPhone();

  @override
  String toString() {
    return 'SignInPhoneEvent.verifyPhone()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _VerifyPhone);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CountryWithPhoneCode country) countryChanged,
    required TResult Function(String input) phoneChanged,
    required TResult Function() verifyPhone,
  }) {
    return verifyPhone();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(CountryWithPhoneCode country)? countryChanged,
    TResult Function(String input)? phoneChanged,
    TResult Function()? verifyPhone,
  }) {
    return verifyPhone?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CountryWithPhoneCode country)? countryChanged,
    TResult Function(String input)? phoneChanged,
    TResult Function()? verifyPhone,
    required TResult orElse(),
  }) {
    if (verifyPhone != null) {
      return verifyPhone();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CountryChanged value) countryChanged,
    required TResult Function(_PhoneChanged value) phoneChanged,
    required TResult Function(_VerifyPhone value) verifyPhone,
  }) {
    return verifyPhone(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_CountryChanged value)? countryChanged,
    TResult Function(_PhoneChanged value)? phoneChanged,
    TResult Function(_VerifyPhone value)? verifyPhone,
  }) {
    return verifyPhone?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CountryChanged value)? countryChanged,
    TResult Function(_PhoneChanged value)? phoneChanged,
    TResult Function(_VerifyPhone value)? verifyPhone,
    required TResult orElse(),
  }) {
    if (verifyPhone != null) {
      return verifyPhone(this);
    }
    return orElse();
  }
}

abstract class _VerifyPhone implements SignInPhoneEvent {
  const factory _VerifyPhone() = _$_VerifyPhone;
}

/// @nodoc
class _$SignInPhoneStateTearOff {
  const _$SignInPhoneStateTearOff();

  _SignInPhoneState call(
      {required CountryWithPhoneCode country,
      Map<String, dynamic>? phoneNumber,
      String? verificationId,
      bool canSubmit = false,
      bool isLoading = false,
      bool isSuccess = false,
      String? errorText}) {
    return _SignInPhoneState(
      country: country,
      phoneNumber: phoneNumber,
      verificationId: verificationId,
      canSubmit: canSubmit,
      isLoading: isLoading,
      isSuccess: isSuccess,
      errorText: errorText,
    );
  }
}

/// @nodoc
const $SignInPhoneState = _$SignInPhoneStateTearOff();

/// @nodoc
mixin _$SignInPhoneState {
  CountryWithPhoneCode get country => throw _privateConstructorUsedError;
  Map<String, dynamic>? get phoneNumber => throw _privateConstructorUsedError;
  String? get verificationId => throw _privateConstructorUsedError;
  bool get canSubmit => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  String? get errorText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignInPhoneStateCopyWith<SignInPhoneState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInPhoneStateCopyWith<$Res> {
  factory $SignInPhoneStateCopyWith(
          SignInPhoneState value, $Res Function(SignInPhoneState) then) =
      _$SignInPhoneStateCopyWithImpl<$Res>;
  $Res call(
      {CountryWithPhoneCode country,
      Map<String, dynamic>? phoneNumber,
      String? verificationId,
      bool canSubmit,
      bool isLoading,
      bool isSuccess,
      String? errorText});
}

/// @nodoc
class _$SignInPhoneStateCopyWithImpl<$Res>
    implements $SignInPhoneStateCopyWith<$Res> {
  _$SignInPhoneStateCopyWithImpl(this._value, this._then);

  final SignInPhoneState _value;
  // ignore: unused_field
  final $Res Function(SignInPhoneState) _then;

  @override
  $Res call({
    Object? country = freezed,
    Object? phoneNumber = freezed,
    Object? verificationId = freezed,
    Object? canSubmit = freezed,
    Object? isLoading = freezed,
    Object? isSuccess = freezed,
    Object? errorText = freezed,
  }) {
    return _then(_value.copyWith(
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as CountryWithPhoneCode,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      verificationId: verificationId == freezed
          ? _value.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as String?,
      canSubmit: canSubmit == freezed
          ? _value.canSubmit
          : canSubmit // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
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
abstract class _$SignInPhoneStateCopyWith<$Res>
    implements $SignInPhoneStateCopyWith<$Res> {
  factory _$SignInPhoneStateCopyWith(
          _SignInPhoneState value, $Res Function(_SignInPhoneState) then) =
      __$SignInPhoneStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {CountryWithPhoneCode country,
      Map<String, dynamic>? phoneNumber,
      String? verificationId,
      bool canSubmit,
      bool isLoading,
      bool isSuccess,
      String? errorText});
}

/// @nodoc
class __$SignInPhoneStateCopyWithImpl<$Res>
    extends _$SignInPhoneStateCopyWithImpl<$Res>
    implements _$SignInPhoneStateCopyWith<$Res> {
  __$SignInPhoneStateCopyWithImpl(
      _SignInPhoneState _value, $Res Function(_SignInPhoneState) _then)
      : super(_value, (v) => _then(v as _SignInPhoneState));

  @override
  _SignInPhoneState get _value => super._value as _SignInPhoneState;

  @override
  $Res call({
    Object? country = freezed,
    Object? phoneNumber = freezed,
    Object? verificationId = freezed,
    Object? canSubmit = freezed,
    Object? isLoading = freezed,
    Object? isSuccess = freezed,
    Object? errorText = freezed,
  }) {
    return _then(_SignInPhoneState(
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as CountryWithPhoneCode,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      verificationId: verificationId == freezed
          ? _value.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as String?,
      canSubmit: canSubmit == freezed
          ? _value.canSubmit
          : canSubmit // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
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

class _$_SignInPhoneState implements _SignInPhoneState {
  const _$_SignInPhoneState(
      {required this.country,
      this.phoneNumber,
      this.verificationId,
      this.canSubmit = false,
      this.isLoading = false,
      this.isSuccess = false,
      this.errorText});

  @override
  final CountryWithPhoneCode country;
  @override
  final Map<String, dynamic>? phoneNumber;
  @override
  final String? verificationId;
  @JsonKey()
  @override
  final bool canSubmit;
  @JsonKey()
  @override
  final bool isLoading;
  @JsonKey()
  @override
  final bool isSuccess;
  @override
  final String? errorText;

  @override
  String toString() {
    return 'SignInPhoneState(country: $country, phoneNumber: $phoneNumber, verificationId: $verificationId, canSubmit: $canSubmit, isLoading: $isLoading, isSuccess: $isSuccess, errorText: $errorText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SignInPhoneState &&
            const DeepCollectionEquality().equals(other.country, country) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality()
                .equals(other.verificationId, verificationId) &&
            const DeepCollectionEquality().equals(other.canSubmit, canSubmit) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.isSuccess, isSuccess) &&
            const DeepCollectionEquality().equals(other.errorText, errorText));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(country),
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(verificationId),
      const DeepCollectionEquality().hash(canSubmit),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isSuccess),
      const DeepCollectionEquality().hash(errorText));

  @JsonKey(ignore: true)
  @override
  _$SignInPhoneStateCopyWith<_SignInPhoneState> get copyWith =>
      __$SignInPhoneStateCopyWithImpl<_SignInPhoneState>(this, _$identity);
}

abstract class _SignInPhoneState implements SignInPhoneState {
  const factory _SignInPhoneState(
      {required CountryWithPhoneCode country,
      Map<String, dynamic>? phoneNumber,
      String? verificationId,
      bool canSubmit,
      bool isLoading,
      bool isSuccess,
      String? errorText}) = _$_SignInPhoneState;

  @override
  CountryWithPhoneCode get country;
  @override
  Map<String, dynamic>? get phoneNumber;
  @override
  String? get verificationId;
  @override
  bool get canSubmit;
  @override
  bool get isLoading;
  @override
  bool get isSuccess;
  @override
  String? get errorText;
  @override
  @JsonKey(ignore: true)
  _$SignInPhoneStateCopyWith<_SignInPhoneState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$SignInPhoneVerificationEventTearOff {
  const _$SignInPhoneVerificationEventTearOff();

  _ResendCode resendCode() {
    return const _ResendCode();
  }

  _CodeChanged codeChanged(String input) {
    return _CodeChanged(
      input,
    );
  }

  _VerifyCode verifyCode() {
    return const _VerifyCode();
  }
}

/// @nodoc
const $SignInPhoneVerificationEvent = _$SignInPhoneVerificationEventTearOff();

/// @nodoc
mixin _$SignInPhoneVerificationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() resendCode,
    required TResult Function(String input) codeChanged,
    required TResult Function() verifyCode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? resendCode,
    TResult Function(String input)? codeChanged,
    TResult Function()? verifyCode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? resendCode,
    TResult Function(String input)? codeChanged,
    TResult Function()? verifyCode,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ResendCode value) resendCode,
    required TResult Function(_CodeChanged value) codeChanged,
    required TResult Function(_VerifyCode value) verifyCode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ResendCode value)? resendCode,
    TResult Function(_CodeChanged value)? codeChanged,
    TResult Function(_VerifyCode value)? verifyCode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ResendCode value)? resendCode,
    TResult Function(_CodeChanged value)? codeChanged,
    TResult Function(_VerifyCode value)? verifyCode,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInPhoneVerificationEventCopyWith<$Res> {
  factory $SignInPhoneVerificationEventCopyWith(
          SignInPhoneVerificationEvent value,
          $Res Function(SignInPhoneVerificationEvent) then) =
      _$SignInPhoneVerificationEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignInPhoneVerificationEventCopyWithImpl<$Res>
    implements $SignInPhoneVerificationEventCopyWith<$Res> {
  _$SignInPhoneVerificationEventCopyWithImpl(this._value, this._then);

  final SignInPhoneVerificationEvent _value;
  // ignore: unused_field
  final $Res Function(SignInPhoneVerificationEvent) _then;
}

/// @nodoc
abstract class _$ResendCodeCopyWith<$Res> {
  factory _$ResendCodeCopyWith(
          _ResendCode value, $Res Function(_ResendCode) then) =
      __$ResendCodeCopyWithImpl<$Res>;
}

/// @nodoc
class __$ResendCodeCopyWithImpl<$Res>
    extends _$SignInPhoneVerificationEventCopyWithImpl<$Res>
    implements _$ResendCodeCopyWith<$Res> {
  __$ResendCodeCopyWithImpl(
      _ResendCode _value, $Res Function(_ResendCode) _then)
      : super(_value, (v) => _then(v as _ResendCode));

  @override
  _ResendCode get _value => super._value as _ResendCode;
}

/// @nodoc

class _$_ResendCode implements _ResendCode {
  const _$_ResendCode();

  @override
  String toString() {
    return 'SignInPhoneVerificationEvent.resendCode()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ResendCode);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() resendCode,
    required TResult Function(String input) codeChanged,
    required TResult Function() verifyCode,
  }) {
    return resendCode();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? resendCode,
    TResult Function(String input)? codeChanged,
    TResult Function()? verifyCode,
  }) {
    return resendCode?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? resendCode,
    TResult Function(String input)? codeChanged,
    TResult Function()? verifyCode,
    required TResult orElse(),
  }) {
    if (resendCode != null) {
      return resendCode();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ResendCode value) resendCode,
    required TResult Function(_CodeChanged value) codeChanged,
    required TResult Function(_VerifyCode value) verifyCode,
  }) {
    return resendCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ResendCode value)? resendCode,
    TResult Function(_CodeChanged value)? codeChanged,
    TResult Function(_VerifyCode value)? verifyCode,
  }) {
    return resendCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ResendCode value)? resendCode,
    TResult Function(_CodeChanged value)? codeChanged,
    TResult Function(_VerifyCode value)? verifyCode,
    required TResult orElse(),
  }) {
    if (resendCode != null) {
      return resendCode(this);
    }
    return orElse();
  }
}

abstract class _ResendCode implements SignInPhoneVerificationEvent {
  const factory _ResendCode() = _$_ResendCode;
}

/// @nodoc
abstract class _$CodeChangedCopyWith<$Res> {
  factory _$CodeChangedCopyWith(
          _CodeChanged value, $Res Function(_CodeChanged) then) =
      __$CodeChangedCopyWithImpl<$Res>;
  $Res call({String input});
}

/// @nodoc
class __$CodeChangedCopyWithImpl<$Res>
    extends _$SignInPhoneVerificationEventCopyWithImpl<$Res>
    implements _$CodeChangedCopyWith<$Res> {
  __$CodeChangedCopyWithImpl(
      _CodeChanged _value, $Res Function(_CodeChanged) _then)
      : super(_value, (v) => _then(v as _CodeChanged));

  @override
  _CodeChanged get _value => super._value as _CodeChanged;

  @override
  $Res call({
    Object? input = freezed,
  }) {
    return _then(_CodeChanged(
      input == freezed
          ? _value.input
          : input // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CodeChanged implements _CodeChanged {
  const _$_CodeChanged(this.input);

  @override
  final String input;

  @override
  String toString() {
    return 'SignInPhoneVerificationEvent.codeChanged(input: $input)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CodeChanged &&
            const DeepCollectionEquality().equals(other.input, input));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(input));

  @JsonKey(ignore: true)
  @override
  _$CodeChangedCopyWith<_CodeChanged> get copyWith =>
      __$CodeChangedCopyWithImpl<_CodeChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() resendCode,
    required TResult Function(String input) codeChanged,
    required TResult Function() verifyCode,
  }) {
    return codeChanged(input);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? resendCode,
    TResult Function(String input)? codeChanged,
    TResult Function()? verifyCode,
  }) {
    return codeChanged?.call(input);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? resendCode,
    TResult Function(String input)? codeChanged,
    TResult Function()? verifyCode,
    required TResult orElse(),
  }) {
    if (codeChanged != null) {
      return codeChanged(input);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ResendCode value) resendCode,
    required TResult Function(_CodeChanged value) codeChanged,
    required TResult Function(_VerifyCode value) verifyCode,
  }) {
    return codeChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ResendCode value)? resendCode,
    TResult Function(_CodeChanged value)? codeChanged,
    TResult Function(_VerifyCode value)? verifyCode,
  }) {
    return codeChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ResendCode value)? resendCode,
    TResult Function(_CodeChanged value)? codeChanged,
    TResult Function(_VerifyCode value)? verifyCode,
    required TResult orElse(),
  }) {
    if (codeChanged != null) {
      return codeChanged(this);
    }
    return orElse();
  }
}

abstract class _CodeChanged implements SignInPhoneVerificationEvent {
  const factory _CodeChanged(String input) = _$_CodeChanged;

  String get input;
  @JsonKey(ignore: true)
  _$CodeChangedCopyWith<_CodeChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$VerifyCodeCopyWith<$Res> {
  factory _$VerifyCodeCopyWith(
          _VerifyCode value, $Res Function(_VerifyCode) then) =
      __$VerifyCodeCopyWithImpl<$Res>;
}

/// @nodoc
class __$VerifyCodeCopyWithImpl<$Res>
    extends _$SignInPhoneVerificationEventCopyWithImpl<$Res>
    implements _$VerifyCodeCopyWith<$Res> {
  __$VerifyCodeCopyWithImpl(
      _VerifyCode _value, $Res Function(_VerifyCode) _then)
      : super(_value, (v) => _then(v as _VerifyCode));

  @override
  _VerifyCode get _value => super._value as _VerifyCode;
}

/// @nodoc

class _$_VerifyCode implements _VerifyCode {
  const _$_VerifyCode();

  @override
  String toString() {
    return 'SignInPhoneVerificationEvent.verifyCode()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _VerifyCode);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() resendCode,
    required TResult Function(String input) codeChanged,
    required TResult Function() verifyCode,
  }) {
    return verifyCode();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? resendCode,
    TResult Function(String input)? codeChanged,
    TResult Function()? verifyCode,
  }) {
    return verifyCode?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? resendCode,
    TResult Function(String input)? codeChanged,
    TResult Function()? verifyCode,
    required TResult orElse(),
  }) {
    if (verifyCode != null) {
      return verifyCode();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ResendCode value) resendCode,
    required TResult Function(_CodeChanged value) codeChanged,
    required TResult Function(_VerifyCode value) verifyCode,
  }) {
    return verifyCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ResendCode value)? resendCode,
    TResult Function(_CodeChanged value)? codeChanged,
    TResult Function(_VerifyCode value)? verifyCode,
  }) {
    return verifyCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ResendCode value)? resendCode,
    TResult Function(_CodeChanged value)? codeChanged,
    TResult Function(_VerifyCode value)? verifyCode,
    required TResult orElse(),
  }) {
    if (verifyCode != null) {
      return verifyCode(this);
    }
    return orElse();
  }
}

abstract class _VerifyCode implements SignInPhoneVerificationEvent {
  const factory _VerifyCode() = _$_VerifyCode;
}

/// @nodoc
class _$SignInPhoneVerificationStateTearOff {
  const _$SignInPhoneVerificationStateTearOff();

  _SignInPhoneVerificationState call(
      {int countdown = delayBeforeUserCanRequestNewCode,
      required Map<String, dynamic> phoneNumber,
      required String verificationId,
      String verificationCode = "",
      bool canSubmit = false,
      bool isLoading = false,
      bool isSuccess = false,
      String? errorText}) {
    return _SignInPhoneVerificationState(
      countdown: countdown,
      phoneNumber: phoneNumber,
      verificationId: verificationId,
      verificationCode: verificationCode,
      canSubmit: canSubmit,
      isLoading: isLoading,
      isSuccess: isSuccess,
      errorText: errorText,
    );
  }
}

/// @nodoc
const $SignInPhoneVerificationState = _$SignInPhoneVerificationStateTearOff();

/// @nodoc
mixin _$SignInPhoneVerificationState {
  int get countdown => throw _privateConstructorUsedError;
  Map<String, dynamic> get phoneNumber => throw _privateConstructorUsedError;
  String get verificationId => throw _privateConstructorUsedError;
  String get verificationCode => throw _privateConstructorUsedError;
  bool get canSubmit => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  String? get errorText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignInPhoneVerificationStateCopyWith<SignInPhoneVerificationState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInPhoneVerificationStateCopyWith<$Res> {
  factory $SignInPhoneVerificationStateCopyWith(
          SignInPhoneVerificationState value,
          $Res Function(SignInPhoneVerificationState) then) =
      _$SignInPhoneVerificationStateCopyWithImpl<$Res>;
  $Res call(
      {int countdown,
      Map<String, dynamic> phoneNumber,
      String verificationId,
      String verificationCode,
      bool canSubmit,
      bool isLoading,
      bool isSuccess,
      String? errorText});
}

/// @nodoc
class _$SignInPhoneVerificationStateCopyWithImpl<$Res>
    implements $SignInPhoneVerificationStateCopyWith<$Res> {
  _$SignInPhoneVerificationStateCopyWithImpl(this._value, this._then);

  final SignInPhoneVerificationState _value;
  // ignore: unused_field
  final $Res Function(SignInPhoneVerificationState) _then;

  @override
  $Res call({
    Object? countdown = freezed,
    Object? phoneNumber = freezed,
    Object? verificationId = freezed,
    Object? verificationCode = freezed,
    Object? canSubmit = freezed,
    Object? isLoading = freezed,
    Object? isSuccess = freezed,
    Object? errorText = freezed,
  }) {
    return _then(_value.copyWith(
      countdown: countdown == freezed
          ? _value.countdown
          : countdown // ignore: cast_nullable_to_non_nullable
              as int,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      verificationId: verificationId == freezed
          ? _value.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as String,
      verificationCode: verificationCode == freezed
          ? _value.verificationCode
          : verificationCode // ignore: cast_nullable_to_non_nullable
              as String,
      canSubmit: canSubmit == freezed
          ? _value.canSubmit
          : canSubmit // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
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
abstract class _$SignInPhoneVerificationStateCopyWith<$Res>
    implements $SignInPhoneVerificationStateCopyWith<$Res> {
  factory _$SignInPhoneVerificationStateCopyWith(
          _SignInPhoneVerificationState value,
          $Res Function(_SignInPhoneVerificationState) then) =
      __$SignInPhoneVerificationStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {int countdown,
      Map<String, dynamic> phoneNumber,
      String verificationId,
      String verificationCode,
      bool canSubmit,
      bool isLoading,
      bool isSuccess,
      String? errorText});
}

/// @nodoc
class __$SignInPhoneVerificationStateCopyWithImpl<$Res>
    extends _$SignInPhoneVerificationStateCopyWithImpl<$Res>
    implements _$SignInPhoneVerificationStateCopyWith<$Res> {
  __$SignInPhoneVerificationStateCopyWithImpl(
      _SignInPhoneVerificationState _value,
      $Res Function(_SignInPhoneVerificationState) _then)
      : super(_value, (v) => _then(v as _SignInPhoneVerificationState));

  @override
  _SignInPhoneVerificationState get _value =>
      super._value as _SignInPhoneVerificationState;

  @override
  $Res call({
    Object? countdown = freezed,
    Object? phoneNumber = freezed,
    Object? verificationId = freezed,
    Object? verificationCode = freezed,
    Object? canSubmit = freezed,
    Object? isLoading = freezed,
    Object? isSuccess = freezed,
    Object? errorText = freezed,
  }) {
    return _then(_SignInPhoneVerificationState(
      countdown: countdown == freezed
          ? _value.countdown
          : countdown // ignore: cast_nullable_to_non_nullable
              as int,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      verificationId: verificationId == freezed
          ? _value.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as String,
      verificationCode: verificationCode == freezed
          ? _value.verificationCode
          : verificationCode // ignore: cast_nullable_to_non_nullable
              as String,
      canSubmit: canSubmit == freezed
          ? _value.canSubmit
          : canSubmit // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
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

class _$_SignInPhoneVerificationState implements _SignInPhoneVerificationState {
  const _$_SignInPhoneVerificationState(
      {this.countdown = delayBeforeUserCanRequestNewCode,
      required this.phoneNumber,
      required this.verificationId,
      this.verificationCode = "",
      this.canSubmit = false,
      this.isLoading = false,
      this.isSuccess = false,
      this.errorText});

  @JsonKey()
  @override
  final int countdown;
  @override
  final Map<String, dynamic> phoneNumber;
  @override
  final String verificationId;
  @JsonKey()
  @override
  final String verificationCode;
  @JsonKey()
  @override
  final bool canSubmit;
  @JsonKey()
  @override
  final bool isLoading;
  @JsonKey()
  @override
  final bool isSuccess;
  @override
  final String? errorText;

  @override
  String toString() {
    return 'SignInPhoneVerificationState(countdown: $countdown, phoneNumber: $phoneNumber, verificationId: $verificationId, verificationCode: $verificationCode, canSubmit: $canSubmit, isLoading: $isLoading, isSuccess: $isSuccess, errorText: $errorText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SignInPhoneVerificationState &&
            const DeepCollectionEquality().equals(other.countdown, countdown) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality()
                .equals(other.verificationId, verificationId) &&
            const DeepCollectionEquality()
                .equals(other.verificationCode, verificationCode) &&
            const DeepCollectionEquality().equals(other.canSubmit, canSubmit) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.isSuccess, isSuccess) &&
            const DeepCollectionEquality().equals(other.errorText, errorText));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(countdown),
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(verificationId),
      const DeepCollectionEquality().hash(verificationCode),
      const DeepCollectionEquality().hash(canSubmit),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isSuccess),
      const DeepCollectionEquality().hash(errorText));

  @JsonKey(ignore: true)
  @override
  _$SignInPhoneVerificationStateCopyWith<_SignInPhoneVerificationState>
      get copyWith => __$SignInPhoneVerificationStateCopyWithImpl<
          _SignInPhoneVerificationState>(this, _$identity);
}

abstract class _SignInPhoneVerificationState
    implements SignInPhoneVerificationState {
  const factory _SignInPhoneVerificationState(
      {int countdown,
      required Map<String, dynamic> phoneNumber,
      required String verificationId,
      String verificationCode,
      bool canSubmit,
      bool isLoading,
      bool isSuccess,
      String? errorText}) = _$_SignInPhoneVerificationState;

  @override
  int get countdown;
  @override
  Map<String, dynamic> get phoneNumber;
  @override
  String get verificationId;
  @override
  String get verificationCode;
  @override
  bool get canSubmit;
  @override
  bool get isLoading;
  @override
  bool get isSuccess;
  @override
  String? get errorText;
  @override
  @JsonKey(ignore: true)
  _$SignInPhoneVerificationStateCopyWith<_SignInPhoneVerificationState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$AuthStateTearOff {
  const _$AuthStateTearOff();

  _InitializingAuth initializing() {
    return const _InitializingAuth();
  }

  _NotAuthed notAuthed() {
    return const _NotAuthed();
  }

  _WaitingUserCreation waitingUserCreation() {
    return const _WaitingUserCreation();
  }

  _NeedUserInformation needUserInformation() {
    return const _NeedUserInformation();
  }

  _Authed authed(dynamic user) {
    return _Authed(
      user,
    );
  }

  _AuthError error(String error) {
    return _AuthError(
      error,
    );
  }
}

/// @nodoc
const $AuthState = _$AuthStateTearOff();

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function() notAuthed,
    required TResult Function() waitingUserCreation,
    required TResult Function() needUserInformation,
    required TResult Function(dynamic user) authed,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function()? notAuthed,
    TResult Function()? waitingUserCreation,
    TResult Function()? needUserInformation,
    TResult Function(dynamic user)? authed,
    TResult Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function()? notAuthed,
    TResult Function()? waitingUserCreation,
    TResult Function()? needUserInformation,
    TResult Function(dynamic user)? authed,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitializingAuth value) initializing,
    required TResult Function(_NotAuthed value) notAuthed,
    required TResult Function(_WaitingUserCreation value) waitingUserCreation,
    required TResult Function(_NeedUserInformation value) needUserInformation,
    required TResult Function(_Authed value) authed,
    required TResult Function(_AuthError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitializingAuth value)? initializing,
    TResult Function(_NotAuthed value)? notAuthed,
    TResult Function(_WaitingUserCreation value)? waitingUserCreation,
    TResult Function(_NeedUserInformation value)? needUserInformation,
    TResult Function(_Authed value)? authed,
    TResult Function(_AuthError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitializingAuth value)? initializing,
    TResult Function(_NotAuthed value)? notAuthed,
    TResult Function(_WaitingUserCreation value)? waitingUserCreation,
    TResult Function(_NeedUserInformation value)? needUserInformation,
    TResult Function(_Authed value)? authed,
    TResult Function(_AuthError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;
}

/// @nodoc
abstract class _$InitializingAuthCopyWith<$Res> {
  factory _$InitializingAuthCopyWith(
          _InitializingAuth value, $Res Function(_InitializingAuth) then) =
      __$InitializingAuthCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitializingAuthCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements _$InitializingAuthCopyWith<$Res> {
  __$InitializingAuthCopyWithImpl(
      _InitializingAuth _value, $Res Function(_InitializingAuth) _then)
      : super(_value, (v) => _then(v as _InitializingAuth));

  @override
  _InitializingAuth get _value => super._value as _InitializingAuth;
}

/// @nodoc

class _$_InitializingAuth implements _InitializingAuth {
  const _$_InitializingAuth();

  @override
  String toString() {
    return 'AuthState.initializing()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _InitializingAuth);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function() notAuthed,
    required TResult Function() waitingUserCreation,
    required TResult Function() needUserInformation,
    required TResult Function(dynamic user) authed,
    required TResult Function(String error) error,
  }) {
    return initializing();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function()? notAuthed,
    TResult Function()? waitingUserCreation,
    TResult Function()? needUserInformation,
    TResult Function(dynamic user)? authed,
    TResult Function(String error)? error,
  }) {
    return initializing?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function()? notAuthed,
    TResult Function()? waitingUserCreation,
    TResult Function()? needUserInformation,
    TResult Function(dynamic user)? authed,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (initializing != null) {
      return initializing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitializingAuth value) initializing,
    required TResult Function(_NotAuthed value) notAuthed,
    required TResult Function(_WaitingUserCreation value) waitingUserCreation,
    required TResult Function(_NeedUserInformation value) needUserInformation,
    required TResult Function(_Authed value) authed,
    required TResult Function(_AuthError value) error,
  }) {
    return initializing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitializingAuth value)? initializing,
    TResult Function(_NotAuthed value)? notAuthed,
    TResult Function(_WaitingUserCreation value)? waitingUserCreation,
    TResult Function(_NeedUserInformation value)? needUserInformation,
    TResult Function(_Authed value)? authed,
    TResult Function(_AuthError value)? error,
  }) {
    return initializing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitializingAuth value)? initializing,
    TResult Function(_NotAuthed value)? notAuthed,
    TResult Function(_WaitingUserCreation value)? waitingUserCreation,
    TResult Function(_NeedUserInformation value)? needUserInformation,
    TResult Function(_Authed value)? authed,
    TResult Function(_AuthError value)? error,
    required TResult orElse(),
  }) {
    if (initializing != null) {
      return initializing(this);
    }
    return orElse();
  }
}

abstract class _InitializingAuth implements AuthState {
  const factory _InitializingAuth() = _$_InitializingAuth;
}

/// @nodoc
abstract class _$NotAuthedCopyWith<$Res> {
  factory _$NotAuthedCopyWith(
          _NotAuthed value, $Res Function(_NotAuthed) then) =
      __$NotAuthedCopyWithImpl<$Res>;
}

/// @nodoc
class __$NotAuthedCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$NotAuthedCopyWith<$Res> {
  __$NotAuthedCopyWithImpl(_NotAuthed _value, $Res Function(_NotAuthed) _then)
      : super(_value, (v) => _then(v as _NotAuthed));

  @override
  _NotAuthed get _value => super._value as _NotAuthed;
}

/// @nodoc

class _$_NotAuthed implements _NotAuthed {
  const _$_NotAuthed();

  @override
  String toString() {
    return 'AuthState.notAuthed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _NotAuthed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function() notAuthed,
    required TResult Function() waitingUserCreation,
    required TResult Function() needUserInformation,
    required TResult Function(dynamic user) authed,
    required TResult Function(String error) error,
  }) {
    return notAuthed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function()? notAuthed,
    TResult Function()? waitingUserCreation,
    TResult Function()? needUserInformation,
    TResult Function(dynamic user)? authed,
    TResult Function(String error)? error,
  }) {
    return notAuthed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function()? notAuthed,
    TResult Function()? waitingUserCreation,
    TResult Function()? needUserInformation,
    TResult Function(dynamic user)? authed,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (notAuthed != null) {
      return notAuthed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitializingAuth value) initializing,
    required TResult Function(_NotAuthed value) notAuthed,
    required TResult Function(_WaitingUserCreation value) waitingUserCreation,
    required TResult Function(_NeedUserInformation value) needUserInformation,
    required TResult Function(_Authed value) authed,
    required TResult Function(_AuthError value) error,
  }) {
    return notAuthed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitializingAuth value)? initializing,
    TResult Function(_NotAuthed value)? notAuthed,
    TResult Function(_WaitingUserCreation value)? waitingUserCreation,
    TResult Function(_NeedUserInformation value)? needUserInformation,
    TResult Function(_Authed value)? authed,
    TResult Function(_AuthError value)? error,
  }) {
    return notAuthed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitializingAuth value)? initializing,
    TResult Function(_NotAuthed value)? notAuthed,
    TResult Function(_WaitingUserCreation value)? waitingUserCreation,
    TResult Function(_NeedUserInformation value)? needUserInformation,
    TResult Function(_Authed value)? authed,
    TResult Function(_AuthError value)? error,
    required TResult orElse(),
  }) {
    if (notAuthed != null) {
      return notAuthed(this);
    }
    return orElse();
  }
}

abstract class _NotAuthed implements AuthState {
  const factory _NotAuthed() = _$_NotAuthed;
}

/// @nodoc
abstract class _$WaitingUserCreationCopyWith<$Res> {
  factory _$WaitingUserCreationCopyWith(_WaitingUserCreation value,
          $Res Function(_WaitingUserCreation) then) =
      __$WaitingUserCreationCopyWithImpl<$Res>;
}

/// @nodoc
class __$WaitingUserCreationCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements _$WaitingUserCreationCopyWith<$Res> {
  __$WaitingUserCreationCopyWithImpl(
      _WaitingUserCreation _value, $Res Function(_WaitingUserCreation) _then)
      : super(_value, (v) => _then(v as _WaitingUserCreation));

  @override
  _WaitingUserCreation get _value => super._value as _WaitingUserCreation;
}

/// @nodoc

class _$_WaitingUserCreation implements _WaitingUserCreation {
  const _$_WaitingUserCreation();

  @override
  String toString() {
    return 'AuthState.waitingUserCreation()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _WaitingUserCreation);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function() notAuthed,
    required TResult Function() waitingUserCreation,
    required TResult Function() needUserInformation,
    required TResult Function(dynamic user) authed,
    required TResult Function(String error) error,
  }) {
    return waitingUserCreation();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function()? notAuthed,
    TResult Function()? waitingUserCreation,
    TResult Function()? needUserInformation,
    TResult Function(dynamic user)? authed,
    TResult Function(String error)? error,
  }) {
    return waitingUserCreation?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function()? notAuthed,
    TResult Function()? waitingUserCreation,
    TResult Function()? needUserInformation,
    TResult Function(dynamic user)? authed,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (waitingUserCreation != null) {
      return waitingUserCreation();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitializingAuth value) initializing,
    required TResult Function(_NotAuthed value) notAuthed,
    required TResult Function(_WaitingUserCreation value) waitingUserCreation,
    required TResult Function(_NeedUserInformation value) needUserInformation,
    required TResult Function(_Authed value) authed,
    required TResult Function(_AuthError value) error,
  }) {
    return waitingUserCreation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitializingAuth value)? initializing,
    TResult Function(_NotAuthed value)? notAuthed,
    TResult Function(_WaitingUserCreation value)? waitingUserCreation,
    TResult Function(_NeedUserInformation value)? needUserInformation,
    TResult Function(_Authed value)? authed,
    TResult Function(_AuthError value)? error,
  }) {
    return waitingUserCreation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitializingAuth value)? initializing,
    TResult Function(_NotAuthed value)? notAuthed,
    TResult Function(_WaitingUserCreation value)? waitingUserCreation,
    TResult Function(_NeedUserInformation value)? needUserInformation,
    TResult Function(_Authed value)? authed,
    TResult Function(_AuthError value)? error,
    required TResult orElse(),
  }) {
    if (waitingUserCreation != null) {
      return waitingUserCreation(this);
    }
    return orElse();
  }
}

abstract class _WaitingUserCreation implements AuthState {
  const factory _WaitingUserCreation() = _$_WaitingUserCreation;
}

/// @nodoc
abstract class _$NeedUserInformationCopyWith<$Res> {
  factory _$NeedUserInformationCopyWith(_NeedUserInformation value,
          $Res Function(_NeedUserInformation) then) =
      __$NeedUserInformationCopyWithImpl<$Res>;
}

/// @nodoc
class __$NeedUserInformationCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements _$NeedUserInformationCopyWith<$Res> {
  __$NeedUserInformationCopyWithImpl(
      _NeedUserInformation _value, $Res Function(_NeedUserInformation) _then)
      : super(_value, (v) => _then(v as _NeedUserInformation));

  @override
  _NeedUserInformation get _value => super._value as _NeedUserInformation;
}

/// @nodoc

class _$_NeedUserInformation implements _NeedUserInformation {
  const _$_NeedUserInformation();

  @override
  String toString() {
    return 'AuthState.needUserInformation()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _NeedUserInformation);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function() notAuthed,
    required TResult Function() waitingUserCreation,
    required TResult Function() needUserInformation,
    required TResult Function(dynamic user) authed,
    required TResult Function(String error) error,
  }) {
    return needUserInformation();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function()? notAuthed,
    TResult Function()? waitingUserCreation,
    TResult Function()? needUserInformation,
    TResult Function(dynamic user)? authed,
    TResult Function(String error)? error,
  }) {
    return needUserInformation?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function()? notAuthed,
    TResult Function()? waitingUserCreation,
    TResult Function()? needUserInformation,
    TResult Function(dynamic user)? authed,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (needUserInformation != null) {
      return needUserInformation();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitializingAuth value) initializing,
    required TResult Function(_NotAuthed value) notAuthed,
    required TResult Function(_WaitingUserCreation value) waitingUserCreation,
    required TResult Function(_NeedUserInformation value) needUserInformation,
    required TResult Function(_Authed value) authed,
    required TResult Function(_AuthError value) error,
  }) {
    return needUserInformation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitializingAuth value)? initializing,
    TResult Function(_NotAuthed value)? notAuthed,
    TResult Function(_WaitingUserCreation value)? waitingUserCreation,
    TResult Function(_NeedUserInformation value)? needUserInformation,
    TResult Function(_Authed value)? authed,
    TResult Function(_AuthError value)? error,
  }) {
    return needUserInformation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitializingAuth value)? initializing,
    TResult Function(_NotAuthed value)? notAuthed,
    TResult Function(_WaitingUserCreation value)? waitingUserCreation,
    TResult Function(_NeedUserInformation value)? needUserInformation,
    TResult Function(_Authed value)? authed,
    TResult Function(_AuthError value)? error,
    required TResult orElse(),
  }) {
    if (needUserInformation != null) {
      return needUserInformation(this);
    }
    return orElse();
  }
}

abstract class _NeedUserInformation implements AuthState {
  const factory _NeedUserInformation() = _$_NeedUserInformation;
}

/// @nodoc
abstract class _$AuthedCopyWith<$Res> {
  factory _$AuthedCopyWith(_Authed value, $Res Function(_Authed) then) =
      __$AuthedCopyWithImpl<$Res>;
  $Res call({dynamic user});
}

/// @nodoc
class __$AuthedCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$AuthedCopyWith<$Res> {
  __$AuthedCopyWithImpl(_Authed _value, $Res Function(_Authed) _then)
      : super(_value, (v) => _then(v as _Authed));

  @override
  _Authed get _value => super._value as _Authed;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_Authed(
      user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$_Authed implements _Authed {
  const _$_Authed(this.user);

  @override
  final dynamic user;

  @override
  String toString() {
    return 'AuthState.authed(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Authed &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  _$AuthedCopyWith<_Authed> get copyWith =>
      __$AuthedCopyWithImpl<_Authed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function() notAuthed,
    required TResult Function() waitingUserCreation,
    required TResult Function() needUserInformation,
    required TResult Function(dynamic user) authed,
    required TResult Function(String error) error,
  }) {
    return authed(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function()? notAuthed,
    TResult Function()? waitingUserCreation,
    TResult Function()? needUserInformation,
    TResult Function(dynamic user)? authed,
    TResult Function(String error)? error,
  }) {
    return authed?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function()? notAuthed,
    TResult Function()? waitingUserCreation,
    TResult Function()? needUserInformation,
    TResult Function(dynamic user)? authed,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (authed != null) {
      return authed(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitializingAuth value) initializing,
    required TResult Function(_NotAuthed value) notAuthed,
    required TResult Function(_WaitingUserCreation value) waitingUserCreation,
    required TResult Function(_NeedUserInformation value) needUserInformation,
    required TResult Function(_Authed value) authed,
    required TResult Function(_AuthError value) error,
  }) {
    return authed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitializingAuth value)? initializing,
    TResult Function(_NotAuthed value)? notAuthed,
    TResult Function(_WaitingUserCreation value)? waitingUserCreation,
    TResult Function(_NeedUserInformation value)? needUserInformation,
    TResult Function(_Authed value)? authed,
    TResult Function(_AuthError value)? error,
  }) {
    return authed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitializingAuth value)? initializing,
    TResult Function(_NotAuthed value)? notAuthed,
    TResult Function(_WaitingUserCreation value)? waitingUserCreation,
    TResult Function(_NeedUserInformation value)? needUserInformation,
    TResult Function(_Authed value)? authed,
    TResult Function(_AuthError value)? error,
    required TResult orElse(),
  }) {
    if (authed != null) {
      return authed(this);
    }
    return orElse();
  }
}

abstract class _Authed implements AuthState {
  const factory _Authed(dynamic user) = _$_Authed;

  dynamic get user;
  @JsonKey(ignore: true)
  _$AuthedCopyWith<_Authed> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$AuthErrorCopyWith<$Res> {
  factory _$AuthErrorCopyWith(
          _AuthError value, $Res Function(_AuthError) then) =
      __$AuthErrorCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class __$AuthErrorCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$AuthErrorCopyWith<$Res> {
  __$AuthErrorCopyWithImpl(_AuthError _value, $Res Function(_AuthError) _then)
      : super(_value, (v) => _then(v as _AuthError));

  @override
  _AuthError get _value => super._value as _AuthError;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_AuthError(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AuthError implements _AuthError {
  const _$_AuthError(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'AuthState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthError &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$AuthErrorCopyWith<_AuthError> get copyWith =>
      __$AuthErrorCopyWithImpl<_AuthError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function() notAuthed,
    required TResult Function() waitingUserCreation,
    required TResult Function() needUserInformation,
    required TResult Function(dynamic user) authed,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function()? notAuthed,
    TResult Function()? waitingUserCreation,
    TResult Function()? needUserInformation,
    TResult Function(dynamic user)? authed,
    TResult Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function()? notAuthed,
    TResult Function()? waitingUserCreation,
    TResult Function()? needUserInformation,
    TResult Function(dynamic user)? authed,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitializingAuth value) initializing,
    required TResult Function(_NotAuthed value) notAuthed,
    required TResult Function(_WaitingUserCreation value) waitingUserCreation,
    required TResult Function(_NeedUserInformation value) needUserInformation,
    required TResult Function(_Authed value) authed,
    required TResult Function(_AuthError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitializingAuth value)? initializing,
    TResult Function(_NotAuthed value)? notAuthed,
    TResult Function(_WaitingUserCreation value)? waitingUserCreation,
    TResult Function(_NeedUserInformation value)? needUserInformation,
    TResult Function(_Authed value)? authed,
    TResult Function(_AuthError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitializingAuth value)? initializing,
    TResult Function(_NotAuthed value)? notAuthed,
    TResult Function(_WaitingUserCreation value)? waitingUserCreation,
    TResult Function(_NeedUserInformation value)? needUserInformation,
    TResult Function(_Authed value)? authed,
    TResult Function(_AuthError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _AuthError implements AuthState {
  const factory _AuthError(String error) = _$_AuthError;

  String get error;
  @JsonKey(ignore: true)
  _$AuthErrorCopyWith<_AuthError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$SignInEventTearOff {
  const _$SignInEventTearOff();

  _SignInWithFacebook signInWithFacebook() {
    return const _SignInWithFacebook();
  }

  _SignInWithGoogle signInWithGoogle() {
    return const _SignInWithGoogle();
  }

  _SignInWithApple signInWithApple() {
    return const _SignInWithApple();
  }

  _SignInWithEmailLink signInWithEmailLink(String email) {
    return _SignInWithEmailLink(
      email,
    );
  }

  _SignInAnonymously signInAnonymously() {
    return const _SignInAnonymously();
  }
}

/// @nodoc
const $SignInEvent = _$SignInEventTearOff();

/// @nodoc
mixin _$SignInEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() signInWithFacebook,
    required TResult Function() signInWithGoogle,
    required TResult Function() signInWithApple,
    required TResult Function(String email) signInWithEmailLink,
    required TResult Function() signInAnonymously,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? signInWithFacebook,
    TResult Function()? signInWithGoogle,
    TResult Function()? signInWithApple,
    TResult Function(String email)? signInWithEmailLink,
    TResult Function()? signInAnonymously,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? signInWithFacebook,
    TResult Function()? signInWithGoogle,
    TResult Function()? signInWithApple,
    TResult Function(String email)? signInWithEmailLink,
    TResult Function()? signInAnonymously,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignInWithFacebook value) signInWithFacebook,
    required TResult Function(_SignInWithGoogle value) signInWithGoogle,
    required TResult Function(_SignInWithApple value) signInWithApple,
    required TResult Function(_SignInWithEmailLink value) signInWithEmailLink,
    required TResult Function(_SignInAnonymously value) signInAnonymously,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SignInWithFacebook value)? signInWithFacebook,
    TResult Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult Function(_SignInWithApple value)? signInWithApple,
    TResult Function(_SignInWithEmailLink value)? signInWithEmailLink,
    TResult Function(_SignInAnonymously value)? signInAnonymously,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInWithFacebook value)? signInWithFacebook,
    TResult Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult Function(_SignInWithApple value)? signInWithApple,
    TResult Function(_SignInWithEmailLink value)? signInWithEmailLink,
    TResult Function(_SignInAnonymously value)? signInAnonymously,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInEventCopyWith<$Res> {
  factory $SignInEventCopyWith(
          SignInEvent value, $Res Function(SignInEvent) then) =
      _$SignInEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignInEventCopyWithImpl<$Res> implements $SignInEventCopyWith<$Res> {
  _$SignInEventCopyWithImpl(this._value, this._then);

  final SignInEvent _value;
  // ignore: unused_field
  final $Res Function(SignInEvent) _then;
}

/// @nodoc
abstract class _$SignInWithFacebookCopyWith<$Res> {
  factory _$SignInWithFacebookCopyWith(
          _SignInWithFacebook value, $Res Function(_SignInWithFacebook) then) =
      __$SignInWithFacebookCopyWithImpl<$Res>;
}

/// @nodoc
class __$SignInWithFacebookCopyWithImpl<$Res>
    extends _$SignInEventCopyWithImpl<$Res>
    implements _$SignInWithFacebookCopyWith<$Res> {
  __$SignInWithFacebookCopyWithImpl(
      _SignInWithFacebook _value, $Res Function(_SignInWithFacebook) _then)
      : super(_value, (v) => _then(v as _SignInWithFacebook));

  @override
  _SignInWithFacebook get _value => super._value as _SignInWithFacebook;
}

/// @nodoc

class _$_SignInWithFacebook implements _SignInWithFacebook {
  const _$_SignInWithFacebook();

  @override
  String toString() {
    return 'SignInEvent.signInWithFacebook()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SignInWithFacebook);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() signInWithFacebook,
    required TResult Function() signInWithGoogle,
    required TResult Function() signInWithApple,
    required TResult Function(String email) signInWithEmailLink,
    required TResult Function() signInAnonymously,
  }) {
    return signInWithFacebook();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? signInWithFacebook,
    TResult Function()? signInWithGoogle,
    TResult Function()? signInWithApple,
    TResult Function(String email)? signInWithEmailLink,
    TResult Function()? signInAnonymously,
  }) {
    return signInWithFacebook?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? signInWithFacebook,
    TResult Function()? signInWithGoogle,
    TResult Function()? signInWithApple,
    TResult Function(String email)? signInWithEmailLink,
    TResult Function()? signInAnonymously,
    required TResult orElse(),
  }) {
    if (signInWithFacebook != null) {
      return signInWithFacebook();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignInWithFacebook value) signInWithFacebook,
    required TResult Function(_SignInWithGoogle value) signInWithGoogle,
    required TResult Function(_SignInWithApple value) signInWithApple,
    required TResult Function(_SignInWithEmailLink value) signInWithEmailLink,
    required TResult Function(_SignInAnonymously value) signInAnonymously,
  }) {
    return signInWithFacebook(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SignInWithFacebook value)? signInWithFacebook,
    TResult Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult Function(_SignInWithApple value)? signInWithApple,
    TResult Function(_SignInWithEmailLink value)? signInWithEmailLink,
    TResult Function(_SignInAnonymously value)? signInAnonymously,
  }) {
    return signInWithFacebook?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInWithFacebook value)? signInWithFacebook,
    TResult Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult Function(_SignInWithApple value)? signInWithApple,
    TResult Function(_SignInWithEmailLink value)? signInWithEmailLink,
    TResult Function(_SignInAnonymously value)? signInAnonymously,
    required TResult orElse(),
  }) {
    if (signInWithFacebook != null) {
      return signInWithFacebook(this);
    }
    return orElse();
  }
}

abstract class _SignInWithFacebook implements SignInEvent {
  const factory _SignInWithFacebook() = _$_SignInWithFacebook;
}

/// @nodoc
abstract class _$SignInWithGoogleCopyWith<$Res> {
  factory _$SignInWithGoogleCopyWith(
          _SignInWithGoogle value, $Res Function(_SignInWithGoogle) then) =
      __$SignInWithGoogleCopyWithImpl<$Res>;
}

/// @nodoc
class __$SignInWithGoogleCopyWithImpl<$Res>
    extends _$SignInEventCopyWithImpl<$Res>
    implements _$SignInWithGoogleCopyWith<$Res> {
  __$SignInWithGoogleCopyWithImpl(
      _SignInWithGoogle _value, $Res Function(_SignInWithGoogle) _then)
      : super(_value, (v) => _then(v as _SignInWithGoogle));

  @override
  _SignInWithGoogle get _value => super._value as _SignInWithGoogle;
}

/// @nodoc

class _$_SignInWithGoogle implements _SignInWithGoogle {
  const _$_SignInWithGoogle();

  @override
  String toString() {
    return 'SignInEvent.signInWithGoogle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SignInWithGoogle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() signInWithFacebook,
    required TResult Function() signInWithGoogle,
    required TResult Function() signInWithApple,
    required TResult Function(String email) signInWithEmailLink,
    required TResult Function() signInAnonymously,
  }) {
    return signInWithGoogle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? signInWithFacebook,
    TResult Function()? signInWithGoogle,
    TResult Function()? signInWithApple,
    TResult Function(String email)? signInWithEmailLink,
    TResult Function()? signInAnonymously,
  }) {
    return signInWithGoogle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? signInWithFacebook,
    TResult Function()? signInWithGoogle,
    TResult Function()? signInWithApple,
    TResult Function(String email)? signInWithEmailLink,
    TResult Function()? signInAnonymously,
    required TResult orElse(),
  }) {
    if (signInWithGoogle != null) {
      return signInWithGoogle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignInWithFacebook value) signInWithFacebook,
    required TResult Function(_SignInWithGoogle value) signInWithGoogle,
    required TResult Function(_SignInWithApple value) signInWithApple,
    required TResult Function(_SignInWithEmailLink value) signInWithEmailLink,
    required TResult Function(_SignInAnonymously value) signInAnonymously,
  }) {
    return signInWithGoogle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SignInWithFacebook value)? signInWithFacebook,
    TResult Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult Function(_SignInWithApple value)? signInWithApple,
    TResult Function(_SignInWithEmailLink value)? signInWithEmailLink,
    TResult Function(_SignInAnonymously value)? signInAnonymously,
  }) {
    return signInWithGoogle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInWithFacebook value)? signInWithFacebook,
    TResult Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult Function(_SignInWithApple value)? signInWithApple,
    TResult Function(_SignInWithEmailLink value)? signInWithEmailLink,
    TResult Function(_SignInAnonymously value)? signInAnonymously,
    required TResult orElse(),
  }) {
    if (signInWithGoogle != null) {
      return signInWithGoogle(this);
    }
    return orElse();
  }
}

abstract class _SignInWithGoogle implements SignInEvent {
  const factory _SignInWithGoogle() = _$_SignInWithGoogle;
}

/// @nodoc
abstract class _$SignInWithAppleCopyWith<$Res> {
  factory _$SignInWithAppleCopyWith(
          _SignInWithApple value, $Res Function(_SignInWithApple) then) =
      __$SignInWithAppleCopyWithImpl<$Res>;
}

/// @nodoc
class __$SignInWithAppleCopyWithImpl<$Res>
    extends _$SignInEventCopyWithImpl<$Res>
    implements _$SignInWithAppleCopyWith<$Res> {
  __$SignInWithAppleCopyWithImpl(
      _SignInWithApple _value, $Res Function(_SignInWithApple) _then)
      : super(_value, (v) => _then(v as _SignInWithApple));

  @override
  _SignInWithApple get _value => super._value as _SignInWithApple;
}

/// @nodoc

class _$_SignInWithApple implements _SignInWithApple {
  const _$_SignInWithApple();

  @override
  String toString() {
    return 'SignInEvent.signInWithApple()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SignInWithApple);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() signInWithFacebook,
    required TResult Function() signInWithGoogle,
    required TResult Function() signInWithApple,
    required TResult Function(String email) signInWithEmailLink,
    required TResult Function() signInAnonymously,
  }) {
    return signInWithApple();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? signInWithFacebook,
    TResult Function()? signInWithGoogle,
    TResult Function()? signInWithApple,
    TResult Function(String email)? signInWithEmailLink,
    TResult Function()? signInAnonymously,
  }) {
    return signInWithApple?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? signInWithFacebook,
    TResult Function()? signInWithGoogle,
    TResult Function()? signInWithApple,
    TResult Function(String email)? signInWithEmailLink,
    TResult Function()? signInAnonymously,
    required TResult orElse(),
  }) {
    if (signInWithApple != null) {
      return signInWithApple();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignInWithFacebook value) signInWithFacebook,
    required TResult Function(_SignInWithGoogle value) signInWithGoogle,
    required TResult Function(_SignInWithApple value) signInWithApple,
    required TResult Function(_SignInWithEmailLink value) signInWithEmailLink,
    required TResult Function(_SignInAnonymously value) signInAnonymously,
  }) {
    return signInWithApple(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SignInWithFacebook value)? signInWithFacebook,
    TResult Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult Function(_SignInWithApple value)? signInWithApple,
    TResult Function(_SignInWithEmailLink value)? signInWithEmailLink,
    TResult Function(_SignInAnonymously value)? signInAnonymously,
  }) {
    return signInWithApple?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInWithFacebook value)? signInWithFacebook,
    TResult Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult Function(_SignInWithApple value)? signInWithApple,
    TResult Function(_SignInWithEmailLink value)? signInWithEmailLink,
    TResult Function(_SignInAnonymously value)? signInAnonymously,
    required TResult orElse(),
  }) {
    if (signInWithApple != null) {
      return signInWithApple(this);
    }
    return orElse();
  }
}

abstract class _SignInWithApple implements SignInEvent {
  const factory _SignInWithApple() = _$_SignInWithApple;
}

/// @nodoc
abstract class _$SignInWithEmailLinkCopyWith<$Res> {
  factory _$SignInWithEmailLinkCopyWith(_SignInWithEmailLink value,
          $Res Function(_SignInWithEmailLink) then) =
      __$SignInWithEmailLinkCopyWithImpl<$Res>;
  $Res call({String email});
}

/// @nodoc
class __$SignInWithEmailLinkCopyWithImpl<$Res>
    extends _$SignInEventCopyWithImpl<$Res>
    implements _$SignInWithEmailLinkCopyWith<$Res> {
  __$SignInWithEmailLinkCopyWithImpl(
      _SignInWithEmailLink _value, $Res Function(_SignInWithEmailLink) _then)
      : super(_value, (v) => _then(v as _SignInWithEmailLink));

  @override
  _SignInWithEmailLink get _value => super._value as _SignInWithEmailLink;

  @override
  $Res call({
    Object? email = freezed,
  }) {
    return _then(_SignInWithEmailLink(
      email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SignInWithEmailLink implements _SignInWithEmailLink {
  const _$_SignInWithEmailLink(this.email);

  @override
  final String email;

  @override
  String toString() {
    return 'SignInEvent.signInWithEmailLink(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SignInWithEmailLink &&
            const DeepCollectionEquality().equals(other.email, email));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(email));

  @JsonKey(ignore: true)
  @override
  _$SignInWithEmailLinkCopyWith<_SignInWithEmailLink> get copyWith =>
      __$SignInWithEmailLinkCopyWithImpl<_SignInWithEmailLink>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() signInWithFacebook,
    required TResult Function() signInWithGoogle,
    required TResult Function() signInWithApple,
    required TResult Function(String email) signInWithEmailLink,
    required TResult Function() signInAnonymously,
  }) {
    return signInWithEmailLink(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? signInWithFacebook,
    TResult Function()? signInWithGoogle,
    TResult Function()? signInWithApple,
    TResult Function(String email)? signInWithEmailLink,
    TResult Function()? signInAnonymously,
  }) {
    return signInWithEmailLink?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? signInWithFacebook,
    TResult Function()? signInWithGoogle,
    TResult Function()? signInWithApple,
    TResult Function(String email)? signInWithEmailLink,
    TResult Function()? signInAnonymously,
    required TResult orElse(),
  }) {
    if (signInWithEmailLink != null) {
      return signInWithEmailLink(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignInWithFacebook value) signInWithFacebook,
    required TResult Function(_SignInWithGoogle value) signInWithGoogle,
    required TResult Function(_SignInWithApple value) signInWithApple,
    required TResult Function(_SignInWithEmailLink value) signInWithEmailLink,
    required TResult Function(_SignInAnonymously value) signInAnonymously,
  }) {
    return signInWithEmailLink(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SignInWithFacebook value)? signInWithFacebook,
    TResult Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult Function(_SignInWithApple value)? signInWithApple,
    TResult Function(_SignInWithEmailLink value)? signInWithEmailLink,
    TResult Function(_SignInAnonymously value)? signInAnonymously,
  }) {
    return signInWithEmailLink?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInWithFacebook value)? signInWithFacebook,
    TResult Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult Function(_SignInWithApple value)? signInWithApple,
    TResult Function(_SignInWithEmailLink value)? signInWithEmailLink,
    TResult Function(_SignInAnonymously value)? signInAnonymously,
    required TResult orElse(),
  }) {
    if (signInWithEmailLink != null) {
      return signInWithEmailLink(this);
    }
    return orElse();
  }
}

abstract class _SignInWithEmailLink implements SignInEvent {
  const factory _SignInWithEmailLink(String email) = _$_SignInWithEmailLink;

  String get email;
  @JsonKey(ignore: true)
  _$SignInWithEmailLinkCopyWith<_SignInWithEmailLink> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SignInAnonymouslyCopyWith<$Res> {
  factory _$SignInAnonymouslyCopyWith(
          _SignInAnonymously value, $Res Function(_SignInAnonymously) then) =
      __$SignInAnonymouslyCopyWithImpl<$Res>;
}

/// @nodoc
class __$SignInAnonymouslyCopyWithImpl<$Res>
    extends _$SignInEventCopyWithImpl<$Res>
    implements _$SignInAnonymouslyCopyWith<$Res> {
  __$SignInAnonymouslyCopyWithImpl(
      _SignInAnonymously _value, $Res Function(_SignInAnonymously) _then)
      : super(_value, (v) => _then(v as _SignInAnonymously));

  @override
  _SignInAnonymously get _value => super._value as _SignInAnonymously;
}

/// @nodoc

class _$_SignInAnonymously implements _SignInAnonymously {
  const _$_SignInAnonymously();

  @override
  String toString() {
    return 'SignInEvent.signInAnonymously()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SignInAnonymously);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() signInWithFacebook,
    required TResult Function() signInWithGoogle,
    required TResult Function() signInWithApple,
    required TResult Function(String email) signInWithEmailLink,
    required TResult Function() signInAnonymously,
  }) {
    return signInAnonymously();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? signInWithFacebook,
    TResult Function()? signInWithGoogle,
    TResult Function()? signInWithApple,
    TResult Function(String email)? signInWithEmailLink,
    TResult Function()? signInAnonymously,
  }) {
    return signInAnonymously?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? signInWithFacebook,
    TResult Function()? signInWithGoogle,
    TResult Function()? signInWithApple,
    TResult Function(String email)? signInWithEmailLink,
    TResult Function()? signInAnonymously,
    required TResult orElse(),
  }) {
    if (signInAnonymously != null) {
      return signInAnonymously();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignInWithFacebook value) signInWithFacebook,
    required TResult Function(_SignInWithGoogle value) signInWithGoogle,
    required TResult Function(_SignInWithApple value) signInWithApple,
    required TResult Function(_SignInWithEmailLink value) signInWithEmailLink,
    required TResult Function(_SignInAnonymously value) signInAnonymously,
  }) {
    return signInAnonymously(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SignInWithFacebook value)? signInWithFacebook,
    TResult Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult Function(_SignInWithApple value)? signInWithApple,
    TResult Function(_SignInWithEmailLink value)? signInWithEmailLink,
    TResult Function(_SignInAnonymously value)? signInAnonymously,
  }) {
    return signInAnonymously?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInWithFacebook value)? signInWithFacebook,
    TResult Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult Function(_SignInWithApple value)? signInWithApple,
    TResult Function(_SignInWithEmailLink value)? signInWithEmailLink,
    TResult Function(_SignInAnonymously value)? signInAnonymously,
    required TResult orElse(),
  }) {
    if (signInAnonymously != null) {
      return signInAnonymously(this);
    }
    return orElse();
  }
}

abstract class _SignInAnonymously implements SignInEvent {
  const factory _SignInAnonymously() = _$_SignInAnonymously;
}

/// @nodoc
class _$SignInLocalizationsTearOff {
  const _$SignInLocalizationsTearOff();

  _SignInLocalizations call(
      {String signInAnonymously = "Continue without registration",
      String signInWithApple = "Sign in with Google",
      String signInWithGoogle = "Sign in with Apple",
      String signInWithFacebook = "Sign in with Facebook",
      String signInWithEmail = "Sign in with e-mail",
      String errorTitle = "Oops! Something went wrong...",
      String signInWithEmailTitle = "Sign-in with an email",
      String signInWithEmailCaption =
          "No password required, we just send you an email with a link to log in to the app.",
      String signInWithEmailSuccess =
          "Check your email, we have sent a sign-in link.",
      String signInWithEmailRetry =
          "You did not receive it? Try again or try another identification method.",
      String signInWithEmailPlaceholder = "Email address",
      String signInWithEmailPasswordPlaceholder = "Password",
      String signInWithEmailForgotPassword = "Forgot your password?",
      String signInWithEmailCreateAccount =
          "Not yet registered? Create an account.",
      String continueButton = "Continue",
      String signInPhoneTitle = "Phone Number",
      String signInPhoneSubtitle =
          "We will send an SMS to confirm your number, it won't cost you nothing.",
      String signInPhonePlaceholder = "Example:",
      String signInPhoneAutoRetrieve =
          "You may not need to enter the code as the app will attempt to detect it automatically.",
      String signInPhoneLoadingDialog =
          "Waiting for automatic code detection ...",
      String signInPhoneErrorMobile = "You must enter a mobile phone number.",
      String signInVerificationTitle = "Number verification",
      String signInVerificationWrongNumber = "Wrong number",
      String signInVerificationResend = "Resend the code",
      String signInVerificationInvalid = "Invalid verification code!",
      String signInCountriesTitle = "Country / Region"}) {
    return _SignInLocalizations(
      signInAnonymously: signInAnonymously,
      signInWithApple: signInWithApple,
      signInWithGoogle: signInWithGoogle,
      signInWithFacebook: signInWithFacebook,
      signInWithEmail: signInWithEmail,
      errorTitle: errorTitle,
      signInWithEmailTitle: signInWithEmailTitle,
      signInWithEmailCaption: signInWithEmailCaption,
      signInWithEmailSuccess: signInWithEmailSuccess,
      signInWithEmailRetry: signInWithEmailRetry,
      signInWithEmailPlaceholder: signInWithEmailPlaceholder,
      signInWithEmailPasswordPlaceholder: signInWithEmailPasswordPlaceholder,
      signInWithEmailForgotPassword: signInWithEmailForgotPassword,
      signInWithEmailCreateAccount: signInWithEmailCreateAccount,
      continueButton: continueButton,
      signInPhoneTitle: signInPhoneTitle,
      signInPhoneSubtitle: signInPhoneSubtitle,
      signInPhonePlaceholder: signInPhonePlaceholder,
      signInPhoneAutoRetrieve: signInPhoneAutoRetrieve,
      signInPhoneLoadingDialog: signInPhoneLoadingDialog,
      signInPhoneErrorMobile: signInPhoneErrorMobile,
      signInVerificationTitle: signInVerificationTitle,
      signInVerificationWrongNumber: signInVerificationWrongNumber,
      signInVerificationResend: signInVerificationResend,
      signInVerificationInvalid: signInVerificationInvalid,
      signInCountriesTitle: signInCountriesTitle,
    );
  }
}

/// @nodoc
const $SignInLocalizations = _$SignInLocalizationsTearOff();

/// @nodoc
mixin _$SignInLocalizations {
  String get signInAnonymously => throw _privateConstructorUsedError;
  String get signInWithApple => throw _privateConstructorUsedError;
  String get signInWithGoogle => throw _privateConstructorUsedError;
  String get signInWithFacebook => throw _privateConstructorUsedError;
  String get signInWithEmail => throw _privateConstructorUsedError;
  String get errorTitle => throw _privateConstructorUsedError;
  String get signInWithEmailTitle => throw _privateConstructorUsedError;
  String get signInWithEmailCaption => throw _privateConstructorUsedError;
  String get signInWithEmailSuccess => throw _privateConstructorUsedError;
  String get signInWithEmailRetry => throw _privateConstructorUsedError;
  String get signInWithEmailPlaceholder => throw _privateConstructorUsedError;
  String get signInWithEmailPasswordPlaceholder =>
      throw _privateConstructorUsedError;
  String get signInWithEmailForgotPassword =>
      throw _privateConstructorUsedError;
  String get signInWithEmailCreateAccount => throw _privateConstructorUsedError;
  String get continueButton => throw _privateConstructorUsedError;
  String get signInPhoneTitle => throw _privateConstructorUsedError;
  String get signInPhoneSubtitle => throw _privateConstructorUsedError;
  String get signInPhonePlaceholder => throw _privateConstructorUsedError;
  String get signInPhoneAutoRetrieve => throw _privateConstructorUsedError;
  String get signInPhoneLoadingDialog => throw _privateConstructorUsedError;
  String get signInPhoneErrorMobile => throw _privateConstructorUsedError;
  String get signInVerificationTitle =>
      throw _privateConstructorUsedError; /*@Default("Enter the 6-digit code we sent to {number}")
        Function(String number) signInVerificationSubtitle,
    @Default("Did not receive the code?\nWait {seconds} seconds...")
        Function(String seconds) signInVerificationNotReceived,*/
  String get signInVerificationWrongNumber =>
      throw _privateConstructorUsedError;
  String get signInVerificationResend => throw _privateConstructorUsedError;
  String get signInVerificationInvalid => throw _privateConstructorUsedError;
  String get signInCountriesTitle => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignInLocalizationsCopyWith<SignInLocalizations> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInLocalizationsCopyWith<$Res> {
  factory $SignInLocalizationsCopyWith(
          SignInLocalizations value, $Res Function(SignInLocalizations) then) =
      _$SignInLocalizationsCopyWithImpl<$Res>;
  $Res call(
      {String signInAnonymously,
      String signInWithApple,
      String signInWithGoogle,
      String signInWithFacebook,
      String signInWithEmail,
      String errorTitle,
      String signInWithEmailTitle,
      String signInWithEmailCaption,
      String signInWithEmailSuccess,
      String signInWithEmailRetry,
      String signInWithEmailPlaceholder,
      String signInWithEmailPasswordPlaceholder,
      String signInWithEmailForgotPassword,
      String signInWithEmailCreateAccount,
      String continueButton,
      String signInPhoneTitle,
      String signInPhoneSubtitle,
      String signInPhonePlaceholder,
      String signInPhoneAutoRetrieve,
      String signInPhoneLoadingDialog,
      String signInPhoneErrorMobile,
      String signInVerificationTitle,
      String signInVerificationWrongNumber,
      String signInVerificationResend,
      String signInVerificationInvalid,
      String signInCountriesTitle});
}

/// @nodoc
class _$SignInLocalizationsCopyWithImpl<$Res>
    implements $SignInLocalizationsCopyWith<$Res> {
  _$SignInLocalizationsCopyWithImpl(this._value, this._then);

  final SignInLocalizations _value;
  // ignore: unused_field
  final $Res Function(SignInLocalizations) _then;

  @override
  $Res call({
    Object? signInAnonymously = freezed,
    Object? signInWithApple = freezed,
    Object? signInWithGoogle = freezed,
    Object? signInWithFacebook = freezed,
    Object? signInWithEmail = freezed,
    Object? errorTitle = freezed,
    Object? signInWithEmailTitle = freezed,
    Object? signInWithEmailCaption = freezed,
    Object? signInWithEmailSuccess = freezed,
    Object? signInWithEmailRetry = freezed,
    Object? signInWithEmailPlaceholder = freezed,
    Object? signInWithEmailPasswordPlaceholder = freezed,
    Object? signInWithEmailForgotPassword = freezed,
    Object? signInWithEmailCreateAccount = freezed,
    Object? continueButton = freezed,
    Object? signInPhoneTitle = freezed,
    Object? signInPhoneSubtitle = freezed,
    Object? signInPhonePlaceholder = freezed,
    Object? signInPhoneAutoRetrieve = freezed,
    Object? signInPhoneLoadingDialog = freezed,
    Object? signInPhoneErrorMobile = freezed,
    Object? signInVerificationTitle = freezed,
    Object? signInVerificationWrongNumber = freezed,
    Object? signInVerificationResend = freezed,
    Object? signInVerificationInvalid = freezed,
    Object? signInCountriesTitle = freezed,
  }) {
    return _then(_value.copyWith(
      signInAnonymously: signInAnonymously == freezed
          ? _value.signInAnonymously
          : signInAnonymously // ignore: cast_nullable_to_non_nullable
              as String,
      signInWithApple: signInWithApple == freezed
          ? _value.signInWithApple
          : signInWithApple // ignore: cast_nullable_to_non_nullable
              as String,
      signInWithGoogle: signInWithGoogle == freezed
          ? _value.signInWithGoogle
          : signInWithGoogle // ignore: cast_nullable_to_non_nullable
              as String,
      signInWithFacebook: signInWithFacebook == freezed
          ? _value.signInWithFacebook
          : signInWithFacebook // ignore: cast_nullable_to_non_nullable
              as String,
      signInWithEmail: signInWithEmail == freezed
          ? _value.signInWithEmail
          : signInWithEmail // ignore: cast_nullable_to_non_nullable
              as String,
      errorTitle: errorTitle == freezed
          ? _value.errorTitle
          : errorTitle // ignore: cast_nullable_to_non_nullable
              as String,
      signInWithEmailTitle: signInWithEmailTitle == freezed
          ? _value.signInWithEmailTitle
          : signInWithEmailTitle // ignore: cast_nullable_to_non_nullable
              as String,
      signInWithEmailCaption: signInWithEmailCaption == freezed
          ? _value.signInWithEmailCaption
          : signInWithEmailCaption // ignore: cast_nullable_to_non_nullable
              as String,
      signInWithEmailSuccess: signInWithEmailSuccess == freezed
          ? _value.signInWithEmailSuccess
          : signInWithEmailSuccess // ignore: cast_nullable_to_non_nullable
              as String,
      signInWithEmailRetry: signInWithEmailRetry == freezed
          ? _value.signInWithEmailRetry
          : signInWithEmailRetry // ignore: cast_nullable_to_non_nullable
              as String,
      signInWithEmailPlaceholder: signInWithEmailPlaceholder == freezed
          ? _value.signInWithEmailPlaceholder
          : signInWithEmailPlaceholder // ignore: cast_nullable_to_non_nullable
              as String,
      signInWithEmailPasswordPlaceholder: signInWithEmailPasswordPlaceholder ==
              freezed
          ? _value.signInWithEmailPasswordPlaceholder
          : signInWithEmailPasswordPlaceholder // ignore: cast_nullable_to_non_nullable
              as String,
      signInWithEmailForgotPassword: signInWithEmailForgotPassword == freezed
          ? _value.signInWithEmailForgotPassword
          : signInWithEmailForgotPassword // ignore: cast_nullable_to_non_nullable
              as String,
      signInWithEmailCreateAccount: signInWithEmailCreateAccount == freezed
          ? _value.signInWithEmailCreateAccount
          : signInWithEmailCreateAccount // ignore: cast_nullable_to_non_nullable
              as String,
      continueButton: continueButton == freezed
          ? _value.continueButton
          : continueButton // ignore: cast_nullable_to_non_nullable
              as String,
      signInPhoneTitle: signInPhoneTitle == freezed
          ? _value.signInPhoneTitle
          : signInPhoneTitle // ignore: cast_nullable_to_non_nullable
              as String,
      signInPhoneSubtitle: signInPhoneSubtitle == freezed
          ? _value.signInPhoneSubtitle
          : signInPhoneSubtitle // ignore: cast_nullable_to_non_nullable
              as String,
      signInPhonePlaceholder: signInPhonePlaceholder == freezed
          ? _value.signInPhonePlaceholder
          : signInPhonePlaceholder // ignore: cast_nullable_to_non_nullable
              as String,
      signInPhoneAutoRetrieve: signInPhoneAutoRetrieve == freezed
          ? _value.signInPhoneAutoRetrieve
          : signInPhoneAutoRetrieve // ignore: cast_nullable_to_non_nullable
              as String,
      signInPhoneLoadingDialog: signInPhoneLoadingDialog == freezed
          ? _value.signInPhoneLoadingDialog
          : signInPhoneLoadingDialog // ignore: cast_nullable_to_non_nullable
              as String,
      signInPhoneErrorMobile: signInPhoneErrorMobile == freezed
          ? _value.signInPhoneErrorMobile
          : signInPhoneErrorMobile // ignore: cast_nullable_to_non_nullable
              as String,
      signInVerificationTitle: signInVerificationTitle == freezed
          ? _value.signInVerificationTitle
          : signInVerificationTitle // ignore: cast_nullable_to_non_nullable
              as String,
      signInVerificationWrongNumber: signInVerificationWrongNumber == freezed
          ? _value.signInVerificationWrongNumber
          : signInVerificationWrongNumber // ignore: cast_nullable_to_non_nullable
              as String,
      signInVerificationResend: signInVerificationResend == freezed
          ? _value.signInVerificationResend
          : signInVerificationResend // ignore: cast_nullable_to_non_nullable
              as String,
      signInVerificationInvalid: signInVerificationInvalid == freezed
          ? _value.signInVerificationInvalid
          : signInVerificationInvalid // ignore: cast_nullable_to_non_nullable
              as String,
      signInCountriesTitle: signInCountriesTitle == freezed
          ? _value.signInCountriesTitle
          : signInCountriesTitle // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$SignInLocalizationsCopyWith<$Res>
    implements $SignInLocalizationsCopyWith<$Res> {
  factory _$SignInLocalizationsCopyWith(_SignInLocalizations value,
          $Res Function(_SignInLocalizations) then) =
      __$SignInLocalizationsCopyWithImpl<$Res>;
  @override
  $Res call(
      {String signInAnonymously,
      String signInWithApple,
      String signInWithGoogle,
      String signInWithFacebook,
      String signInWithEmail,
      String errorTitle,
      String signInWithEmailTitle,
      String signInWithEmailCaption,
      String signInWithEmailSuccess,
      String signInWithEmailRetry,
      String signInWithEmailPlaceholder,
      String signInWithEmailPasswordPlaceholder,
      String signInWithEmailForgotPassword,
      String signInWithEmailCreateAccount,
      String continueButton,
      String signInPhoneTitle,
      String signInPhoneSubtitle,
      String signInPhonePlaceholder,
      String signInPhoneAutoRetrieve,
      String signInPhoneLoadingDialog,
      String signInPhoneErrorMobile,
      String signInVerificationTitle,
      String signInVerificationWrongNumber,
      String signInVerificationResend,
      String signInVerificationInvalid,
      String signInCountriesTitle});
}

/// @nodoc
class __$SignInLocalizationsCopyWithImpl<$Res>
    extends _$SignInLocalizationsCopyWithImpl<$Res>
    implements _$SignInLocalizationsCopyWith<$Res> {
  __$SignInLocalizationsCopyWithImpl(
      _SignInLocalizations _value, $Res Function(_SignInLocalizations) _then)
      : super(_value, (v) => _then(v as _SignInLocalizations));

  @override
  _SignInLocalizations get _value => super._value as _SignInLocalizations;

  @override
  $Res call({
    Object? signInAnonymously = freezed,
    Object? signInWithApple = freezed,
    Object? signInWithGoogle = freezed,
    Object? signInWithFacebook = freezed,
    Object? signInWithEmail = freezed,
    Object? errorTitle = freezed,
    Object? signInWithEmailTitle = freezed,
    Object? signInWithEmailCaption = freezed,
    Object? signInWithEmailSuccess = freezed,
    Object? signInWithEmailRetry = freezed,
    Object? signInWithEmailPlaceholder = freezed,
    Object? signInWithEmailPasswordPlaceholder = freezed,
    Object? signInWithEmailForgotPassword = freezed,
    Object? signInWithEmailCreateAccount = freezed,
    Object? continueButton = freezed,
    Object? signInPhoneTitle = freezed,
    Object? signInPhoneSubtitle = freezed,
    Object? signInPhonePlaceholder = freezed,
    Object? signInPhoneAutoRetrieve = freezed,
    Object? signInPhoneLoadingDialog = freezed,
    Object? signInPhoneErrorMobile = freezed,
    Object? signInVerificationTitle = freezed,
    Object? signInVerificationWrongNumber = freezed,
    Object? signInVerificationResend = freezed,
    Object? signInVerificationInvalid = freezed,
    Object? signInCountriesTitle = freezed,
  }) {
    return _then(_SignInLocalizations(
      signInAnonymously: signInAnonymously == freezed
          ? _value.signInAnonymously
          : signInAnonymously // ignore: cast_nullable_to_non_nullable
              as String,
      signInWithApple: signInWithApple == freezed
          ? _value.signInWithApple
          : signInWithApple // ignore: cast_nullable_to_non_nullable
              as String,
      signInWithGoogle: signInWithGoogle == freezed
          ? _value.signInWithGoogle
          : signInWithGoogle // ignore: cast_nullable_to_non_nullable
              as String,
      signInWithFacebook: signInWithFacebook == freezed
          ? _value.signInWithFacebook
          : signInWithFacebook // ignore: cast_nullable_to_non_nullable
              as String,
      signInWithEmail: signInWithEmail == freezed
          ? _value.signInWithEmail
          : signInWithEmail // ignore: cast_nullable_to_non_nullable
              as String,
      errorTitle: errorTitle == freezed
          ? _value.errorTitle
          : errorTitle // ignore: cast_nullable_to_non_nullable
              as String,
      signInWithEmailTitle: signInWithEmailTitle == freezed
          ? _value.signInWithEmailTitle
          : signInWithEmailTitle // ignore: cast_nullable_to_non_nullable
              as String,
      signInWithEmailCaption: signInWithEmailCaption == freezed
          ? _value.signInWithEmailCaption
          : signInWithEmailCaption // ignore: cast_nullable_to_non_nullable
              as String,
      signInWithEmailSuccess: signInWithEmailSuccess == freezed
          ? _value.signInWithEmailSuccess
          : signInWithEmailSuccess // ignore: cast_nullable_to_non_nullable
              as String,
      signInWithEmailRetry: signInWithEmailRetry == freezed
          ? _value.signInWithEmailRetry
          : signInWithEmailRetry // ignore: cast_nullable_to_non_nullable
              as String,
      signInWithEmailPlaceholder: signInWithEmailPlaceholder == freezed
          ? _value.signInWithEmailPlaceholder
          : signInWithEmailPlaceholder // ignore: cast_nullable_to_non_nullable
              as String,
      signInWithEmailPasswordPlaceholder: signInWithEmailPasswordPlaceholder ==
              freezed
          ? _value.signInWithEmailPasswordPlaceholder
          : signInWithEmailPasswordPlaceholder // ignore: cast_nullable_to_non_nullable
              as String,
      signInWithEmailForgotPassword: signInWithEmailForgotPassword == freezed
          ? _value.signInWithEmailForgotPassword
          : signInWithEmailForgotPassword // ignore: cast_nullable_to_non_nullable
              as String,
      signInWithEmailCreateAccount: signInWithEmailCreateAccount == freezed
          ? _value.signInWithEmailCreateAccount
          : signInWithEmailCreateAccount // ignore: cast_nullable_to_non_nullable
              as String,
      continueButton: continueButton == freezed
          ? _value.continueButton
          : continueButton // ignore: cast_nullable_to_non_nullable
              as String,
      signInPhoneTitle: signInPhoneTitle == freezed
          ? _value.signInPhoneTitle
          : signInPhoneTitle // ignore: cast_nullable_to_non_nullable
              as String,
      signInPhoneSubtitle: signInPhoneSubtitle == freezed
          ? _value.signInPhoneSubtitle
          : signInPhoneSubtitle // ignore: cast_nullable_to_non_nullable
              as String,
      signInPhonePlaceholder: signInPhonePlaceholder == freezed
          ? _value.signInPhonePlaceholder
          : signInPhonePlaceholder // ignore: cast_nullable_to_non_nullable
              as String,
      signInPhoneAutoRetrieve: signInPhoneAutoRetrieve == freezed
          ? _value.signInPhoneAutoRetrieve
          : signInPhoneAutoRetrieve // ignore: cast_nullable_to_non_nullable
              as String,
      signInPhoneLoadingDialog: signInPhoneLoadingDialog == freezed
          ? _value.signInPhoneLoadingDialog
          : signInPhoneLoadingDialog // ignore: cast_nullable_to_non_nullable
              as String,
      signInPhoneErrorMobile: signInPhoneErrorMobile == freezed
          ? _value.signInPhoneErrorMobile
          : signInPhoneErrorMobile // ignore: cast_nullable_to_non_nullable
              as String,
      signInVerificationTitle: signInVerificationTitle == freezed
          ? _value.signInVerificationTitle
          : signInVerificationTitle // ignore: cast_nullable_to_non_nullable
              as String,
      signInVerificationWrongNumber: signInVerificationWrongNumber == freezed
          ? _value.signInVerificationWrongNumber
          : signInVerificationWrongNumber // ignore: cast_nullable_to_non_nullable
              as String,
      signInVerificationResend: signInVerificationResend == freezed
          ? _value.signInVerificationResend
          : signInVerificationResend // ignore: cast_nullable_to_non_nullable
              as String,
      signInVerificationInvalid: signInVerificationInvalid == freezed
          ? _value.signInVerificationInvalid
          : signInVerificationInvalid // ignore: cast_nullable_to_non_nullable
              as String,
      signInCountriesTitle: signInCountriesTitle == freezed
          ? _value.signInCountriesTitle
          : signInCountriesTitle // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SignInLocalizations implements _SignInLocalizations {
  const _$_SignInLocalizations(
      {this.signInAnonymously = "Continue without registration",
      this.signInWithApple = "Sign in with Google",
      this.signInWithGoogle = "Sign in with Apple",
      this.signInWithFacebook = "Sign in with Facebook",
      this.signInWithEmail = "Sign in with e-mail",
      this.errorTitle = "Oops! Something went wrong...",
      this.signInWithEmailTitle = "Sign-in with an email",
      this.signInWithEmailCaption =
          "No password required, we just send you an email with a link to log in to the app.",
      this.signInWithEmailSuccess =
          "Check your email, we have sent a sign-in link.",
      this.signInWithEmailRetry =
          "You did not receive it? Try again or try another identification method.",
      this.signInWithEmailPlaceholder = "Email address",
      this.signInWithEmailPasswordPlaceholder = "Password",
      this.signInWithEmailForgotPassword = "Forgot your password?",
      this.signInWithEmailCreateAccount =
          "Not yet registered? Create an account.",
      this.continueButton = "Continue",
      this.signInPhoneTitle = "Phone Number",
      this.signInPhoneSubtitle =
          "We will send an SMS to confirm your number, it won't cost you nothing.",
      this.signInPhonePlaceholder = "Example:",
      this.signInPhoneAutoRetrieve =
          "You may not need to enter the code as the app will attempt to detect it automatically.",
      this.signInPhoneLoadingDialog =
          "Waiting for automatic code detection ...",
      this.signInPhoneErrorMobile = "You must enter a mobile phone number.",
      this.signInVerificationTitle = "Number verification",
      this.signInVerificationWrongNumber = "Wrong number",
      this.signInVerificationResend = "Resend the code",
      this.signInVerificationInvalid = "Invalid verification code!",
      this.signInCountriesTitle = "Country / Region"});

  @JsonKey()
  @override
  final String signInAnonymously;
  @JsonKey()
  @override
  final String signInWithApple;
  @JsonKey()
  @override
  final String signInWithGoogle;
  @JsonKey()
  @override
  final String signInWithFacebook;
  @JsonKey()
  @override
  final String signInWithEmail;
  @JsonKey()
  @override
  final String errorTitle;
  @JsonKey()
  @override
  final String signInWithEmailTitle;
  @JsonKey()
  @override
  final String signInWithEmailCaption;
  @JsonKey()
  @override
  final String signInWithEmailSuccess;
  @JsonKey()
  @override
  final String signInWithEmailRetry;
  @JsonKey()
  @override
  final String signInWithEmailPlaceholder;
  @JsonKey()
  @override
  final String signInWithEmailPasswordPlaceholder;
  @JsonKey()
  @override
  final String signInWithEmailForgotPassword;
  @JsonKey()
  @override
  final String signInWithEmailCreateAccount;
  @JsonKey()
  @override
  final String continueButton;
  @JsonKey()
  @override
  final String signInPhoneTitle;
  @JsonKey()
  @override
  final String signInPhoneSubtitle;
  @JsonKey()
  @override
  final String signInPhonePlaceholder;
  @JsonKey()
  @override
  final String signInPhoneAutoRetrieve;
  @JsonKey()
  @override
  final String signInPhoneLoadingDialog;
  @JsonKey()
  @override
  final String signInPhoneErrorMobile;
  @JsonKey()
  @override
  final String signInVerificationTitle;
  @JsonKey()
  @override /*@Default("Enter the 6-digit code we sent to {number}")
        Function(String number) signInVerificationSubtitle,
    @Default("Did not receive the code?\nWait {seconds} seconds...")
        Function(String seconds) signInVerificationNotReceived,*/
  final String signInVerificationWrongNumber;
  @JsonKey()
  @override
  final String signInVerificationResend;
  @JsonKey()
  @override
  final String signInVerificationInvalid;
  @JsonKey()
  @override
  final String signInCountriesTitle;

  @override
  String toString() {
    return 'SignInLocalizations(signInAnonymously: $signInAnonymously, signInWithApple: $signInWithApple, signInWithGoogle: $signInWithGoogle, signInWithFacebook: $signInWithFacebook, signInWithEmail: $signInWithEmail, errorTitle: $errorTitle, signInWithEmailTitle: $signInWithEmailTitle, signInWithEmailCaption: $signInWithEmailCaption, signInWithEmailSuccess: $signInWithEmailSuccess, signInWithEmailRetry: $signInWithEmailRetry, signInWithEmailPlaceholder: $signInWithEmailPlaceholder, signInWithEmailPasswordPlaceholder: $signInWithEmailPasswordPlaceholder, signInWithEmailForgotPassword: $signInWithEmailForgotPassword, signInWithEmailCreateAccount: $signInWithEmailCreateAccount, continueButton: $continueButton, signInPhoneTitle: $signInPhoneTitle, signInPhoneSubtitle: $signInPhoneSubtitle, signInPhonePlaceholder: $signInPhonePlaceholder, signInPhoneAutoRetrieve: $signInPhoneAutoRetrieve, signInPhoneLoadingDialog: $signInPhoneLoadingDialog, signInPhoneErrorMobile: $signInPhoneErrorMobile, signInVerificationTitle: $signInVerificationTitle, signInVerificationWrongNumber: $signInVerificationWrongNumber, signInVerificationResend: $signInVerificationResend, signInVerificationInvalid: $signInVerificationInvalid, signInCountriesTitle: $signInCountriesTitle)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SignInLocalizations &&
            const DeepCollectionEquality()
                .equals(other.signInAnonymously, signInAnonymously) &&
            const DeepCollectionEquality()
                .equals(other.signInWithApple, signInWithApple) &&
            const DeepCollectionEquality()
                .equals(other.signInWithGoogle, signInWithGoogle) &&
            const DeepCollectionEquality()
                .equals(other.signInWithFacebook, signInWithFacebook) &&
            const DeepCollectionEquality()
                .equals(other.signInWithEmail, signInWithEmail) &&
            const DeepCollectionEquality()
                .equals(other.errorTitle, errorTitle) &&
            const DeepCollectionEquality()
                .equals(other.signInWithEmailTitle, signInWithEmailTitle) &&
            const DeepCollectionEquality()
                .equals(other.signInWithEmailCaption, signInWithEmailCaption) &&
            const DeepCollectionEquality()
                .equals(other.signInWithEmailSuccess, signInWithEmailSuccess) &&
            const DeepCollectionEquality()
                .equals(other.signInWithEmailRetry, signInWithEmailRetry) &&
            const DeepCollectionEquality().equals(
                other.signInWithEmailPlaceholder, signInWithEmailPlaceholder) &&
            const DeepCollectionEquality().equals(
                other.signInWithEmailPasswordPlaceholder,
                signInWithEmailPasswordPlaceholder) &&
            const DeepCollectionEquality().equals(
                other.signInWithEmailForgotPassword,
                signInWithEmailForgotPassword) &&
            const DeepCollectionEquality().equals(
                other.signInWithEmailCreateAccount,
                signInWithEmailCreateAccount) &&
            const DeepCollectionEquality()
                .equals(other.continueButton, continueButton) &&
            const DeepCollectionEquality()
                .equals(other.signInPhoneTitle, signInPhoneTitle) &&
            const DeepCollectionEquality()
                .equals(other.signInPhoneSubtitle, signInPhoneSubtitle) &&
            const DeepCollectionEquality()
                .equals(other.signInPhonePlaceholder, signInPhonePlaceholder) &&
            const DeepCollectionEquality().equals(
                other.signInPhoneAutoRetrieve, signInPhoneAutoRetrieve) &&
            const DeepCollectionEquality().equals(
                other.signInPhoneLoadingDialog, signInPhoneLoadingDialog) &&
            const DeepCollectionEquality()
                .equals(other.signInPhoneErrorMobile, signInPhoneErrorMobile) &&
            const DeepCollectionEquality().equals(
                other.signInVerificationTitle, signInVerificationTitle) &&
            const DeepCollectionEquality().equals(
                other.signInVerificationWrongNumber,
                signInVerificationWrongNumber) &&
            const DeepCollectionEquality().equals(
                other.signInVerificationResend, signInVerificationResend) &&
            const DeepCollectionEquality().equals(
                other.signInVerificationInvalid, signInVerificationInvalid) &&
            const DeepCollectionEquality()
                .equals(other.signInCountriesTitle, signInCountriesTitle));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(signInAnonymously),
        const DeepCollectionEquality().hash(signInWithApple),
        const DeepCollectionEquality().hash(signInWithGoogle),
        const DeepCollectionEquality().hash(signInWithFacebook),
        const DeepCollectionEquality().hash(signInWithEmail),
        const DeepCollectionEquality().hash(errorTitle),
        const DeepCollectionEquality().hash(signInWithEmailTitle),
        const DeepCollectionEquality().hash(signInWithEmailCaption),
        const DeepCollectionEquality().hash(signInWithEmailSuccess),
        const DeepCollectionEquality().hash(signInWithEmailRetry),
        const DeepCollectionEquality().hash(signInWithEmailPlaceholder),
        const DeepCollectionEquality().hash(signInWithEmailPasswordPlaceholder),
        const DeepCollectionEquality().hash(signInWithEmailForgotPassword),
        const DeepCollectionEquality().hash(signInWithEmailCreateAccount),
        const DeepCollectionEquality().hash(continueButton),
        const DeepCollectionEquality().hash(signInPhoneTitle),
        const DeepCollectionEquality().hash(signInPhoneSubtitle),
        const DeepCollectionEquality().hash(signInPhonePlaceholder),
        const DeepCollectionEquality().hash(signInPhoneAutoRetrieve),
        const DeepCollectionEquality().hash(signInPhoneLoadingDialog),
        const DeepCollectionEquality().hash(signInPhoneErrorMobile),
        const DeepCollectionEquality().hash(signInVerificationTitle),
        const DeepCollectionEquality().hash(signInVerificationWrongNumber),
        const DeepCollectionEquality().hash(signInVerificationResend),
        const DeepCollectionEquality().hash(signInVerificationInvalid),
        const DeepCollectionEquality().hash(signInCountriesTitle)
      ]);

  @JsonKey(ignore: true)
  @override
  _$SignInLocalizationsCopyWith<_SignInLocalizations> get copyWith =>
      __$SignInLocalizationsCopyWithImpl<_SignInLocalizations>(
          this, _$identity);
}

abstract class _SignInLocalizations implements SignInLocalizations {
  const factory _SignInLocalizations(
      {String signInAnonymously,
      String signInWithApple,
      String signInWithGoogle,
      String signInWithFacebook,
      String signInWithEmail,
      String errorTitle,
      String signInWithEmailTitle,
      String signInWithEmailCaption,
      String signInWithEmailSuccess,
      String signInWithEmailRetry,
      String signInWithEmailPlaceholder,
      String signInWithEmailPasswordPlaceholder,
      String signInWithEmailForgotPassword,
      String signInWithEmailCreateAccount,
      String continueButton,
      String signInPhoneTitle,
      String signInPhoneSubtitle,
      String signInPhonePlaceholder,
      String signInPhoneAutoRetrieve,
      String signInPhoneLoadingDialog,
      String signInPhoneErrorMobile,
      String signInVerificationTitle,
      String signInVerificationWrongNumber,
      String signInVerificationResend,
      String signInVerificationInvalid,
      String signInCountriesTitle}) = _$_SignInLocalizations;

  @override
  String get signInAnonymously;
  @override
  String get signInWithApple;
  @override
  String get signInWithGoogle;
  @override
  String get signInWithFacebook;
  @override
  String get signInWithEmail;
  @override
  String get errorTitle;
  @override
  String get signInWithEmailTitle;
  @override
  String get signInWithEmailCaption;
  @override
  String get signInWithEmailSuccess;
  @override
  String get signInWithEmailRetry;
  @override
  String get signInWithEmailPlaceholder;
  @override
  String get signInWithEmailPasswordPlaceholder;
  @override
  String get signInWithEmailForgotPassword;
  @override
  String get signInWithEmailCreateAccount;
  @override
  String get continueButton;
  @override
  String get signInPhoneTitle;
  @override
  String get signInPhoneSubtitle;
  @override
  String get signInPhonePlaceholder;
  @override
  String get signInPhoneAutoRetrieve;
  @override
  String get signInPhoneLoadingDialog;
  @override
  String get signInPhoneErrorMobile;
  @override
  String get signInVerificationTitle;
  @override /*@Default("Enter the 6-digit code we sent to {number}")
        Function(String number) signInVerificationSubtitle,
    @Default("Did not receive the code?\nWait {seconds} seconds...")
        Function(String seconds) signInVerificationNotReceived,*/
  String get signInVerificationWrongNumber;
  @override
  String get signInVerificationResend;
  @override
  String get signInVerificationInvalid;
  @override
  String get signInCountriesTitle;
  @override
  @JsonKey(ignore: true)
  _$SignInLocalizationsCopyWith<_SignInLocalizations> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$SignInStateTearOff {
  const _$SignInStateTearOff();

  _SignInInitial initial() {
    return const _SignInInitial();
  }

  _SignInLoading loading() {
    return const _SignInLoading();
  }

  _SignInSuccess success() {
    return const _SignInSuccess();
  }

  _SignInError error(String errorText) {
    return _SignInError(
      errorText,
    );
  }
}

/// @nodoc
const $SignInState = _$SignInStateTearOff();

/// @nodoc
mixin _$SignInState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String errorText) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String errorText)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String errorText)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignInInitial value) initial,
    required TResult Function(_SignInLoading value) loading,
    required TResult Function(_SignInSuccess value) success,
    required TResult Function(_SignInError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SignInInitial value)? initial,
    TResult Function(_SignInLoading value)? loading,
    TResult Function(_SignInSuccess value)? success,
    TResult Function(_SignInError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInInitial value)? initial,
    TResult Function(_SignInLoading value)? loading,
    TResult Function(_SignInSuccess value)? success,
    TResult Function(_SignInError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInStateCopyWith<$Res> {
  factory $SignInStateCopyWith(
          SignInState value, $Res Function(SignInState) then) =
      _$SignInStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignInStateCopyWithImpl<$Res> implements $SignInStateCopyWith<$Res> {
  _$SignInStateCopyWithImpl(this._value, this._then);

  final SignInState _value;
  // ignore: unused_field
  final $Res Function(SignInState) _then;
}

/// @nodoc
abstract class _$SignInInitialCopyWith<$Res> {
  factory _$SignInInitialCopyWith(
          _SignInInitial value, $Res Function(_SignInInitial) then) =
      __$SignInInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$SignInInitialCopyWithImpl<$Res> extends _$SignInStateCopyWithImpl<$Res>
    implements _$SignInInitialCopyWith<$Res> {
  __$SignInInitialCopyWithImpl(
      _SignInInitial _value, $Res Function(_SignInInitial) _then)
      : super(_value, (v) => _then(v as _SignInInitial));

  @override
  _SignInInitial get _value => super._value as _SignInInitial;
}

/// @nodoc

class _$_SignInInitial implements _SignInInitial {
  const _$_SignInInitial();

  @override
  String toString() {
    return 'SignInState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SignInInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String errorText) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String errorText)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String errorText)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignInInitial value) initial,
    required TResult Function(_SignInLoading value) loading,
    required TResult Function(_SignInSuccess value) success,
    required TResult Function(_SignInError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SignInInitial value)? initial,
    TResult Function(_SignInLoading value)? loading,
    TResult Function(_SignInSuccess value)? success,
    TResult Function(_SignInError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInInitial value)? initial,
    TResult Function(_SignInLoading value)? loading,
    TResult Function(_SignInSuccess value)? success,
    TResult Function(_SignInError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _SignInInitial implements SignInState {
  const factory _SignInInitial() = _$_SignInInitial;
}

/// @nodoc
abstract class _$SignInLoadingCopyWith<$Res> {
  factory _$SignInLoadingCopyWith(
          _SignInLoading value, $Res Function(_SignInLoading) then) =
      __$SignInLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$SignInLoadingCopyWithImpl<$Res> extends _$SignInStateCopyWithImpl<$Res>
    implements _$SignInLoadingCopyWith<$Res> {
  __$SignInLoadingCopyWithImpl(
      _SignInLoading _value, $Res Function(_SignInLoading) _then)
      : super(_value, (v) => _then(v as _SignInLoading));

  @override
  _SignInLoading get _value => super._value as _SignInLoading;
}

/// @nodoc

class _$_SignInLoading implements _SignInLoading {
  const _$_SignInLoading();

  @override
  String toString() {
    return 'SignInState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SignInLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String errorText) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String errorText)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String errorText)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignInInitial value) initial,
    required TResult Function(_SignInLoading value) loading,
    required TResult Function(_SignInSuccess value) success,
    required TResult Function(_SignInError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SignInInitial value)? initial,
    TResult Function(_SignInLoading value)? loading,
    TResult Function(_SignInSuccess value)? success,
    TResult Function(_SignInError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInInitial value)? initial,
    TResult Function(_SignInLoading value)? loading,
    TResult Function(_SignInSuccess value)? success,
    TResult Function(_SignInError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _SignInLoading implements SignInState {
  const factory _SignInLoading() = _$_SignInLoading;
}

/// @nodoc
abstract class _$SignInSuccessCopyWith<$Res> {
  factory _$SignInSuccessCopyWith(
          _SignInSuccess value, $Res Function(_SignInSuccess) then) =
      __$SignInSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$SignInSuccessCopyWithImpl<$Res> extends _$SignInStateCopyWithImpl<$Res>
    implements _$SignInSuccessCopyWith<$Res> {
  __$SignInSuccessCopyWithImpl(
      _SignInSuccess _value, $Res Function(_SignInSuccess) _then)
      : super(_value, (v) => _then(v as _SignInSuccess));

  @override
  _SignInSuccess get _value => super._value as _SignInSuccess;
}

/// @nodoc

class _$_SignInSuccess implements _SignInSuccess {
  const _$_SignInSuccess();

  @override
  String toString() {
    return 'SignInState.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SignInSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String errorText) error,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String errorText)? error,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String errorText)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignInInitial value) initial,
    required TResult Function(_SignInLoading value) loading,
    required TResult Function(_SignInSuccess value) success,
    required TResult Function(_SignInError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SignInInitial value)? initial,
    TResult Function(_SignInLoading value)? loading,
    TResult Function(_SignInSuccess value)? success,
    TResult Function(_SignInError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInInitial value)? initial,
    TResult Function(_SignInLoading value)? loading,
    TResult Function(_SignInSuccess value)? success,
    TResult Function(_SignInError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _SignInSuccess implements SignInState {
  const factory _SignInSuccess() = _$_SignInSuccess;
}

/// @nodoc
abstract class _$SignInErrorCopyWith<$Res> {
  factory _$SignInErrorCopyWith(
          _SignInError value, $Res Function(_SignInError) then) =
      __$SignInErrorCopyWithImpl<$Res>;
  $Res call({String errorText});
}

/// @nodoc
class __$SignInErrorCopyWithImpl<$Res> extends _$SignInStateCopyWithImpl<$Res>
    implements _$SignInErrorCopyWith<$Res> {
  __$SignInErrorCopyWithImpl(
      _SignInError _value, $Res Function(_SignInError) _then)
      : super(_value, (v) => _then(v as _SignInError));

  @override
  _SignInError get _value => super._value as _SignInError;

  @override
  $Res call({
    Object? errorText = freezed,
  }) {
    return _then(_SignInError(
      errorText == freezed
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SignInError implements _SignInError {
  const _$_SignInError(this.errorText);

  @override
  final String errorText;

  @override
  String toString() {
    return 'SignInState.error(errorText: $errorText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SignInError &&
            const DeepCollectionEquality().equals(other.errorText, errorText));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(errorText));

  @JsonKey(ignore: true)
  @override
  _$SignInErrorCopyWith<_SignInError> get copyWith =>
      __$SignInErrorCopyWithImpl<_SignInError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String errorText) error,
  }) {
    return error(errorText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String errorText)? error,
  }) {
    return error?.call(errorText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String errorText)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(errorText);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignInInitial value) initial,
    required TResult Function(_SignInLoading value) loading,
    required TResult Function(_SignInSuccess value) success,
    required TResult Function(_SignInError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SignInInitial value)? initial,
    TResult Function(_SignInLoading value)? loading,
    TResult Function(_SignInSuccess value)? success,
    TResult Function(_SignInError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInInitial value)? initial,
    TResult Function(_SignInLoading value)? loading,
    TResult Function(_SignInSuccess value)? success,
    TResult Function(_SignInError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _SignInError implements SignInState {
  const factory _SignInError(String errorText) = _$_SignInError;

  String get errorText;
  @JsonKey(ignore: true)
  _$SignInErrorCopyWith<_SignInError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$SignInThemeTearOff {
  const _$SignInThemeTearOff();

  _SignInTheme call(
      {double maxWidth = 400,
      double buttonRadius = 8.0,
      double buttonPadding = 16.0,
      required ui.Color buttonBackgroundColor,
      required ui.Color buttonTextColor,
      double buttonFontSize = 18.0,
      double spaceBetweenButtons = 15.0}) {
    return _SignInTheme(
      maxWidth: maxWidth,
      buttonRadius: buttonRadius,
      buttonPadding: buttonPadding,
      buttonBackgroundColor: buttonBackgroundColor,
      buttonTextColor: buttonTextColor,
      buttonFontSize: buttonFontSize,
      spaceBetweenButtons: spaceBetweenButtons,
    );
  }
}

/// @nodoc
const $SignInTheme = _$SignInThemeTearOff();

/// @nodoc
mixin _$SignInTheme {
  double get maxWidth => throw _privateConstructorUsedError;
  double get buttonRadius => throw _privateConstructorUsedError;
  double get buttonPadding => throw _privateConstructorUsedError;
  ui.Color get buttonBackgroundColor => throw _privateConstructorUsedError;
  ui.Color get buttonTextColor => throw _privateConstructorUsedError;
  double get buttonFontSize => throw _privateConstructorUsedError;
  double get spaceBetweenButtons => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignInThemeCopyWith<SignInTheme> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInThemeCopyWith<$Res> {
  factory $SignInThemeCopyWith(
          SignInTheme value, $Res Function(SignInTheme) then) =
      _$SignInThemeCopyWithImpl<$Res>;
  $Res call(
      {double maxWidth,
      double buttonRadius,
      double buttonPadding,
      ui.Color buttonBackgroundColor,
      ui.Color buttonTextColor,
      double buttonFontSize,
      double spaceBetweenButtons});
}

/// @nodoc
class _$SignInThemeCopyWithImpl<$Res> implements $SignInThemeCopyWith<$Res> {
  _$SignInThemeCopyWithImpl(this._value, this._then);

  final SignInTheme _value;
  // ignore: unused_field
  final $Res Function(SignInTheme) _then;

  @override
  $Res call({
    Object? maxWidth = freezed,
    Object? buttonRadius = freezed,
    Object? buttonPadding = freezed,
    Object? buttonBackgroundColor = freezed,
    Object? buttonTextColor = freezed,
    Object? buttonFontSize = freezed,
    Object? spaceBetweenButtons = freezed,
  }) {
    return _then(_value.copyWith(
      maxWidth: maxWidth == freezed
          ? _value.maxWidth
          : maxWidth // ignore: cast_nullable_to_non_nullable
              as double,
      buttonRadius: buttonRadius == freezed
          ? _value.buttonRadius
          : buttonRadius // ignore: cast_nullable_to_non_nullable
              as double,
      buttonPadding: buttonPadding == freezed
          ? _value.buttonPadding
          : buttonPadding // ignore: cast_nullable_to_non_nullable
              as double,
      buttonBackgroundColor: buttonBackgroundColor == freezed
          ? _value.buttonBackgroundColor
          : buttonBackgroundColor // ignore: cast_nullable_to_non_nullable
              as ui.Color,
      buttonTextColor: buttonTextColor == freezed
          ? _value.buttonTextColor
          : buttonTextColor // ignore: cast_nullable_to_non_nullable
              as ui.Color,
      buttonFontSize: buttonFontSize == freezed
          ? _value.buttonFontSize
          : buttonFontSize // ignore: cast_nullable_to_non_nullable
              as double,
      spaceBetweenButtons: spaceBetweenButtons == freezed
          ? _value.spaceBetweenButtons
          : spaceBetweenButtons // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$SignInThemeCopyWith<$Res>
    implements $SignInThemeCopyWith<$Res> {
  factory _$SignInThemeCopyWith(
          _SignInTheme value, $Res Function(_SignInTheme) then) =
      __$SignInThemeCopyWithImpl<$Res>;
  @override
  $Res call(
      {double maxWidth,
      double buttonRadius,
      double buttonPadding,
      ui.Color buttonBackgroundColor,
      ui.Color buttonTextColor,
      double buttonFontSize,
      double spaceBetweenButtons});
}

/// @nodoc
class __$SignInThemeCopyWithImpl<$Res> extends _$SignInThemeCopyWithImpl<$Res>
    implements _$SignInThemeCopyWith<$Res> {
  __$SignInThemeCopyWithImpl(
      _SignInTheme _value, $Res Function(_SignInTheme) _then)
      : super(_value, (v) => _then(v as _SignInTheme));

  @override
  _SignInTheme get _value => super._value as _SignInTheme;

  @override
  $Res call({
    Object? maxWidth = freezed,
    Object? buttonRadius = freezed,
    Object? buttonPadding = freezed,
    Object? buttonBackgroundColor = freezed,
    Object? buttonTextColor = freezed,
    Object? buttonFontSize = freezed,
    Object? spaceBetweenButtons = freezed,
  }) {
    return _then(_SignInTheme(
      maxWidth: maxWidth == freezed
          ? _value.maxWidth
          : maxWidth // ignore: cast_nullable_to_non_nullable
              as double,
      buttonRadius: buttonRadius == freezed
          ? _value.buttonRadius
          : buttonRadius // ignore: cast_nullable_to_non_nullable
              as double,
      buttonPadding: buttonPadding == freezed
          ? _value.buttonPadding
          : buttonPadding // ignore: cast_nullable_to_non_nullable
              as double,
      buttonBackgroundColor: buttonBackgroundColor == freezed
          ? _value.buttonBackgroundColor
          : buttonBackgroundColor // ignore: cast_nullable_to_non_nullable
              as ui.Color,
      buttonTextColor: buttonTextColor == freezed
          ? _value.buttonTextColor
          : buttonTextColor // ignore: cast_nullable_to_non_nullable
              as ui.Color,
      buttonFontSize: buttonFontSize == freezed
          ? _value.buttonFontSize
          : buttonFontSize // ignore: cast_nullable_to_non_nullable
              as double,
      spaceBetweenButtons: spaceBetweenButtons == freezed
          ? _value.spaceBetweenButtons
          : spaceBetweenButtons // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_SignInTheme implements _SignInTheme {
  const _$_SignInTheme(
      {this.maxWidth = 400,
      this.buttonRadius = 8.0,
      this.buttonPadding = 16.0,
      required this.buttonBackgroundColor,
      required this.buttonTextColor,
      this.buttonFontSize = 18.0,
      this.spaceBetweenButtons = 15.0});

  @JsonKey()
  @override
  final double maxWidth;
  @JsonKey()
  @override
  final double buttonRadius;
  @JsonKey()
  @override
  final double buttonPadding;
  @override
  final ui.Color buttonBackgroundColor;
  @override
  final ui.Color buttonTextColor;
  @JsonKey()
  @override
  final double buttonFontSize;
  @JsonKey()
  @override
  final double spaceBetweenButtons;

  @override
  String toString() {
    return 'SignInTheme(maxWidth: $maxWidth, buttonRadius: $buttonRadius, buttonPadding: $buttonPadding, buttonBackgroundColor: $buttonBackgroundColor, buttonTextColor: $buttonTextColor, buttonFontSize: $buttonFontSize, spaceBetweenButtons: $spaceBetweenButtons)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SignInTheme &&
            const DeepCollectionEquality().equals(other.maxWidth, maxWidth) &&
            const DeepCollectionEquality()
                .equals(other.buttonRadius, buttonRadius) &&
            const DeepCollectionEquality()
                .equals(other.buttonPadding, buttonPadding) &&
            const DeepCollectionEquality()
                .equals(other.buttonBackgroundColor, buttonBackgroundColor) &&
            const DeepCollectionEquality()
                .equals(other.buttonTextColor, buttonTextColor) &&
            const DeepCollectionEquality()
                .equals(other.buttonFontSize, buttonFontSize) &&
            const DeepCollectionEquality()
                .equals(other.spaceBetweenButtons, spaceBetweenButtons));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(maxWidth),
      const DeepCollectionEquality().hash(buttonRadius),
      const DeepCollectionEquality().hash(buttonPadding),
      const DeepCollectionEquality().hash(buttonBackgroundColor),
      const DeepCollectionEquality().hash(buttonTextColor),
      const DeepCollectionEquality().hash(buttonFontSize),
      const DeepCollectionEquality().hash(spaceBetweenButtons));

  @JsonKey(ignore: true)
  @override
  _$SignInThemeCopyWith<_SignInTheme> get copyWith =>
      __$SignInThemeCopyWithImpl<_SignInTheme>(this, _$identity);
}

abstract class _SignInTheme implements SignInTheme {
  const factory _SignInTheme(
      {double maxWidth,
      double buttonRadius,
      double buttonPadding,
      required ui.Color buttonBackgroundColor,
      required ui.Color buttonTextColor,
      double buttonFontSize,
      double spaceBetweenButtons}) = _$_SignInTheme;

  @override
  double get maxWidth;
  @override
  double get buttonRadius;
  @override
  double get buttonPadding;
  @override
  ui.Color get buttonBackgroundColor;
  @override
  ui.Color get buttonTextColor;
  @override
  double get buttonFontSize;
  @override
  double get spaceBetweenButtons;
  @override
  @JsonKey(ignore: true)
  _$SignInThemeCopyWith<_SignInTheme> get copyWith =>
      throw _privateConstructorUsedError;
}
