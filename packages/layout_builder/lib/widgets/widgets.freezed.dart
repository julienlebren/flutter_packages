// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of widgets;

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NetworkErrorSettings {
  String get title => throw _privateConstructorUsedError;
  String get caption => throw _privateConstructorUsedError;
  String get waiting => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NetworkErrorSettingsCopyWith<NetworkErrorSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkErrorSettingsCopyWith<$Res> {
  factory $NetworkErrorSettingsCopyWith(NetworkErrorSettings value,
          $Res Function(NetworkErrorSettings) then) =
      _$NetworkErrorSettingsCopyWithImpl<$Res>;
  $Res call({String title, String caption, String waiting});
}

/// @nodoc
class _$NetworkErrorSettingsCopyWithImpl<$Res>
    implements $NetworkErrorSettingsCopyWith<$Res> {
  _$NetworkErrorSettingsCopyWithImpl(this._value, this._then);

  final NetworkErrorSettings _value;
  // ignore: unused_field
  final $Res Function(NetworkErrorSettings) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? caption = freezed,
    Object? waiting = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      caption: caption == freezed
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String,
      waiting: waiting == freezed
          ? _value.waiting
          : waiting // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_NetworkErrorSettingsCopyWith<$Res>
    implements $NetworkErrorSettingsCopyWith<$Res> {
  factory _$$_NetworkErrorSettingsCopyWith(_$_NetworkErrorSettings value,
          $Res Function(_$_NetworkErrorSettings) then) =
      __$$_NetworkErrorSettingsCopyWithImpl<$Res>;
  @override
  $Res call({String title, String caption, String waiting});
}

/// @nodoc
class __$$_NetworkErrorSettingsCopyWithImpl<$Res>
    extends _$NetworkErrorSettingsCopyWithImpl<$Res>
    implements _$$_NetworkErrorSettingsCopyWith<$Res> {
  __$$_NetworkErrorSettingsCopyWithImpl(_$_NetworkErrorSettings _value,
      $Res Function(_$_NetworkErrorSettings) _then)
      : super(_value, (v) => _then(v as _$_NetworkErrorSettings));

  @override
  _$_NetworkErrorSettings get _value => super._value as _$_NetworkErrorSettings;

  @override
  $Res call({
    Object? title = freezed,
    Object? caption = freezed,
    Object? waiting = freezed,
  }) {
    return _then(_$_NetworkErrorSettings(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      caption: caption == freezed
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String,
      waiting: waiting == freezed
          ? _value.waiting
          : waiting // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_NetworkErrorSettings implements _NetworkErrorSettings {
  const _$_NetworkErrorSettings(
      {required this.title, required this.caption, required this.waiting});

  @override
  final String title;
  @override
  final String caption;
  @override
  final String waiting;

  @override
  String toString() {
    return 'NetworkErrorSettings(title: $title, caption: $caption, waiting: $waiting)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NetworkErrorSettings &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.caption, caption) &&
            const DeepCollectionEquality().equals(other.waiting, waiting));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(caption),
      const DeepCollectionEquality().hash(waiting));

  @JsonKey(ignore: true)
  @override
  _$$_NetworkErrorSettingsCopyWith<_$_NetworkErrorSettings> get copyWith =>
      __$$_NetworkErrorSettingsCopyWithImpl<_$_NetworkErrorSettings>(
          this, _$identity);
}

abstract class _NetworkErrorSettings implements NetworkErrorSettings {
  const factory _NetworkErrorSettings(
      {required final String title,
      required final String caption,
      required final String waiting}) = _$_NetworkErrorSettings;

  @override
  String get title;
  @override
  String get caption;
  @override
  String get waiting;
  @override
  @JsonKey(ignore: true)
  _$$_NetworkErrorSettingsCopyWith<_$_NetworkErrorSettings> get copyWith =>
      throw _privateConstructorUsedError;
}
