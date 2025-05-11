import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/pages/home_page.dart';
import 'package:portfolio_website/pages/work.dart';
import 'package:portfolio_website/styles/theme.dart';


void main() {
  runApp(const MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kaushik Rathaur | App Dev',
      theme: ThemeData(
brightness: Brightness.light,
        textTheme: GoogleFonts.poppinsTextTheme(),
        fontFamily: 'Aptos',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/work': (context) => const WorkPage(),
        // '/about': (context) => const AboutPage(),
        // '/tech': (context) => const TechPage(),
        // '/mark': (context) => const MarkPage(),
        // '/resume': (context) => const ResumePage(),
      },

    );
  }
}
