import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_website/constant/sns_links.dart';
import 'dart:js' as js;

class HomeController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final navbarKeys = List.generate(4, (_) => GlobalKey());

  void scrollToSection(int navIndex) {
    if (navIndex == 4) {
      js.context.callMethod('open', [SnsLinks.blog]);
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
