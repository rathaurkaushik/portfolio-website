import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/constant/app_image.dart';
import 'package:portfolio_website/constant/colors.dart';
import 'package:portfolio_website/widgets/aimated_image.dart';
import 'package:portfolio_website/widgets/button_widget.dart';
import 'package:portfolio_website/widgets/down_arrow_animated.dart';
import 'package:portfolio_website/widgets/direction_divider.dart';
import 'package:portfolio_website/widgets/experience_section.dart';
import 'package:portfolio_website/widgets/waving_hand.dart';

class MainDesktop extends StatefulWidget {
  const MainDesktop({super.key});

  @override
  State<MainDesktop> createState() => _MainDesktopState();
}

class _MainDesktopState extends State<MainDesktop>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    // Animation controller to move gradient center up and down every second
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1), // Speed control
    )..repeat(reverse: true); // Move back and forth
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 200, vertical: 100),
      constraints: const BoxConstraints(minHeight: 350.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// Top Section: Intro & Image
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left Side Text
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                      child: const Text(
                        "Kaushik_  ",
                        style: TextStyle(
                          fontSize: 50,
                          height: 1.5,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.only(right: 150.0),
                      child: SelectableText(
                        "App developer, Bit Beast Pvt. Ltd, UI/UX designer, and a lifelong learner based in India 🇮🇳, with a love for all things colorful and creative. Debugging life 🛠️ with a cup of stories ☕📘 and a cat on my lap 🐱.",
                        style: GoogleFonts.openSans(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                          color: CustomColor.whitePrimary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Right Side Image with Moving Gradient Background
              AnimatedWaveAvatar(
                size: 300,
                image: AppImages.my_image,
                amplitude: 5, // zyada wobble chahiye to 12–14
                secondaryAmp: 6, // subtle shimmer
                lobes: 1, // 4 corners feel
                duration: const Duration(
                  seconds: 15,
                ), // speed control (lower = faster)
                strokeWidth: 3,
              ),

              // Expanded(
              //   flex: 1,
              //   child: Center(
              //     // AnimatedBuilder to update gradient center position
              //     child: AnimatedBuilder(
              //       animation: _controller,
              //       builder: (context, _) {
              //         final t = _controller.value; // 0 → 1
              //         // Gradient center Y shift (-0.3 to 0.3)
              //         final dy = lerpDouble(-0.3, 0.3, t)!;
              //
              //         return Container(
              //           width: 300,
              //           height: 300,
              //           decoration: BoxDecoration(
              //             shape: BoxShape.circle,
              //             // Moving Radial Gradient background
              //             gradient: RadialGradient(
              //               colors: const [
              //                 Color(0xFF3b3b3b),
              //                 Colors.black12,
              //               ],
              //               center: Alignment(0, dy),
              //               radius: 0.5,
              //             ),
              //             boxShadow: [
              //               BoxShadow(
              //                 color: Colors.blueAccent.withOpacity(0.2),
              //                 blurRadius: 30,
              //                 spreadRadius: 10,
              //                 offset: const Offset(-10, 0),
              //               ),
              //             ],
              //           ),
              //           child: ClipOval(
              //             child: Image.asset(
              //               "assets/myImage.png",
              //               width: 300,
              //               height: 300,
              //               fit: BoxFit.cover,
              //             ),
              //           ),
              //         );
              //       },
              //     ),
              //   ),
              // ),
            ],
          ),

          const SizedBox(height: 50),
          const Center(child: DrawArrowAnimated()),
          const SizedBox(height: 300),

          /// Experience Badge
          Center(
            child: Stack(
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: CustomColor.experienceBackground,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: 115,
                    width: 118,
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
                            fontSize: 50,
                            color: CustomColor.whitePrimary,
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

          /// Summary Paragraph
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
            child: SelectableText(
              textAlign: TextAlign.center,
              'Over the past three years, I’ve cultivated strong problem-solving and critical thinking abilities, enabling me to quickly adapt to new technologies and evolving workflows. Below is a snapshot of the skill set I’ve acquired—and continue to expand—as I grow both personally and professionally.',
              style: GoogleFonts.openSans(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline,
                color: CustomColor.whitePrimary,
              ),
            ),
          ),

          const SizedBox(height: 30),

          /// Experience Heading
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
          SizedBox(height: 100),

          /// Experience Rows
          Column(
            children: [
              /// First Row (App Dev & Backend)
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ExperienceSection(
                        title: 'Data Engineer',
                        titleColor: CustomColor.data_title,
                        description:
                            'Learning Data Science with Python and libraries like Pandas, NumPy, and Scikit-learn. Exploring data analysis, visualization, and machine learning techniques.',
                        skills: [
                          {
                            'label': 'Azure',
                            'color': CustomColor.data_skill,
                          },
                          {'label': 'Python', 'color': CustomColor.data_skill},
                          {'label': 'spark', 'color': CustomColor.data_skill},
                          {'label': 'databricks', 'color': CustomColor.data_skill},
                        ],
                        imagePath: AppImages.data_engineer,
                        textColor: CustomColor.whitePrimary,
                        imageHeight: screenHeight * 0.3,
                        imageWidth: screenWidth * 0.3,
                      ),
                    ),
                    Container(
                      width: 2.0,
                      height: screenHeight * 1.15,
                      color: CustomColor.yellowPrimary,
                      margin: const EdgeInsets.symmetric(horizontal: 90.0),
                    ),
                    Expanded(
                      child: ExperienceSection(
                        title: 'Blockchain',
                        titleColor: CustomColor.experienceBackground,
                        topPadding: 500,
                        description:
                            'Exploring the evolving Web3 ecosystem focused on decentralized security layers...',
                        skills: [
                          {
                            'label': 'Solidity',
                            'color': CustomColor.experience,
                          },
                          {'label': 'Hardhat', 'color': CustomColor.experience},
                          {
                            'label': 'OpenZeppelin',
                            'color': CustomColor.experience,
                          },
                        ],
                        imagePath: AppImages.block_chain,
                        textColor: CustomColor.whitePrimary,
                        imageHeight: screenHeight * 0.3,
                        imageWidth: screenWidth * 0.3,
                      ),
                    ),
                  ],
                ),
              ),

              /// Second Row (Data Science & Blockchain)
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ExperienceSection(
                        title: 'App Dev',
                        titleColor: Colors.blueAccent.shade100,
                        description:
                            'Specialized in creating beautiful and user-friendly web and mobile applications using Flutter and frontend technologies. I bring creativity and attention to detail to every project I craft.',
                        skills: [
                          {
                            'label': 'Flutter',
                            'color': Colors.blueAccent.shade100,
                          },
                          {
                            'label': 'Dart',
                            'color': Colors.blueAccent.shade100,
                          },
                          {
                            'label': 'Kotlin',
                            'color': Colors.blueAccent.shade100,
                          },
                        ],
                        imagePath: AppImages.app,
                        textColor: CustomColor.whitePrimary,
                        imageHeight: screenHeight * 0.3,
                        imageWidth: screenWidth * 0.3,
                      ),
                    ),
                    Container(
                      width: 2.0,
                      height: screenHeight * 1.45,
                      color: CustomColor.yellowPrimary,
                      margin: const EdgeInsets.symmetric(horizontal: 90.0),
                    ),
                    Expanded(
                      child: ExperienceSection(
                        title: 'Backend',
                        titleColor: CustomColor.webDev1,
                        topPadding: 540,
                        description:
                            "Working on creating robust backend solutions that prioritize security, scalability, and decentralization in modern applications.",
                        skills: [
                          {'label': 'Node Js', 'color': CustomColor.webDev1},
                          {'label': 'No Sql', 'color': CustomColor.webDev1},
                          {'label': 'Sql', 'color': CustomColor.webDev1},
                        ],
                        imagePath: AppImages.backend,
                        textColor: CustomColor.whitePrimary,
                        imageHeight: screenHeight * 0.3,
                        imageWidth: screenWidth * 0.3,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30),
              SelectableText(
                "that was a short information about the domain that I have previously worked on.\nwhile you're at it, have a look at few chosen works that i have created using above domain.\nAnd if you want to know more, you can download my resume",
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                  fontSize: screenWidth * 0.013,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                  color: CustomColor.whitePrimary,
                ),
              ),
            ],
          ),

          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWidget(
                title: "resume",
                color: CustomColor.experience,
                iconAssetPath: "assets/page.png",
                route: "/resume", // route सिर्फ compare करने के लिए
              ),
              SizedBox(width: 50),
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
    );
  }
}
