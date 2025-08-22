import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/constant/app_image.dart';
import 'package:portfolio_website/constant/colors.dart';
import 'package:portfolio_website/view/about/about controller.dart';
import 'package:portfolio_website/view/tech/tech_controller.dart';

class AboutSectionMobile extends StatelessWidget {
  final TechStackController controller = Get.put(TechStackController());
  final AboutController aboutController = Get.put(AboutController());

  AboutSectionMobile({super.key});

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
        horizontal: screenWidth * 0.10,
        vertical: screenHeight * 0.02,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// ==== Title ====
          Text(
            'About',
            style: TextStyle(
              fontSize: screenWidth * 0.09,
              fontWeight: FontWeight.bold,
              fontFamily: 'Aptos',
              foreground: Paint()..shader = linearGradient,
            ),
          ),
          SizedBox(height: screenHeight * 0.03),

          /// ==== Profile Image ====
          Container(
            height: screenHeight * 0.22,
            width: screenWidth * 0.3,
            decoration: BoxDecoration(
              border: Border.all(color: CustomColor.whitePrimary, width: 2),
              borderRadius: BorderRadius.circular(15),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(AppImages.about_image, fit: BoxFit.contain),
            ),
          ),

          SizedBox(height: screenHeight * 0.03),

          /// ==== Name & Work ====
          Text(
            'Kaushik Rathaur',
            style: TextStyle(
              fontSize: screenWidth * 0.055,
              fontWeight: FontWeight.bold,
              fontFamily: 'Aptos-bold',
              color: CustomColor.whitePrimary,
            ),
          ),
          SizedBox(height: 6),
          Text(
            'NOOB Data Engineer, PRO at breaking pipelines',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: screenWidth * 0.04,
              fontWeight: FontWeight.w500,
              fontFamily: 'Aptos',
              color: CustomColor.hintDark,
            ),
          ),

          SizedBox(height: screenHeight * 0.04),

          /// ==== Skills (Horizontal Scrollable) ====
          SizedBox(
            height: screenHeight * 0.04,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildSkillChip("Big Data", CustomColor.data_skill,
                      CustomColor.data_title, screenWidth),
                  _buildSkillChip("App", CustomColor.webBack,
                      CustomColor.webDev, screenWidth),
                  _buildSkillChip("AI - ML", CustomColor.experienceBackground,
                      Colors.deepPurpleAccent, screenWidth),
                  _buildSkillChip("Data Eng", CustomColor.data_eng,
                      CustomColor.data_eng_title, screenWidth),
                ],
              ),
            ),
          ),

          SizedBox(height: screenHeight * 0.05),

          /// ==== About Description ====
          Text(
            aboutController.about,
            textAlign: TextAlign.center,
            style: GoogleFonts.openSans(
              fontSize: screenWidth * 0.04,
              fontWeight: FontWeight.w500,
              color: CustomColor.whitePrimary,
              height: 1.4,
            ),
          ),

          SizedBox(height: screenHeight * 0.05),

          /// ==== Current Experience ====
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Current',
              style: GoogleFonts.openSans(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.bold,
                color: CustomColor.hintDark,
              ),
            ),
          ),
          SizedBox(height: 8),
          _buildCompany(
            "Hitachi Systems India",
            "IT Specialist",
            Colors.redAccent,
            aboutController.hitachiCompanyAbout,
            screenWidth,
          ),
          SizedBox(height: 16),
          _buildCompany(
            "Bit Beast Pvt Ltd",
            "Flutter Developer Intern",
            CustomColor.experienceBackground,
            aboutController.beastCompanyAbout,
            screenWidth,
          ),

          SizedBox(height: screenHeight * 0.05),

          /// ==== Contact Section ====
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Contact',
              style: GoogleFonts.openSans(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.bold,
                color: CustomColor.hintDark,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text.rich(
            TextSpan(
              style: GoogleFonts.openSans(
                fontSize: screenWidth * 0.04,
                fontWeight: FontWeight.w500,
                color: CustomColor.whitePrimary,
              ),
              children: [
                const TextSpan(
                  text:
                  "Although I may not have a huge online presence, you can reach me via Gmail at ",
                ),
                TextSpan(
                  text: "connect.kaushikrathaur@gmail.com",
                  style: GoogleFonts.openSans(
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    color: CustomColor.whitePrimary,
                  ),
                ),
                const TextSpan(text: " or find me on LinkedIn as "),
                TextSpan(
                  text: "kaushik-rathaur",
                  style: GoogleFonts.openSans(
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    color: CustomColor.whitePrimary,
                  ),
                ),
                const TextSpan(text: " and Instagram as "),
                TextSpan(
                  text: "Kaushik_🕊️",
                  style: GoogleFonts.openSans(
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    color: CustomColor.whitePrimary,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: screenHeight * 0.06),

          /// ==== Thanks ====
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("✨  ", style: TextStyle(fontSize: 22)),
              Text(
                "thanks for visiting",
                style: GoogleFonts.patrickHand(
                  fontSize: screenWidth * 0.06,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const Text("  ✨", style: TextStyle(fontSize: 22)),
            ],
          ),
        ],
      ),
    );
  }

  /// ==== Skill Chip Builder ====
  Widget _buildSkillChip(
      String title, Color bgColor, Color textColor, double screenWidth) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.010),
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.02,
        vertical: screenWidth * 0.002,
      ),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: textColor,
            fontFamily: 'Aptos',
            fontWeight: FontWeight.bold,
            fontSize: screenWidth * 0.04,
          ),
        ),
      ),
    );
  }

  /// ==== Company Builder ====
  Widget _buildCompany(String company, String role, Color companyColor,
      String description, double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: company,
                style: GoogleFonts.openSans(
                  fontSize: screenWidth * 0.045,
                  fontWeight: FontWeight.bold,
                  color: companyColor,
                ),
              ),
              TextSpan(
                text: " — $role",
                style: GoogleFonts.openSans(
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.w500,
                  color: CustomColor.whitePrimary,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5),
        Text(
          description,
          style: GoogleFonts.openSans(
            fontSize: screenWidth * 0.038,
            fontWeight: FontWeight.w500,
            color: CustomColor.whitePrimary,
          ),
        ),
      ],
    );
  }
}
