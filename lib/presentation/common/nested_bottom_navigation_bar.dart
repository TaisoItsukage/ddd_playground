//BottomNavigationBarをネストさせる
import 'package:ddd_playground/presentation/dummy/first_dummy_page.dart';
import 'package:ddd_playground/presentation/dummy/forth_dummy_page.dart';
import 'package:ddd_playground/presentation/dummy/second_dummy_page.dart';
import 'package:ddd_playground/presentation/dummy/third_dummy_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NestedBottomNavigationBar extends HookConsumerWidget {
  NestedBottomNavigationBar({super.key, required int tabIndex})
      : assert(tabIndex != -1),
        index = tabIndex;

  late final int index;
  final pageList = [
    const FirstDummyPage(),
    const SecondDummyPage(),
    const ThirdDummyPage(),
    const ForthDummyPage(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: pageList[index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        onTap: (int index) {
          context.go('/tab/$index');
        },
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
