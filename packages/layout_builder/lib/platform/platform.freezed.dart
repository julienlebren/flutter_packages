// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of platform;

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
      required Widget icon,
      Widget? selectedIcon,
      required PlatformTabNavigator router,
      bool? popToFirstRoute = false,
      Provider<dynamic>? scrollControllerProvider}) {
    return _TabItem(
      title: title,
      icon: icon,
      selectedIcon: selectedIcon,
      router: router,
      popToFirstRoute: popToFirstRoute,
      scrollControllerProvider: scrollControllerProvider,
    );
  }
}

/// @nodoc
const $TabItem = _$TabItemTearOff();

/// @nodoc
mixin _$TabItem {
  String get title => throw _privateConstructorUsedError;
  Widget get icon => throw _privateConstructorUsedError;
  Widget? get selectedIcon => throw _privateConstructorUsedError;
  PlatformTabNavigator get router => throw _privateConstructorUsedError;
  bool? get popToFirstRoute => throw _privateConstructorUsedError;
  Provider<dynamic>? get scrollControllerProvider =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TabItemCopyWith<TabItem> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TabItemCopyWith<$Res> {
  factory $TabItemCopyWith(TabItem value, $Res Function(TabItem) then) =
      _$TabItemCopyWithImpl<$Res>;
  $Res call(
      {String title,
      Widget icon,
      Widget? selectedIcon,
      PlatformTabNavigator router,
      bool? popToFirstRoute,
      Provider<dynamic>? scrollControllerProvider});
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
    Object? popToFirstRoute = freezed,
    Object? scrollControllerProvider = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Widget,
      selectedIcon: selectedIcon == freezed
          ? _value.selectedIcon
          : selectedIcon // ignore: cast_nullable_to_non_nullable
              as Widget?,
      router: router == freezed
          ? _value.router
          : router // ignore: cast_nullable_to_non_nullable
              as PlatformTabNavigator,
      popToFirstRoute: popToFirstRoute == freezed
          ? _value.popToFirstRoute
          : popToFirstRoute // ignore: cast_nullable_to_non_nullable
              as bool?,
      scrollControllerProvider: scrollControllerProvider == freezed
          ? _value.scrollControllerProvider
          : scrollControllerProvider // ignore: cast_nullable_to_non_nullable
              as Provider<dynamic>?,
    ));
  }
}

/// @nodoc
abstract class _$TabItemCopyWith<$Res> implements $TabItemCopyWith<$Res> {
  factory _$TabItemCopyWith(_TabItem value, $Res Function(_TabItem) then) =
      __$TabItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {String title,
      Widget icon,
      Widget? selectedIcon,
      PlatformTabNavigator router,
      bool? popToFirstRoute,
      Provider<dynamic>? scrollControllerProvider});
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
    Object? popToFirstRoute = freezed,
    Object? scrollControllerProvider = freezed,
  }) {
    return _then(_TabItem(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Widget,
      selectedIcon: selectedIcon == freezed
          ? _value.selectedIcon
          : selectedIcon // ignore: cast_nullable_to_non_nullable
              as Widget?,
      router: router == freezed
          ? _value.router
          : router // ignore: cast_nullable_to_non_nullable
              as PlatformTabNavigator,
      popToFirstRoute: popToFirstRoute == freezed
          ? _value.popToFirstRoute
          : popToFirstRoute // ignore: cast_nullable_to_non_nullable
              as bool?,
      scrollControllerProvider: scrollControllerProvider == freezed
          ? _value.scrollControllerProvider
          : scrollControllerProvider // ignore: cast_nullable_to_non_nullable
              as Provider<dynamic>?,
    ));
  }
}

/// @nodoc

class _$_TabItem with DiagnosticableTreeMixin implements _TabItem {
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
  @JsonKey()
  @override
  final bool? popToFirstRoute;
  @override
  final Provider<dynamic>? scrollControllerProvider;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TabItem(title: $title, icon: $icon, selectedIcon: $selectedIcon, router: $router, popToFirstRoute: $popToFirstRoute, scrollControllerProvider: $scrollControllerProvider)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TabItem'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('icon', icon))
      ..add(DiagnosticsProperty('selectedIcon', selectedIcon))
      ..add(DiagnosticsProperty('router', router))
      ..add(DiagnosticsProperty('popToFirstRoute', popToFirstRoute))
      ..add(DiagnosticsProperty(
          'scrollControllerProvider', scrollControllerProvider));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TabItem &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.icon, icon) &&
            const DeepCollectionEquality()
                .equals(other.selectedIcon, selectedIcon) &&
            const DeepCollectionEquality().equals(other.router, router) &&
            const DeepCollectionEquality()
                .equals(other.popToFirstRoute, popToFirstRoute) &&
            const DeepCollectionEquality().equals(
                other.scrollControllerProvider, scrollControllerProvider));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(icon),
      const DeepCollectionEquality().hash(selectedIcon),
      const DeepCollectionEquality().hash(router),
      const DeepCollectionEquality().hash(popToFirstRoute),
      const DeepCollectionEquality().hash(scrollControllerProvider));

  @JsonKey(ignore: true)
  @override
  _$TabItemCopyWith<_TabItem> get copyWith =>
      __$TabItemCopyWithImpl<_TabItem>(this, _$identity);
}

abstract class _TabItem implements TabItem {
  const factory _TabItem(
      {required String title,
      required Widget icon,
      Widget? selectedIcon,
      required PlatformTabNavigator router,
      bool? popToFirstRoute,
      Provider<dynamic>? scrollControllerProvider}) = _$_TabItem;

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
  Provider<dynamic>? get scrollControllerProvider;
  @override
  @JsonKey(ignore: true)
  _$TabItemCopyWith<_TabItem> get copyWith =>
      throw _privateConstructorUsedError;
}
