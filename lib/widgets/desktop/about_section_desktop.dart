import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/constant/app_image.dart';
import 'package:portfolio_website/constant/colors.dart';
import 'package:portfolio_website/view/about/about%20controller.dart';
import 'package:portfolio_website/view/tech/tech_controller.dart';

class AboutSectionDesktop extends StatelessWidget {
  final TechStackController controller = Get.put(TechStackController());
  final AboutController aboutController = Get.put(AboutController());

  AboutSectionDesktop({super.key});

  final Shader linearGradient = const LinearGradient(
    colors: <Color>[
      // Colors.red,
      Colors.red,
      Color(0xFFFBB034), // right
      // CustomColor.webDev,
      Colors.blue,
      Colors.red,
    ],
  ).createShader(const Rect.fromLTWH(0, 500, 1000.0, 700.0));

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.20, // 10% of screen width
        vertical: screenHeight * 0.05, // 5% of screen height
      ),
      child: Column(
        children: [
          // Title
          Text(
            'About',
            style: TextStyle(
              fontSize: screenWidth * 0.04, // Responsive font
              fontWeight: FontWeight.bold,
              fontFamily: 'Aptos',

              foreground: Paint()..shader = linearGradient,
            ),
          ),
          Container(
            height: screenHeight * 0.21,
            decoration: BoxDecoration(
              border: Border.all(color: CustomColor.whitePrimary, width: 3),
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(17),
              child: Image.network(AppImages.about_image),
            ),
          ),
          SizedBox(height: screenHeight * 0.05),

          /// ==== Name and Work ====
          Text(
            'Kaushik Rathaur',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Aptos-bold',
              color: CustomColor.whitePrimary,
            ),
          ),
          Text(
            'NOOB Data Engineer, PRO at breaking pipelines',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              fontFamily: 'Aptos-bold',
              color: CustomColor.hintDark,
              height: 1,
            ),
          ),

          SizedBox(height: screenHeight * 0.05),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, // evenly spaced
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.01,
                        vertical: screenHeight * 0.005),
                    margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.005),
                    decoration: BoxDecoration(
                      color: CustomColor.data_skill,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        'Big Data',
                        style: TextStyle(
                          color: CustomColor.data_title,
                          fontFamily: 'Aptos',
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.012, // responsive font
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.01,
                        vertical: screenHeight * 0.005),
                    margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.005),
                    decoration: BoxDecoration(
                      color: CustomColor.webBack,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        'App',
                        style: TextStyle(
                          color: CustomColor.webDev,
                          fontFamily: 'Aptos',
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.012,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.01,
                        vertical: screenHeight * 0.005),
                    margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.005),
                    decoration: BoxDecoration(
                      color: CustomColor.experienceBackground,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        'AI - ML',
                        style: TextStyle(
                          color: Colors.deepPurpleAccent,
                          fontFamily: 'Aptos',
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.012,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.001,
                        vertical: screenHeight * 0.005),
                    margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.001),
                    decoration: BoxDecoration(
                      color: CustomColor.data_eng,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        'Data Eng',
                        style: TextStyle(
                          color: CustomColor.data_eng_title,
                          fontFamily: 'Aptos',
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.012,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),


          SizedBox(height: screenHeight * 0.05),

          /// About and experience
          Text(
            aboutController.about,
            style: GoogleFonts.openSans(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: CustomColor.whitePrimary,
              height: 1
            ),
          ),

          SizedBox(height: screenHeight * 0.05),

      Align(
        alignment: Alignment.centerLeft, // or centerRight, center
        child: Text(
          'Current',
          style: GoogleFonts.openSans(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            color: CustomColor.hintDark,
          ),
        ),
      ),

      /// First Experience
          ///
          Align (
            alignment: Alignment.centerLeft,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Hitachi Systems India",
                    style: GoogleFonts.openSans(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent, // 👈 Company name ka color
                    ),
                  ),
                  TextSpan(
                    text: " — IT Specialist",
                    style: GoogleFonts.openSans(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: CustomColor.whitePrimary, // 👈 Normal color
                    ),
                  ),
                ],
              ),
            ),
          ),

          Align(
            alignment: Alignment.centerLeft, // or centerRight, center
            child: Text(
              aboutController.hitachiCompanyAbout,
              style: GoogleFonts.openSans(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: CustomColor.whitePrimary,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Bit Beast Pvt Ltd",
                    style: GoogleFonts.openSans(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: CustomColor.experienceBackground, // 👈 Company name ka color
                    ),
                  ),
                  TextSpan(
                    text: " — Flutter Developer Intern",
                    style: GoogleFonts.openSans(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: CustomColor.whitePrimary, // 👈 Normal color
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft, // or centerRight, center
            child: Text(
              aboutController.beastCompanyAbout,
              style: GoogleFonts.openSans(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: CustomColor.whitePrimary,
              ),
            ),
          ),


          Align(
            alignment: Alignment.centerLeft, // or centerRight, center
            child: Text(
              'Contact',
              style: GoogleFonts.openSans(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: CustomColor.hintDark,
              ),
            ),
          ),

          Align(
            alignment: Alignment.centerLeft,
            child: RichText(
              text: TextSpan(
                style: GoogleFonts.openSans(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: CustomColor.whitePrimary,
                ),
                children: [
                  TextSpan(
                    text: "Although I may not have a huge online presence, you can reach me via Gmail at ",
                  ),
                  TextSpan(
                    text: "connect.kaushikrathaur@gmail.com",
                    style: GoogleFonts.openSans(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      color: CustomColor.whitePrimary,
                    ),
                  ),
                  TextSpan(
                    text: " or find me on LinkedIn as ",
                  ),
                  TextSpan(
                    text: "kaushik-rathaur",
                    style: GoogleFonts.openSans(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      color: CustomColor.whitePrimary,
                    ),
                  ),
                  TextSpan(
                    text: " and Instagram as ",
                  ),
                  TextSpan(
                    text: "Kaushik_🕊️",
                    style: GoogleFonts.openSans(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      color: CustomColor.whitePrimary,
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// Thanks & Visit
          SizedBox(height: screenHeight * 0.05),

          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "✨  ",
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  "thanks for visiting",
                  style: GoogleFonts.patrickHand(  // 👈 Handwritten style font
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    height: 5
                  ),
                ),
                const Text(
                  "  ✨",
                  style: TextStyle(fontSize: 22),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
