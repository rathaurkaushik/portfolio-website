import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/constant/colors.dart';
import 'package:portfolio_website/widgets/down_arrow_animated.dart';
import 'package:portfolio_website/widgets/direction_divider.dart';
import 'package:portfolio_website/widgets/experience_section.dart';
import 'package:portfolio_website/widgets/tablet/experience_tablet_section.dart';
import 'package:portfolio_website/widgets/waving_hand.dart';

class MainTablet extends StatelessWidget {
  const MainTablet({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 100, vertical: 100),
        constraints: const BoxConstraints(minHeight: 350.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Top Section: Intro & Image
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
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
                    ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height));
                  },
                  blendMode: BlendMode.srcIn, // Required to apply gradient to text
                  child: const Text(
                    "Kaushik_  ",
                    style: TextStyle(
                      fontSize: 30,
                      height: 1.5,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Important!
                    ),
                  ),
                ),
                const WavingHandIcon(handSize: 35),
              ],
            ),



            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100.0),
              child: Text(
                "App developer, Bit Beast Pvt. Ltd, UI/UX designer, and a lifelong learner based in India 🇮🇳, with a love for all things colorful and creative. Debugging life 🛠️ with a cup of stories ☕📘 and a cat on my lap 🐱.",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Aptos',
                  color: CustomColor.whitePrimary,
                ),
              ),
            ),
            const SizedBox(height: 60),

            /// Image Section
            SizedBox(
              height: 300,
              width: 300,
              child: Center(
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const RadialGradient(
                      colors: [Color(0xFF3b3b3b), Colors.black12],
                      center: Alignment.center,
                      radius: 0.5,
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
                  child: ClipOval(
                    child: Image.asset(
                      "assets/myImage.png",
                      width: 300,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 50),
            const Center(child: DrawArrowAnimated()),
            const SizedBox(height: 200),

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
                          Text(
                            "02",
                            style: TextStyle(
                              fontFamily: 'Aptos',
                              fontSize: 50,
                              color: CustomColor.whitePrimary,
                            ),
                          ),
                          Text(
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
              padding: const EdgeInsets.symmetric(
                horizontal: 100,
                vertical: 15,
              ),
              child: Text(
                textAlign: TextAlign.center,
                'Over the past three years, I’ve cultivated strong problem-solving and critical thinking abilities, enabling me to quickly adapt to new technologies and evolving workflows. Below is a snapshot of the skill set I’ve acquired—and continue to expand—as I grow both personally and professionally.',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: CustomColor.whitePrimary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            const SizedBox(height: 30),

            /// Experience Heading
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const DirectionalDivider(direction: 'left'),
                Text(
                  "Experience",
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
                ),
                const DirectionalDivider(direction: 'right'),
              ],
            ),
            const SizedBox(height: 100),

            /// Experience Rows
            Padding(
              padding: const EdgeInsets.only(left: 90.0),
              child: Column(
                children: [
                  /// First Row (App Dev & Backend)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 2.0,
                        height: screenHeight * 0.67,
                        color: Colors.purple.shade200,
                        margin: const EdgeInsets.symmetric(horizontal: 20.0),
                      ),
                      Expanded(
                        child: ExperienceTabletSection(
                          title: 'App Dev',
                          titleColor: Colors.purple.shade100,
                          description:
                              'Specialized in creating beautiful and user-friendly web and mobile applications using Flutter and frontend technologies. I bring creativity and attention to detail to every project I craft.',
                          skills: [
                            {
                              'label': 'Flutter',
                              'color': Colors.purple.shade200,
                            },
                            {'label': 'Dart', 'color': Colors.purple.shade200},
                            {
                              'label': 'Kotlin',
                              'color': Colors.purple.shade200,
                            },
                          ],
                          imagePath: 'assets/experience/app.png',
                          textColor: CustomColor.whitePrimary,
                          imageHeight: screenHeight * 0.3,
                          imageWidth: screenWidth * 0.3,
                        ),
                      ),
                      // const SizedBox(width: 30),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 2.0,
                        height: screenHeight * 0.6,
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
                            {'label': 'Mongo DB', 'color': CustomColor.webDev},
                            {'label': 'Sql', 'color': CustomColor.webDev},
                            {'label': 'Firebase', 'color': CustomColor.webDev},
                          ],
                          imagePath: 'assets/experience/backend.png',
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
                        height: screenHeight * 0.6,
                        color: CustomColor.data_skill,
                        margin: const EdgeInsets.symmetric(horizontal: 20.0),
                      ),
                      Expanded(
                        child: ExperienceTabletSection(
                          title: 'Data Science',
                          titleColor: CustomColor.data_title,
                          description:
                              'Learning Data Science with Python and libraries like Pandas, NumPy, and Scikit-learn. Exploring data analysis, visualization, and machine learning techniques.',
                          skills: [
                            {
                              'label': 'TensorFlow',
                              'color': CustomColor.data_skill,
                            },
                            {
                              'label': 'Python',
                              'color': CustomColor.data_skill,
                            },
                            {
                              'label': 'Pandas',
                              'color': CustomColor.data_skill,
                            },
                          ],
                          imagePath: 'assets/experience/data_science.png',
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
                        height: screenHeight * 0.6,
                        color: CustomColor.experience,
                        margin: const EdgeInsets.symmetric(horizontal: 20.0),
                      ),
                      Expanded(
                        child: ExperienceTabletSection(
                          title: 'Blockchain',
                          titleColor: CustomColor.experienceBackground,
                          // topPadding: 100,
                          description:
                              'Exploring the evolving Web3 ecosystem focused on decentralized security layers...',
                          skills: [
                            {
                              'label': 'Solidity',
                              'color': CustomColor.experience,
                            },
                            {
                              'label': 'Hardhat',
                              'color': CustomColor.experience,
                            },
                            {
                              'label': 'OpenZeppelin',
                              'color': CustomColor.experience,
                            },
                          ],
                          imagePath: 'assets/experience/blockchain.png',
                          textColor: CustomColor.whitePrimary,
                          imageHeight: screenHeight * 0.3,
                          imageWidth: screenWidth * 0.3,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30,),
                  Text("that was a short information about the domain that I have previously worked on. while you're at it, have a look at few chosen works that i have created using above domain. And if you want to know more, you can download my resume",

                    textAlign: TextAlign.center,
                    style: TextStyle(

                      color: CustomColor.whitePrimary,fontSize: 18, fontWeight: FontWeight.w500, fontFamily: 'Aptos'),)

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
