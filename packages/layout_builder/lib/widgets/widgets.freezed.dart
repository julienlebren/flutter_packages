// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of widgets;

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NetworkErrorSettings {
  String? get title => throw _privateConstructorUsedError;
  String? get caption => throw _privateConstructorUsedError;
  String? get waiting => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NetworkErrorSettingsCopyWith<NetworkErrorSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkErrorSettingsCopyWith<$Res> {
  factory $NetworkErrorSettingsCopyWith(NetworkErrorSettings value,
          $Res Function(NetworkErrorSettings) then) =
      _$NetworkErrorSettingsCopyWithImpl<$Res, NetworkErrorSettings>;
  @useResult
  $Res call({String? title, String? caption, String? waiting});
}

/// @nodoc
class _$NetworkErrorSettingsCopyWithImpl<$Res,
        $Val extends NetworkErrorSettings>
    implements $NetworkErrorSettingsCopyWith<$Res> {
  _$NetworkErrorSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? caption = freezed,
    Object? waiting = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      caption: freezed == caption
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String?,
      waiting: freezed == waiting
          ? _value.waiting
          : waiting // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NetworkErrorSettingsCopyWith<$Res>
    implements $NetworkErrorSettingsCopyWith<$Res> {
  factory _$$_NetworkErrorSettingsCopyWith(_$_NetworkErrorSettings value,
          $Res Function(_$_NetworkErrorSettings) then) =
      __$$_NetworkErrorSettingsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? title, String? caption, String? waiting});
}

/// @nodoc
class __$$_NetworkErrorSettingsCopyWithImpl<$Res>
    extends _$NetworkErrorSettingsCopyWithImpl<$Res, _$_NetworkErrorSettings>
    implements _$$_NetworkErrorSettingsCopyWith<$Res> {
  __$$_NetworkErrorSettingsCopyWithImpl(_$_NetworkErrorSettings _value,
      $Res Function(_$_NetworkErrorSettings) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? caption = freezed,
    Object? waiting = freezed,
  }) {
    return _then(_$_NetworkErrorSettings(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      caption: freezed == caption
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String?,
      waiting: freezed == waiting
          ? _value.waiting
          : waiting // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_NetworkErrorSettings implements _NetworkErrorSettings {
  const _$_NetworkErrorSettings({this.title, this.caption, this.waiting});

  @override
  final String? title;
  @override
  final String? caption;
  @override
  final String? waiting;

  @override
  String toString() {
    return 'NetworkErrorSettings(title: $title, caption: $caption, waiting: $waiting)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NetworkErrorSettings &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.caption, caption) || other.caption == caption) &&
            (identical(other.waiting, waiting) || other.waiting == waiting));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, caption, waiting);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NetworkErrorSettingsCopyWith<_$_NetworkErrorSettings> get copyWith =>
      __$$_NetworkErrorSettingsCopyWithImpl<_$_NetworkErrorSettings>(
          this, _$identity);
}

abstract class _NetworkErrorSettings implements NetworkErrorSettings {
  const factory _NetworkErrorSettings(
      {final String? title,
      final String? caption,
      final String? waiting}) = _$_NetworkErrorSettings;

  @override
  String? get title;
  @override
  String? get caption;
  @override
  String? get waiting;
  @override
  @JsonKey(ignore: true)
  _$$_NetworkErrorSettingsCopyWith<_$_NetworkErrorSettings> get copyWith =>
      throw _privateConstructorUsedError;
}
