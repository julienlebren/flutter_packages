import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layout_builder/platform/platform_widget_base.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:layout_builder/theme/theme.dart';

part 'platform_tab_scaffold.freezed.dart';

@freezed
class TabItem with _$TabItem {
  const factory TabItem({
    required String title,
    required IconData icon,
    required IconData selectedIcon,
    required Widget router,
  }) = _TabItem;
}

final tabsProvider = Provider<List<TabItem>>((_) => throw UnimplementedError());

final _currentTabIndexProvider = StateProvider<int>((_) => 0);

class PlatformTabScaffold
    extends PlatformWidgetBase<AnnotatedRegion, CupertinoTabScaffold> {
  const PlatformTabScaffold() : super();

  ValueChanged<int>? onTap(int index, WidgetRef ref) {
    ref.read(_currentTabIndexProvider).state = index;
  }

  @override
  AnnotatedRegion createMaterialWidget(BuildContext context, WidgetRef ref) {
    final systemOverlayStyle = ref.watch(systemOverlayStyleProvider);
    final appTheme = ref.watch(appThemeProvider);
    final tabs = ref.watch(tabsProvider);
    final currentTabIndex = ref.watch(_currentTabIndexProvider).state;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: systemOverlayStyle,
      child: WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: Scaffold(
          body: Stack(
            children: tabs.asMap().entries.map((entry) {
              return Offstage(
                offstage: currentTabIndex != entry.key,
                child: entry.value.router,
              );
            }).toList(),
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: appTheme.scaffoldBackgroundColor,
            showUnselectedLabels: true,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            currentIndex: currentTabIndex,
            type: BottomNavigationBarType.fixed,
            iconSize: 30,
            onTap: (index) => onTap(index, ref),
            items: tabs.map((item) => _tabItem(item)).toList(),
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _tabItem(TabItem item) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: EdgeInsets.symmetric(vertical: 3),
        child: Icon(item.icon),
      ),
      label: item.title,
    );
  }

  @override
  CupertinoTabScaffold createCupertinoWidget(
      BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(appThemeProvider);
    final currentTabIndex = ref.watch(_currentTabIndexProvider).state;
    final tabs = ref.watch(tabsProvider);
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        currentIndex: currentTabIndex,
        onTap: (index) => onTap(index, ref),
        backgroundColor: appTheme.scaffoldBackgroundColor,
        inactiveColor: Colors.grey,
        iconSize: 30,
        items: tabs.map((item) => _tabItem(item)).toList(),
        border: Border(
          top: BorderSide(color: appTheme.navigationBarBorderColor),
        ),
      ),
      tabBuilder: (_, index) => tabs[index].router,
    );
  }
}
