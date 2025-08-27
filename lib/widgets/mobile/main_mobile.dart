import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
            // Profile image
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  " Kaushik_  ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 42,
                    fontFamily: 'Aptos',
                    height: 1.5,
                    fontWeight: FontWeight.bold,
                    foreground:
                        Paint()
                          ..shader = const LinearGradient(
                            colors: [
                              Color(0xFFC471ED),
                              Color(0xFF12C2E9),
                              Color(0xFFF64F59),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ).createShader(Rect.fromLTWH(200, 50, 200, 70)),
                  ),
                ),
                Flexible(child: const WavingHandIcon(handSize: 40)),
              ],
            ),
            SizedBox(height: 40),
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
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage("assets/myImage.png"),
                radius: 50,
              ),
              // ClipOval(
              //   child: Stack(
              //     children: [
              //       Positioned(
              //         left: -110,
              //         top: 0,
              //         child: Image.asset(
              //           "assets/myImage.png",
              //           color: Colors.transparent,
              //           width: 300,
              //           height: 200,
              //           fit: BoxFit.cover,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ),

            const SizedBox(height: 30),

            // Name
            const SizedBox(height: 20),

            // Intro Text
            Text(
              "App developer at Bit Beast Pvt. Ltd, UI/UX designer, and a lifelong learner from India 🇮🇳. Debugging life 🛠️ with stories ☕📘 and a cat 🐱 on my lap.",
              style: GoogleFonts.openSans(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline,
                color: CustomColor.whitePrimary,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
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
                          Text(
                            "02",
                            style: TextStyle(
                              fontSize: 30,
                              color: CustomColor.whitePrimary,
                              fontWeight: FontWeight.bold
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
            const SizedBox(height: 50),

            /// Experience Rows
           Column(
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
                          titleColor: Colors.blueAccent.shade100,
                          description:
                              'Specialized in creating beautiful and user-friendly web and mobile applications using Flutter and frontend technologies. I bring creativity and attention to detail to every project I craft.',
                          skills: [
                            {
                              'label': 'Flutter',
                              'color': Colors.blueAccent.shade200,
                            },
                            {
                              'label': 'Dart',
                              'color': Colors.blueAccent.shade200,
                            },
                            {
                              'label': 'Kotlin',
                              'color': Colors.blueAccent.shade200,
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
                        height: screenHeight * 0.63,
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
                        height: screenHeight * 0.62,
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
                  SizedBox(height: 30),
                  Text(
                    "that was a short information about the domain that I have previously worked on. while you're at it, have a look at few chosen works that i have created using above domain. And if you want to know more, you can download my resume",

                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: CustomColor.whitePrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Aptos',
                    ),
                  ),
                  SizedBox(height: 40,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonWidget(title: 'Resume', color: CustomColor.experience, iconAssetPath: 'assets/page.png',onTap: () => Navigator.pushNamed(context, '/work'),),
                      SizedBox(width: 50,),
                      ButtonWidget(title: 'Project', color: Colors.blueAccent, iconAssetPath: 'assets/work_arrow.png',onTap: ()=> Navigator.pushNamed(context, '/work'),),

                    ],
                  )
                ],
              ),

          ],
        ),
      ),
    );
  }
}
