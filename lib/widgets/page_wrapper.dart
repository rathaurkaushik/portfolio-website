import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_website/utils/navigation_controller.dart';
import 'package:portfolio_website/view/about/about_page.dart';
import 'package:portfolio_website/view/home/home_page.dart';
import 'package:portfolio_website/view/tech/tech_page.dart';
import 'package:portfolio_website/view/work/work_page.dart';

class PageWrapper extends StatelessWidget {
  PageWrapper({super.key});
  final navController = Get.find<NavigationController>();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: ValueKey(navController.currentRoute.value), // ✅ forces rebuild
      onGenerateRoute: (_) {
        switch (navController.currentRoute.value) {
          case '/':
            return MaterialPageRoute(builder: (_) => const HomePage());
          case '/work':
            return MaterialPageRoute(builder: (_) => const WorkPage());
          case '/tech':
            return MaterialPageRoute(builder: (_) => TechPage());
          case '/about':
            return MaterialPageRoute(builder: (_) => const AboutPage());
          default:
            return MaterialPageRoute(builder: (_) => const HomePage());
        }
      },
    );
  }
}
