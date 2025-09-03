import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final currentRoute = '/'.obs;
  final routeNames = ['/work', '/about', '/tech'];

  void changeRoute(String route) {
    if (currentRoute.value != route) {
      currentRoute.value = route;
      Get.offNamed(route); // ✅ replaces instead of stacking
    }
  }

  void onNavMenuTap(int index) {
    changeRoute(routeNames[index]);
  }
}
