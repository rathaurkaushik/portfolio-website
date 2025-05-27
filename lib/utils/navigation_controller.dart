import 'package:get/get.dart';

class NavigationController extends GetxController {
  final currentRoute = '/'.obs;
  final routeNames = ['/work', '/about', '/tech', '/mark', '/resume'];
  void changeRoute(String route) {
    currentRoute.value = route;
    Get.toNamed(route);
  }
  void onNavMenuTap(int index) {
    changeRoute(routeNames[index]);
  }
}
