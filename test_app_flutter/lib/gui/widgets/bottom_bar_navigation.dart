import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app_flutter/core/theme/colors_app_theme.dart';
import 'package:test_app_flutter/data/models/bottom_bar_item.dart';
import 'package:test_app_flutter/core/providers/bottom_bar_provider.dart';

const double paddingTop = 10.0;

class BottomBarNavigation extends StatelessWidget {
  const BottomBarNavigation(
      {Key? key, required this.currentPage, required this.pages})
      : super(key: key);

  final int currentPage;
  final List<BottomBarItem> pages;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: generateOptions(context),
      currentIndex: currentPage,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      selectedItemColor: ColorsAppTheme.primaryColor,
      unselectedItemColor: Colors.grey[400],
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        context.read<BottomBarProvider>().currentPage = index;
      },
    );
  }

  List<BottomNavigationBarItem> generateOptions(BuildContext context) =>
      List.generate(
        pages.length,
        (index) {
          return BottomNavigationBarItem(
            icon: Icon(
              pages[index].icon,
            ),
            label: pages[index].name,
          );
        },
      );
}
