import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/firebase_options.dart';
import 'package:portfolio_website/view/about/about_page.dart';
import 'package:portfolio_website/view/home/home_controller.dart';
import 'package:portfolio_website/view/home/home_page.dart';
import 'package:portfolio_website/view/tech/tech_controller.dart';
import 'package:portfolio_website/view/tech/tech_page.dart';
import 'package:portfolio_website/view/work/work_page.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:portfolio_website/utils/navigation_controller.dart';

void main() async {
  usePathUrlStrategy(); // removes #
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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

      // Controllers register only once here
      initialBinding: BindingsBuilder(() {
        Get.put(HomeController());
        Get.put(TechStackController());
        Get.put(NavigationController()); // ✅ important
      }),

      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const HomePage()),
        GetPage(name: '/work', page: () => const WorkPage()),
        GetPage(name: '/tech', page: () => const TechPage()),
        GetPage(name: '/about', page: () => const AboutPage()),
      ],

      // ✅ Handle browser back/forward
      // routingCallback: (routing) {
      //   if (routing?.current != null) {
      //     final navController = Get.find<NavigationController>();
      //     if (navController.currentRoute.value != routing!.current!) {
      //       navController.currentRoute.value = routing.current!;
      //     }
      //   }
      // },
    );
  }
}
