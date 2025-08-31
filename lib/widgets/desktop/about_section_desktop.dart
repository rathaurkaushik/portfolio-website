import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/constant/app_image.dart';
import 'package:portfolio_website/constant/colors.dart';
import 'package:portfolio_website/view/about/about controller.dart';
import 'package:portfolio_website/view/tech/tech_controller.dart';
import 'package:portfolio_website/widgets/desktop/footer_desktop.dart';

class AboutSectionDesktop extends StatelessWidget {
  final TechStackController controller = Get.put(TechStackController());
  final AboutController aboutController = Get.put(AboutController());

  AboutSectionDesktop({super.key});

  final Shader linearGradient = const LinearGradient(
    colors: <Color>[
      Colors.red,
      Color(0xFFFBB034),
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
        horizontal: screenWidth * 0.20,
        vertical: screenHeight * 0.05,
      ),
      child: Column(
        children: [
          // Title
          SelectableText(
            'About',
            style: TextStyle(
              fontSize: screenWidth * 0.04,
              fontWeight: FontWeight.bold,
              fontFamily: 'Aptos',
              foreground: Paint()..shader = linearGradient,
            ),
          ),

          // Profile image
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

          // Name & Tagline
          SelectableText(
            'Kaushik Rathaur',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Aptos-bold',
              color: CustomColor.whitePrimary,
            ),
          ),
          SelectableText(
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

          // Skills row
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _skillChip('Big Data', CustomColor.data_skill, CustomColor.data_title, screenWidth, screenHeight),
                _skillChip('App', CustomColor.webBack, CustomColor.webDev, screenWidth, screenHeight),
                _skillChip('AI - ML', CustomColor.experienceBackground, Colors.deepPurpleAccent, screenWidth, screenHeight),
                _skillChip('Data Eng', CustomColor.data_eng, CustomColor.data_eng_title, screenWidth, screenHeight),
              ],
            ),
          ),

          SizedBox(height: screenHeight * 0.05),

          // About
          SelectableText(
            aboutController.about,
            style: GoogleFonts.openSans(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: CustomColor.whitePrimary,
              height: 1,
            ),
          ),

          SizedBox(height: screenHeight * 0.05),

          // Current Title
          Align(
            alignment: Alignment.centerLeft,
            child: SelectableText(
              'Current',
              style: GoogleFonts.openSans(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: CustomColor.hintDark,
              ),
            ),
          ),

          // First Experience
          Align(
            alignment: Alignment.centerLeft,
            child: SelectableText.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Hitachi Systems India",
                    style: GoogleFonts.openSans(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                    ),
                  ),
                  TextSpan(
                    text: " — IT Specialist",
                    style: GoogleFonts.openSans(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: CustomColor.whitePrimary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: SelectableText(
              aboutController.hitachiCompanyAbout,
              style: GoogleFonts.openSans(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: CustomColor.whitePrimary,
              ),
            ),
          ),

          // Second Experience
          Align(
            alignment: Alignment.centerLeft,
            child: SelectableText.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Bit Beast Pvt Ltd",
                    style: GoogleFonts.openSans(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: CustomColor.experienceBackground,
                    ),
                  ),
                  TextSpan(
                    text: " — Flutter Developer Intern",
                    style: GoogleFonts.openSans(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: CustomColor.whitePrimary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: SelectableText(
              aboutController.beastCompanyAbout,
              style: GoogleFonts.openSans(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: CustomColor.whitePrimary,
              ),
            ),
          ),

          SizedBox(height: screenHeight * 0.05),

          // Contact
          Align(
            alignment: Alignment.centerLeft,
            child: SelectableText(
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
            child: SelectableText.rich(
              TextSpan(
                style: GoogleFonts.openSans(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: CustomColor.whitePrimary,
                ),
                children: [
                  const TextSpan(
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
                  const TextSpan(text: " or find me on LinkedIn as "),
                  TextSpan(
                    text: "kaushik-rathaur",
                    style: GoogleFonts.openSans(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      color: CustomColor.whitePrimary,
                    ),
                  ),
                  const TextSpan(text: " and Instagram as "),
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

          SizedBox(height: screenHeight * 0.05),

          // Thanks for visiting
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SelectableText(
                  "✨  ",
                  style: TextStyle(fontSize: 22),
                ),
                SelectableText(
                  "thanks for visiting",
                  style: GoogleFonts.patrickHand(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    height: 5,
                  ),
                ),
                const SelectableText(
                  "  ✨",
                  style: TextStyle(fontSize: 22),
                ),
              ],
            ),
          ),

          SizedBox(
            width: double.infinity,
            child: FooterDesktop(),
          ),
        ],
      ),
    );
  }

  Widget _skillChip(String text, Color bg, Color fg, double screenWidth, double screenHeight) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.01,
          vertical: screenHeight * 0.005,
        ),
        margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.005),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: SelectableText(
            text,
            style: TextStyle(
              color: fg,
              fontFamily: 'Aptos',
              fontWeight: FontWeight.bold,
              fontSize: screenWidth * 0.012,
            ),
          ),
        ),
      ),
    );
  }
}
