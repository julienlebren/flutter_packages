// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'platform_tab_scaffold.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TabItemTearOff {
  const _$TabItemTearOff();

  _TabItem call(
      {required String title,
      required IconData icon,
      required IconData selectedIcon,
      required Widget router}) {
    return _TabItem(
      title: title,
      icon: icon,
      selectedIcon: selectedIcon,
      router: router,
    );
  }
}

/// @nodoc
const $TabItem = _$TabItemTearOff();

/// @nodoc
mixin _$TabItem {
  String get title => throw _privateConstructorUsedError;
  IconData get icon => throw _privateConstructorUsedError;
  IconData get selectedIcon => throw _privateConstructorUsedError;
  Widget get router => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TabItemCopyWith<TabItem> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TabItemCopyWith<$Res> {
  factory $TabItemCopyWith(TabItem value, $Res Function(TabItem) then) =
      _$TabItemCopyWithImpl<$Res>;
  $Res call(
      {String title, IconData icon, IconData selectedIcon, Widget router});
}

/// @nodoc
class _$TabItemCopyWithImpl<$Res> implements $TabItemCopyWith<$Res> {
  _$TabItemCopyWithImpl(this._value, this._then);

  final TabItem _value;
  // ignore: unused_field
  final $Res Function(TabItem) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? icon = freezed,
    Object? selectedIcon = freezed,
    Object? router = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData,
      selectedIcon: selectedIcon == freezed
          ? _value.selectedIcon
          : selectedIcon // ignore: cast_nullable_to_non_nullable
              as IconData,
      router: router == freezed
          ? _value.router
          : router // ignore: cast_nullable_to_non_nullable
              as Widget,
    ));
  }
}

/// @nodoc
abstract class _$TabItemCopyWith<$Res> implements $TabItemCopyWith<$Res> {
  factory _$TabItemCopyWith(_TabItem value, $Res Function(_TabItem) then) =
      __$TabItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {String title, IconData icon, IconData selectedIcon, Widget router});
}

/// @nodoc
class __$TabItemCopyWithImpl<$Res> extends _$TabItemCopyWithImpl<$Res>
    implements _$TabItemCopyWith<$Res> {
  __$TabItemCopyWithImpl(_TabItem _value, $Res Function(_TabItem) _then)
      : super(_value, (v) => _then(v as _TabItem));

  @override
  _TabItem get _value => super._value as _TabItem;

  @override
  $Res call({
    Object? title = freezed,
    Object? icon = freezed,
    Object? selectedIcon = freezed,
    Object? router = freezed,
  }) {
    return _then(_TabItem(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData,
      selectedIcon: selectedIcon == freezed
          ? _value.selectedIcon
          : selectedIcon // ignore: cast_nullable_to_non_nullable
              as IconData,
      router: router == freezed
          ? _value.router
          : router // ignore: cast_nullable_to_non_nullable
              as Widget,
    ));
  }
}

/// @nodoc

class _$_TabItem implements _TabItem {
  _$_TabItem(
      {required this.title,
      required this.icon,
      required this.selectedIcon,
      required this.router});

  @override
  final String title;
  @override
  final IconData icon;
  @override
  final IconData selectedIcon;
  @override
  final Widget router;

  @override
  String toString() {
    return 'TabItem(title: $title, icon: $icon, selectedIcon: $selectedIcon, router: $router)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TabItem &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.icon, icon) ||
                const DeepCollectionEquality().equals(other.icon, icon)) &&
            (identical(other.selectedIcon, selectedIcon) ||
                const DeepCollectionEquality()
                    .equals(other.selectedIcon, selectedIcon)) &&
            (identical(other.router, router) ||
                const DeepCollectionEquality().equals(other.router, router)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(icon) ^
      const DeepCollectionEquality().hash(selectedIcon) ^
      const DeepCollectionEquality().hash(router);

  @JsonKey(ignore: true)
  @override
  _$TabItemCopyWith<_TabItem> get copyWith =>
      __$TabItemCopyWithImpl<_TabItem>(this, _$identity);
}

abstract class _TabItem implements TabItem {
  factory _TabItem(
      {required String title,
      required IconData icon,
      required IconData selectedIcon,
      required Widget router}) = _$_TabItem;

  @override
  String get title => throw _privateConstructorUsedError;
  @override
  IconData get icon => throw _privateConstructorUsedError;
  @override
  IconData get selectedIcon => throw _privateConstructorUsedError;
  @override
  Widget get router => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TabItemCopyWith<_TabItem> get copyWith =>
      throw _privateConstructorUsedError;
}
