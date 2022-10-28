//BottomNavigationBarをネストさせる
import 'package:ddd_playground/presentation/dummy/first_dummy_page.dart';
import 'package:ddd_playground/presentation/dummy/forth_dummy_page.dart';
import 'package:ddd_playground/presentation/dummy/second_dummy_page.dart';
import 'package:ddd_playground/presentation/dummy/third_dummy_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NestedBottomNavigationBar extends HookConsumerWidget {
  NestedBottomNavigationBar({super.key, required this.child});
  final Widget child;
  final pageList = [
    const FirstDummyPage(),
    const SecondDummyPage(),
    const ThirdDummyPage(),
    const ForthDummyPage(),
  ];

  static const _tabs = [
    ScaffoldWithNavBarTabItem(
      initialLocation: '/a',
      icon: Icon(Icons.home),
      label: 'Section A',
    ),
    ScaffoldWithNavBarTabItem(
      initialLocation: '/b',
      icon: Icon(Icons.settings),
      label: 'Section B',
    ),
    ScaffoldWithNavBarTabItem(
      initialLocation: '/c',
      icon: Icon(Icons.home),
      label: 'Section C',
    ),
    ScaffoldWithNavBarTabItem(
      initialLocation: '/d',
      icon: Icon(Icons.settings),
      label: 'Section D',
    ),
  ];

  int _currentIndex(BuildContext context) {
    return _locationToTabIndex(GoRouter.of(context).location);
  }

  int _locationToTabIndex(String location) {
    final index =
        _tabs.indexWhere((t) => location.startsWith(t.initialLocation));
    // if index not found (-1), return 0
    return index < 0 ? 0 : index;
  }

  // callback used to navigate to the desired tab
  void _onItemTapped(BuildContext context, int tabIndex) {
    if (tabIndex != _currentIndex(context)) {
      // go to the initial location of the selected tab (by index)
      context.go(_tabs[tabIndex].initialLocation);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex(context),
        onTap: (index) => _onItemTapped(context, index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.app_blocking),
            label: 'app_bar',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.radio_button_on,
            ),
            label: 'button_page',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'card',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.safety_divider),
            label: 'navigation_rail',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.navigate_next_sharp),
            label: 'navigation_bar',
          )
        ],
      ),
    );
  }
}

class ScaffoldWithNavBarTabItem extends BottomNavigationBarItem {
  const ScaffoldWithNavBarTabItem({
    required this.initialLocation,
    required super.icon,
    super.label,
  });

  /// The initial location/path
  final String initialLocation;
}
