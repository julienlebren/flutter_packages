// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of platform;

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TabItem {
  String get title => throw _privateConstructorUsedError;
  Widget get icon => throw _privateConstructorUsedError;
  Widget? get selectedIcon => throw _privateConstructorUsedError;
  PlatformTabNavigator get router => throw _privateConstructorUsedError;
  bool? get popToFirstRoute => throw _privateConstructorUsedError;
  StateProvider<ScrollController>? get scrollControllerProvider =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TabItemCopyWith<TabItem> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TabItemCopyWith<$Res> {
  factory $TabItemCopyWith(TabItem value, $Res Function(TabItem) then) =
      _$TabItemCopyWithImpl<$Res, TabItem>;
  @useResult
  $Res call(
      {String title,
      Widget icon,
      Widget? selectedIcon,
      PlatformTabNavigator router,
      bool? popToFirstRoute,
      StateProvider<ScrollController>? scrollControllerProvider});
}

/// @nodoc
class _$TabItemCopyWithImpl<$Res, $Val extends TabItem>
    implements $TabItemCopyWith<$Res> {
  _$TabItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? icon = null,
    Object? selectedIcon = freezed,
    Object? router = null,
    Object? popToFirstRoute = freezed,
    Object? scrollControllerProvider = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Widget,
      selectedIcon: freezed == selectedIcon
          ? _value.selectedIcon
          : selectedIcon // ignore: cast_nullable_to_non_nullable
              as Widget?,
      router: null == router
          ? _value.router
          : router // ignore: cast_nullable_to_non_nullable
              as PlatformTabNavigator,
      popToFirstRoute: freezed == popToFirstRoute
          ? _value.popToFirstRoute
          : popToFirstRoute // ignore: cast_nullable_to_non_nullable
              as bool?,
      scrollControllerProvider: freezed == scrollControllerProvider
          ? _value.scrollControllerProvider
          : scrollControllerProvider // ignore: cast_nullable_to_non_nullable
              as StateProvider<ScrollController>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TabItemCopyWith<$Res> implements $TabItemCopyWith<$Res> {
  factory _$$_TabItemCopyWith(
          _$_TabItem value, $Res Function(_$_TabItem) then) =
      __$$_TabItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      Widget icon,
      Widget? selectedIcon,
      PlatformTabNavigator router,
      bool? popToFirstRoute,
      StateProvider<ScrollController>? scrollControllerProvider});
}

/// @nodoc
class __$$_TabItemCopyWithImpl<$Res>
    extends _$TabItemCopyWithImpl<$Res, _$_TabItem>
    implements _$$_TabItemCopyWith<$Res> {
  __$$_TabItemCopyWithImpl(_$_TabItem _value, $Res Function(_$_TabItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? icon = null,
    Object? selectedIcon = freezed,
    Object? router = null,
    Object? popToFirstRoute = freezed,
    Object? scrollControllerProvider = freezed,
  }) {
    return _then(_$_TabItem(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Widget,
      selectedIcon: freezed == selectedIcon
          ? _value.selectedIcon
          : selectedIcon // ignore: cast_nullable_to_non_nullable
              as Widget?,
      router: null == router
          ? _value.router
          : router // ignore: cast_nullable_to_non_nullable
              as PlatformTabNavigator,
      popToFirstRoute: freezed == popToFirstRoute
          ? _value.popToFirstRoute
          : popToFirstRoute // ignore: cast_nullable_to_non_nullable
              as bool?,
      scrollControllerProvider: freezed == scrollControllerProvider
          ? _value.scrollControllerProvider
          : scrollControllerProvider // ignore: cast_nullable_to_non_nullable
              as StateProvider<ScrollController>?,
    ));
  }
}

/// @nodoc

class _$_TabItem implements _TabItem {
  const _$_TabItem(
      {required this.title,
      required this.icon,
      this.selectedIcon,
      required this.router,
      this.popToFirstRoute = false,
      this.scrollControllerProvider});

  @override
  final String title;
  @override
  final Widget icon;
  @override
  final Widget? selectedIcon;
  @override
  final PlatformTabNavigator router;
  @override
  @JsonKey()
  final bool? popToFirstRoute;
  @override
  final StateProvider<ScrollController>? scrollControllerProvider;

  @override
  String toString() {
    return 'TabItem(title: $title, icon: $icon, selectedIcon: $selectedIcon, router: $router, popToFirstRoute: $popToFirstRoute, scrollControllerProvider: $scrollControllerProvider)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TabItem &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.selectedIcon, selectedIcon) ||
                other.selectedIcon == selectedIcon) &&
            (identical(other.router, router) || other.router == router) &&
            (identical(other.popToFirstRoute, popToFirstRoute) ||
                other.popToFirstRoute == popToFirstRoute) &&
            (identical(
                    other.scrollControllerProvider, scrollControllerProvider) ||
                other.scrollControllerProvider == scrollControllerProvider));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, icon, selectedIcon,
      router, popToFirstRoute, scrollControllerProvider);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TabItemCopyWith<_$_TabItem> get copyWith =>
      __$$_TabItemCopyWithImpl<_$_TabItem>(this, _$identity);
}

abstract class _TabItem implements TabItem {
  const factory _TabItem(
          {required final String title,
          required final Widget icon,
          final Widget? selectedIcon,
          required final PlatformTabNavigator router,
          final bool? popToFirstRoute,
          final StateProvider<ScrollController>? scrollControllerProvider}) =
      _$_TabItem;

  @override
  String get title;
  @override
  Widget get icon;
  @override
  Widget? get selectedIcon;
  @override
  PlatformTabNavigator get router;
  @override
  bool? get popToFirstRoute;
  @override
  StateProvider<ScrollController>? get scrollControllerProvider;
  @override
  @JsonKey(ignore: true)
  _$$_TabItemCopyWith<_$_TabItem> get copyWith =>
      throw _privateConstructorUsedError;
}
