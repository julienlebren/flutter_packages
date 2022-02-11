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
    required TResult Function() signInAnonymously,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? signInWithFacebook,
    TResult Function()? signInWithGoogle,
    TResult Function()? signInWithApple,
    TResult Function()? signInAnonymously,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? signInWithFacebook,
    TResult Function()? signInWithGoogle,
    TResult Function()? signInWithApple,
    TResult Function()? signInAnonymously,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignInWithFacebook value) signInWithFacebook,
    required TResult Function(_SignInWithGoogle value) signInWithGoogle,
    required TResult Function(_SignInWithApple value) signInWithApple,
    required TResult Function(_SignInAnonymously value) signInAnonymously,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SignInWithFacebook value)? signInWithFacebook,
    TResult Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult Function(_SignInWithApple value)? signInWithApple,
    TResult Function(_SignInAnonymously value)? signInAnonymously,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInWithFacebook value)? signInWithFacebook,
    TResult Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult Function(_SignInWithApple value)? signInWithApple,
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
      String errorTitle = "Oops! Something went wrong..."}) {
    return _SignInLocalizations(
      signInAnonymously: signInAnonymously,
      signInWithApple: signInWithApple,
      signInWithGoogle: signInWithGoogle,
      signInWithFacebook: signInWithFacebook,
      signInWithEmail: signInWithEmail,
      errorTitle: errorTitle,
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
      String errorTitle});
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
      String errorTitle});
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
      this.errorTitle = "Oops! Something went wrong..."});

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

  @override
  String toString() {
    return 'SignInLocalizations(signInAnonymously: $signInAnonymously, signInWithApple: $signInWithApple, signInWithGoogle: $signInWithGoogle, signInWithFacebook: $signInWithFacebook, signInWithEmail: $signInWithEmail, errorTitle: $errorTitle)';
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
                .equals(other.errorTitle, errorTitle));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(signInAnonymously),
      const DeepCollectionEquality().hash(signInWithApple),
      const DeepCollectionEquality().hash(signInWithGoogle),
      const DeepCollectionEquality().hash(signInWithFacebook),
      const DeepCollectionEquality().hash(signInWithEmail),
      const DeepCollectionEquality().hash(errorTitle));

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
      String errorTitle}) = _$_SignInLocalizations;

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
      {String? landingBackgroundImage,
      double maxWidth = 400,
      double buttonRadius = 8.0,
      double buttonPadding = 16.0,
      required Color buttonBackgroundColor,
      required Color buttonTextColor,
      double buttonFontSize = 18.0,
      double spaceBetweenButtons = 15.0}) {
    return _SignInTheme(
      landingBackgroundImage: landingBackgroundImage,
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
  String? get landingBackgroundImage => throw _privateConstructorUsedError;
  double get maxWidth => throw _privateConstructorUsedError;
  double get buttonRadius => throw _privateConstructorUsedError;
  double get buttonPadding => throw _privateConstructorUsedError;
  Color get buttonBackgroundColor => throw _privateConstructorUsedError;
  Color get buttonTextColor => throw _privateConstructorUsedError;
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
      {String? landingBackgroundImage,
      double maxWidth,
      double buttonRadius,
      double buttonPadding,
      Color buttonBackgroundColor,
      Color buttonTextColor,
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
    Object? landingBackgroundImage = freezed,
    Object? maxWidth = freezed,
    Object? buttonRadius = freezed,
    Object? buttonPadding = freezed,
    Object? buttonBackgroundColor = freezed,
    Object? buttonTextColor = freezed,
    Object? buttonFontSize = freezed,
    Object? spaceBetweenButtons = freezed,
  }) {
    return _then(_value.copyWith(
      landingBackgroundImage: landingBackgroundImage == freezed
          ? _value.landingBackgroundImage
          : landingBackgroundImage // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as Color,
      buttonTextColor: buttonTextColor == freezed
          ? _value.buttonTextColor
          : buttonTextColor // ignore: cast_nullable_to_non_nullable
              as Color,
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
      {String? landingBackgroundImage,
      double maxWidth,
      double buttonRadius,
      double buttonPadding,
      Color buttonBackgroundColor,
      Color buttonTextColor,
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
    Object? landingBackgroundImage = freezed,
    Object? maxWidth = freezed,
    Object? buttonRadius = freezed,
    Object? buttonPadding = freezed,
    Object? buttonBackgroundColor = freezed,
    Object? buttonTextColor = freezed,
    Object? buttonFontSize = freezed,
    Object? spaceBetweenButtons = freezed,
  }) {
    return _then(_SignInTheme(
      landingBackgroundImage: landingBackgroundImage == freezed
          ? _value.landingBackgroundImage
          : landingBackgroundImage // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as Color,
      buttonTextColor: buttonTextColor == freezed
          ? _value.buttonTextColor
          : buttonTextColor // ignore: cast_nullable_to_non_nullable
              as Color,
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
      {this.landingBackgroundImage,
      this.maxWidth = 400,
      this.buttonRadius = 8.0,
      this.buttonPadding = 16.0,
      required this.buttonBackgroundColor,
      required this.buttonTextColor,
      this.buttonFontSize = 18.0,
      this.spaceBetweenButtons = 15.0});

  @override
  final String? landingBackgroundImage;
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
  final Color buttonBackgroundColor;
  @override
  final Color buttonTextColor;
  @JsonKey()
  @override
  final double buttonFontSize;
  @JsonKey()
  @override
  final double spaceBetweenButtons;

  @override
  String toString() {
    return 'SignInTheme(landingBackgroundImage: $landingBackgroundImage, maxWidth: $maxWidth, buttonRadius: $buttonRadius, buttonPadding: $buttonPadding, buttonBackgroundColor: $buttonBackgroundColor, buttonTextColor: $buttonTextColor, buttonFontSize: $buttonFontSize, spaceBetweenButtons: $spaceBetweenButtons)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SignInTheme &&
            const DeepCollectionEquality()
                .equals(other.landingBackgroundImage, landingBackgroundImage) &&
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
      const DeepCollectionEquality().hash(landingBackgroundImage),
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
      {String? landingBackgroundImage,
      double maxWidth,
      double buttonRadius,
      double buttonPadding,
      required Color buttonBackgroundColor,
      required Color buttonTextColor,
      double buttonFontSize,
      double spaceBetweenButtons}) = _$_SignInTheme;

  @override
  String? get landingBackgroundImage;
  @override
  double get maxWidth;
  @override
  double get buttonRadius;
  @override
  double get buttonPadding;
  @override
  Color get buttonBackgroundColor;
  @override
  Color get buttonTextColor;
  @override
  double get buttonFontSize;
  @override
  double get spaceBetweenButtons;
  @override
  @JsonKey(ignore: true)
  _$SignInThemeCopyWith<_SignInTheme> get copyWith =>
      throw _privateConstructorUsedError;
}
