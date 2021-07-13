import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layout_builder/platform/platform_widget_base.dart';
import 'package:layout_builder/theme/theme.dart';

class PlatformTabScaffold
    extends PlatformWidgetBase<AnnotatedRegion, CupertinoTabScaffold> {
  const PlatformTabScaffold({
    required this.onTap,
    required this.items,
    required this.tabViews,
    required this.currentTabIndex,
  }) : super();

  final ValueChanged<int>? onTap;
  final List<BottomNavigationBarItem> items;
  final List<Widget> tabViews;
  final int currentTabIndex; // For Material only

  @override
  AnnotatedRegion createMaterialWidget(BuildContext context, WidgetRef ref) {
    final systemOverlayStyle = ref.watch(systemOverlayStyleProvider);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: systemOverlayStyle,
      child: WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: Scaffold(
          body: Stack(
            children: tabViews.asMap().entries.map((entry) {
              return Offstage(
                offstage: currentTabIndex != entry.key,
                child: entry.value,
              );
            }).toList(),
          ),
          bottomNavigationBar: BottomNavigationBar(
            showUnselectedLabels: true,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            currentIndex: currentTabIndex,
            type: BottomNavigationBarType.fixed,
            iconSize: 30,
            onTap: onTap,
            items: items,
          ),
        ),
      ),
    );
  }

  @override
  CupertinoTabScaffold createCupertinoWidget(
      BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(appThemeProvider);
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        onTap: onTap,
        //backgroundColor: appTheme.scaffoldBackgroundColor,
        inactiveColor: Colors.grey,
        iconSize: 30,
        items: items,
        border: Border(
          top: BorderSide(color: appTheme.navigationBarBorderColor),
        ),
      ),
      tabBuilder: (_, index) => tabViews[index],
    );
  }
}
