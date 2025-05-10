import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/pages/home_page.dart';
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

      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        fontFamily: 'Aptos',
      ),

      title: 'Kaushik Rathaur | App Dev',
      home: const HomePage(),
    );
  }
}
