import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:three_links/pages/links_first/links_first_view.dart';
import 'package:three_links/pages/links_second/links_second_view.dart';

import '../../main.dart';
import 'links_tab_logic.dart';

class LinksTabPage extends GetView<LinksTabLogic> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [
          LinksFirstPage(),
          LinksSecondPage()
        ],
      ),
      bottomNavigationBar: Obx(()=>_navLinksBars()),
    );
  }

  Widget _navLinksBars() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled,color: Colors.grey.withOpacity(0.6)),
          activeIcon:Icon(Icons.home_filled,color: primaryColor),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings,color: Colors.grey.withOpacity(0.6)),
          activeIcon:Icon(Icons.settings,color: primaryColor),
          label: 'Setting',
        ),
      ],
      currentIndex: controller.currentIndex.value,
      onTap: (index) {
        controller.currentIndex.value = index;
        controller.pageController.jumpToPage(index);
      },
    );
  }
}
