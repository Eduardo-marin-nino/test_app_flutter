import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:test_app_flutter/data/models/bottom_bar_item.dart';
import 'package:test_app_flutter/gui/widgets/bottom_bar_navigation.dart';
import 'package:test_app_flutter/core/providers/bottom_bar_provider.dart';
import 'package:test_app_flutter/gui/views/list_user_view/list_user_view.dart';
import 'package:test_app_flutter/gui/views/list_images_view/list_images_view.dart';

const List<BottomBarItem> pages = [
  BottomBarItem(icon: Feather.home, name: "Inicio", widget: ListUserHome()),
  BottomBarItem(
    icon: Feather.user,
    name: "Imagenes",
    widget: ListImagesView(),
  ),
];

class MainTemplate extends StatelessWidget {
  const MainTemplate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentPage = context.watch<BottomBarProvider>().currentPage;
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: List.generate(
          pages.length,
          (index) => pages[index].widget,
        ),
      ),
      bottomNavigationBar: BottomBarNavigation(
        pages: pages,
        currentPage: currentPage,
      ),
    );
  }
}
