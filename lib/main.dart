import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/view/home/home_controller.dart';
import 'package:portfolio_website/view/home/home_page.dart';
import 'package:portfolio_website/view/work/work.dart';
import 'package:portfolio_website/view/tech/tech_controller.dart';
import 'package:portfolio_website/view/tech/tech_page.dart';

void main() {
  runApp(const MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kaushik Rathaur | App Dev',
      theme: ThemeData(
        brightness: Brightness.light,
        textTheme: GoogleFonts.poppinsTextTheme(),
        fontFamily: 'Aptos',
      ),
      initialBinding: BindingsBuilder(() {
        Get.put(HomeController());
        Get.put(TechStackController());
      }),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const HomePage()),
        GetPage(name: '/work', page: () => const WorkPage()),
        GetPage(name: '/tech', page: () => TechPageShowcase()),
        // GetPage(name: '/tech', page: () => const TechPage()),
        // GetPage(name: '/mark', page: () => const MarkPage()),
        // GetPage(name: '/resume', page: () => const ResumePage()),
      ],
    );
  }
}
