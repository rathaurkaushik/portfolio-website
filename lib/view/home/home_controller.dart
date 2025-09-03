import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:js' as js;
import 'package:portfolio_website/constant/sns_links.dart';

class HomeController extends GetxController {
  final scrollController = ScrollController();
  final navbarKeys = List.generate(4, (_) => GlobalKey());
  var isDrawerOpen = false.obs; // for animation toggle

  void toggleDrawer() {
    isDrawerOpen.value = !isDrawerOpen.value;
  }

  void scrollToSection(int navIndex) {
    toggleDrawer(); // close drawer after click
    if (navIndex == 4) {
      js.context.callMethod('open', [SnsLinks.resume, "_blank"]);
      return;
    }
    final key = navbarKeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}

