import 'package:flutter/material.dart';
import 'package:portfolio_website/constant/colors.dart';
import 'package:portfolio_website/widgets/waving_hand.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 30.0),
        constraints: const BoxConstraints(minHeight: 560.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Profile image
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
              child:
              CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage("assets/myImage.png"),
                radius: 50,

              )
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
                    foreground: Paint()
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
                Flexible(child: const WavingHandIcon(handSize: 40,)),

              ],
            ),
            const SizedBox(height: 20),

            // Intro Text
            Text(
              "App developer at Bit Beast Pvt. Ltd, UI/UX designer, and a lifelong learner from India 🇮🇳. Debugging life 🛠️ with stories ☕📘 and a cat 🐱 on my lap.",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: 'Aptos',
                color: CustomColor.whitePrimary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
