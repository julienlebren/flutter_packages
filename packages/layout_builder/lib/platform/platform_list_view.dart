import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layout_builder/platform/platform_widget_base.dart';
import 'package:layout_builder/theme/theme.dart';

class PlatformListView extends PlatformWidgetBase<ListView, ListView> {
  const PlatformListView({
    required this.itemCount,
    required this.itemBuilder,
    this.shrinkWrap = false,
    this.scrollPhysics = const AlwaysScrollableScrollPhysics(),
  }) : super();

  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final bool shrinkWrap;
  final ScrollPhysics scrollPhysics;

  @override
  ListView createMaterialWidget(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: itemBuilder,
      shrinkWrap: shrinkWrap,
    );
  }

  @override
  ListView createCupertinoWidget(BuildContext context, WidgetRef ref) {
    final listViewTheme = ref.watch(listViewThemeProvider);
    final appTheme = ref.watch(appThemeProvider);
    return ListView.separated(
      physics: scrollPhysics,
      padding: EdgeInsets.zero,
      itemCount: itemCount,
      itemBuilder: itemBuilder,
      shrinkWrap: shrinkWrap,
      separatorBuilder: (_, __) => Padding(
        padding: EdgeInsets.only(left: listViewTheme.separatorPadding),
        child: Divider(
          color: appTheme.borderColor,
          height: 0.5,
        ),
      ),
    );
  }
}
