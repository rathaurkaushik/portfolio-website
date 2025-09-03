import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/constant/app_image.dart';
import 'package:portfolio_website/constant/colors.dart';
import 'package:portfolio_website/widgets/button_widget.dart';
import 'package:portfolio_website/widgets/direction_divider.dart';
import 'package:portfolio_website/widgets/tablet/experience_tablet_section.dart';
import 'package:portfolio_website/widgets/waving_hand.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 30.0),
        constraints: const BoxConstraints(minHeight: 560.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Name with gradient + waving hand
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ShaderMask(
                  shaderCallback: (bounds) {
                    return const LinearGradient(
                      colors: [
                        Color(0xFFC471ED),
                        Color(0xFF12C2E9),
                        Color(0xFFF64F59),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(
                      Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                    );
                  },
                  blendMode: BlendMode.srcIn,
                  child: const SelectableText(
                    "Kaushik_  ",
                    style: TextStyle(
                      fontSize: 42,
                      height: 1.5,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const WavingHandIcon(handSize: 40),
              ],
            ),

            const SizedBox(height: 40),

            // Profile image with gradient glow
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const RadialGradient(
                  colors: [Color(0xFF3b3b3b), Colors.black12],
                  center: Alignment.center,
                  radius: 0.4,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueAccent.withOpacity(0.2),
                    blurRadius: 30,
                    spreadRadius: 10,
                    offset: const Offset(-10, 0),
                  ),
                ],
              ),
              child: const CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage("assets/myImage.png"),
                radius: 50,
              ),
            ),

            const SizedBox(height: 30),

            // Intro Text
            SelectableText(
              "App developer, Bit Beast Pvt. Ltd, UI/UX designer, and a lifelong learner based in India 🇮🇳, with a love for all things colorful and creative. Debugging life 🛠️ with a cup of stories ☕📘 and a cat on my lap 🐱.",
              style: GoogleFonts.openSans(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline,
                color: CustomColor.whitePrimary,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),

            /// Experience Badge
            Center(
              child: Stack(
                children: [
                  Container(
                    height: 130,
                    width: 135,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: CustomColor.experienceBackground,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      height: 100,
                      width: 103,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: CustomColor.experience,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SelectableText(
                            "02",
                            style: TextStyle(
                              fontSize: 30,
                              color: CustomColor.whitePrimary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SelectableText(
                            "Years of Experience",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              color: CustomColor.whitePrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Experience Heading
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const DirectionalDivider(direction: 'left'),
                SelectableText(
                  "Experience",
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
                ),
                const DirectionalDivider(direction: 'right'),
              ],
            ),

            const SizedBox(height: 50),

            /// Experience Rows
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 2.0,
                      height: screenHeight * 0.63,
                      color: CustomColor.data_skill,
                      margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    ),
                    Expanded(
                      child: ExperienceTabletSection(
                        title: 'Data Engineer',
                        titleColor: CustomColor.data_title,
                        description:
                        'Learning Data Science with Python and libraries like Pandas, NumPy, and Scikit-learn. Exploring data analysis, visualization, and machine learning techniques.',
                        skills: [
                          {'label': 'Azure', 'color': CustomColor.data_skill},
                          {'label': 'Python', 'color': CustomColor.data_skill},
                          {'label': 'Spark', 'color': CustomColor.data_skill},
                          {'label': 'Databricks', 'color': CustomColor.data_skill},
                        ],
                        imagePath: AppImages.data_engineer,
                        textColor: CustomColor.whitePrimary,
                        imageHeight: screenHeight * 0.3,
                        imageWidth: screenWidth * 0.3,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 2.0,
                      height: screenHeight * 0.62,
                      color: CustomColor.experience,
                      margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    ),
                    Expanded(
                      child: ExperienceTabletSection(
                        title: 'Blockchain',
                        titleColor: CustomColor.experienceBackground,
                        description:
                        'Exploring the evolving Web3 ecosystem focused on decentralized security layers...',
                        skills: [
                          {'label': 'Solidity', 'color': CustomColor.experience},
                          {'label': 'Hardhat', 'color': CustomColor.experience},
                          {'label': 'OpenZeppelin', 'color': CustomColor.experience},
                        ],
                        imagePath: AppImages.block_chain,
                        textColor: CustomColor.whitePrimary,
                        imageHeight: screenHeight * 0.3,
                        imageWidth: screenWidth * 0.3,
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 2.0,
                      height: screenHeight * 0.67,
                      color: Colors.blueAccent.shade200,
                      margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    ),
                    Expanded(
                      child: ExperienceTabletSection(
                        title: 'App Dev',
                        titleColor: Colors.blueAccent.shade100,
                        description:
                        'Specialized in creating beautiful and user-friendly web and mobile applications using Flutter and frontend technologies. I bring creativity and attention to detail to every project I craft.',
                        skills: [
                          {'label': 'Flutter', 'color': Colors.blueAccent.shade200},
                          {'label': 'Dart', 'color': Colors.blueAccent.shade200},
                          {'label': 'Kotlin', 'color': Colors.blueAccent.shade200},
                        ],
                        imagePath: AppImages.app,
                        textColor: CustomColor.whitePrimary,
                        imageHeight: screenHeight * 0.3,
                        imageWidth: screenWidth * 0.3,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 2.0,
                      height: screenHeight * 0.65,
                      color: CustomColor.webDev,
                      margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    ),
                    Expanded(
                      child: ExperienceTabletSection(
                        title: 'Backend',
                        titleColor: CustomColor.webDev,
                        description:
                        "Working on creating robust backend solutions that prioritize security, scalability, and decentralization in modern applications.",
                        skills: [
                          {'label': 'Node Js', 'color': CustomColor.webDev},
                          {'label': 'No Sql', 'color': CustomColor.webDev},
                          {'label': 'Sql', 'color': CustomColor.webDev},
                        ],
                        imagePath: AppImages.backend,
                        textColor: CustomColor.whitePrimary,
                        imageHeight: screenHeight * 0.3,
                        imageWidth: screenWidth * 0.3,
                      ),
                    ),
                  ],
                ),


                const SizedBox(height: 30),

                // Summary paragraph
                SelectableText(
                  "that was a short information about the domain that I have previously worked on. while you're at it, have a look at few chosen works that i have created using above domain. And if you want to know more, you can download my resume",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.openSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                    color: CustomColor.whitePrimary,
                  ),
                ),

                const SizedBox(height: 40),

                // Resume & Project Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonWidget(
                      title: "resume",
                      color: CustomColor.experience,
                      iconAssetPath: "assets/page.png",
                      route: "/resume",
                    ),
                    const SizedBox(width: 50),
                    ButtonWidget(
                      title: 'Project',
                      color: Colors.blueAccent,
                      iconAssetPath: 'assets/work_arrow.png',
                      route: '/work',
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
