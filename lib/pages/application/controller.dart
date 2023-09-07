import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class ApplicationController extends GetxController {
  ApplicationController();
  final state = ApplicationState();

  late final List<String> tabTitles;
  late final PageController pageController;
  late final List<BottomNavigationBarItem> bottomTabs;

  @override
  void onInit() {
    super.onInit();
    tabTitles = ["Chat", "Contact", "Profile"];
    bottomTabs = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
          icon: Icon(Icons.message),
          activeIcon: Icon(Icons.chat),
          label: "Chat"),
      const BottomNavigationBarItem(
          icon: Icon(Icons.contact_page),
          activeIcon: Icon(Icons.contact_page),
          label: "Contact"),
      const BottomNavigationBarItem(
          icon: Icon(Icons.person),
          activeIcon: Icon(Icons.person),
          label: "Profile")
    ];
    pageController = PageController(initialPage: state.page);
  }

  void handPageChanged(int index) {
    state.page = index;
  }

  void handelNavBarTap(int index) {
    pageController.jumpToPage(index);
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }
}
