import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/constant/app_image.dart';
import 'package:portfolio_website/constant/colors.dart';
import 'package:portfolio_website/view/about/about%20controller.dart';
import 'package:portfolio_website/view/tech/tech_controller.dart';

class AboutSectionTablet extends StatelessWidget {
  final TechStackController controller = Get.put(TechStackController());
  final AboutController aboutController = Get.put(AboutController());

  AboutSectionTablet({super.key});

  final Shader linearGradient = const LinearGradient(
    colors: <Color>[
      Colors.red,
      Color(0xFFFBB034),
      Colors.blue,
      Colors.red,
    ],
  ).createShader(const Rect.fromLTWH(0, 200, 600.0, 400.0));

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.08, // smaller than desktop
        vertical: screenHeight * 0.04,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Title
          Text(
            'About',
            style: TextStyle(
              fontSize: screenWidth * 0.06, // bigger on tablet for readability
              fontWeight: FontWeight.bold,
              fontFamily: 'Aptos',
              foreground: Paint()..shader = linearGradient,
            ),
          ),
          SizedBox(height: screenHeight * 0.03),

          // Profile Image
          Container(
            height: screenHeight * 0.25,
            decoration: BoxDecoration(
              border: Border.all(color: CustomColor.whitePrimary, width: 2.5),
              borderRadius: BorderRadius.circular(18),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(AppImages.about_image),
            ),
          ),

          SizedBox(height: screenHeight * 0.04),

          // Name
          Text(
            'Kaushik Rathaur',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Aptos-bold',
              color: CustomColor.whitePrimary,
            ),
          ),
          Text(
            'NOOB Data Engineer, PRO at breaking pipelines',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontFamily: 'Aptos-bold',
              color: CustomColor.hintDark,
              height: 1.2,
            ),
          ),

          SizedBox(height: screenHeight * 0.04),

          // Skills row (wrapped for tablet)
          Wrap(
            spacing: 25,
            runSpacing: 15,
            alignment: WrapAlignment.center,
            children: [
              _skillChip("Big Data", CustomColor.data_skill, CustomColor.data_title),
              _skillChip("App", CustomColor.webBack, CustomColor.webDev),
              _skillChip("AI - ML", CustomColor.experienceBackground, Colors.deepPurpleAccent),
              _skillChip("Data Eng", CustomColor.data_eng, CustomColor.data_eng_title),
            ],
          ),

          SizedBox(height: screenHeight * 0.04),

          // About text
          Text(
            aboutController.about,
            textAlign: TextAlign.center,
            style: GoogleFonts.openSans(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: CustomColor.whitePrimary,
              height: 1.3,
            ),
          ),

          SizedBox(height: screenHeight * 0.05),

          // Experience title
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Current',
              style: GoogleFonts.openSans(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: CustomColor.hintDark,
              ),
            ),
          ),

          SizedBox(height: 10),

          // First Job
          Align(
            alignment: Alignment.centerLeft,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Hitachi Systems India",
                    style: GoogleFonts.openSans(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                    ),
                  ),
                  TextSpan(
                    text: " — IT Specialist",
                    style: GoogleFonts.openSans(
                      fontSize: 18,
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
            child: Text(
              aboutController.hitachiCompanyAbout,
              style: GoogleFonts.openSans(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: CustomColor.whitePrimary,
              ),
            ),
          ),

          SizedBox(height: 10),

          // Second Job
          Align(
            alignment: Alignment.centerLeft,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Bit Beast Pvt Ltd",
                    style: GoogleFonts.openSans(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: CustomColor.experienceBackground,
                    ),
                  ),
                  TextSpan(
                    text: " — Flutter Developer Intern",
                    style: GoogleFonts.openSans(
                      fontSize: 18,
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
            child: Text(
              aboutController.beastCompanyAbout,
              style: GoogleFonts.openSans(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: CustomColor.whitePrimary,
              ),
            ),
          ),

          SizedBox(height: screenHeight * 0.04),

          // Contact
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Contact',
              style: GoogleFonts.openSans(
                fontSize: 20,
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
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: CustomColor.whitePrimary,
                ),
                children: [
                  const TextSpan(
                      text: "Although I may not have a huge online presence, you can reach me via Gmail at "),
                  TextSpan(
                    text: "connect.kaushikrathaur@gmail.com",
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      color: CustomColor.whitePrimary,
                    ),
                  ),
                  const TextSpan(text: " or find me on LinkedIn as "),
                  TextSpan(
                    text: "kaushik-rathaur",
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      color: CustomColor.whitePrimary,
                    ),
                  ),
                  const TextSpan(text: " and Instagram as "),
                  TextSpan(
                    text: "Kaushik_🕊️",
                    style: GoogleFonts.openSans(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("✨  ", style: TextStyle(fontSize: 20)),
              Text(
                "thanks for visiting",
                style: GoogleFonts.patrickHand(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const Text("  ✨", style: TextStyle(fontSize: 20)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _skillChip(String text, Color bg, Color fg) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: fg,
          fontFamily: 'Aptos',
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }
}
