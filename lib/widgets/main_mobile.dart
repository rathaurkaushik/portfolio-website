import 'package:flutter/material.dart';
import 'package:portfolio_website/constant/colors.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 40.0,
        vertical: 30.0,
      ),
      height: screenHeight,
      constraints: const BoxConstraints(
        minHeight: 560.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // avatar img
          Expanded(
            child: Center(
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const RadialGradient(
                    colors: [
                      Color(0xFF3b3b3b),
                      Colors.black12,
                    ],
                    center: Alignment.center,
                    radius: 0.4,
                  ),
                  boxShadow: [
                    // BoxShadow(
                    //   color: Colors.purpleAccent.withOpacity(0.5),
                    //   blurRadius: 12,
                    //   spreadRadius: 5,
                    //   offset: const Offset(0, 0),
                    // ),
                    BoxShadow(
                      color: Colors.blueAccent.withOpacity(0.2),
                      blurRadius: 30,
                      spreadRadius: 10,
                      offset: const Offset(-10, 0),
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Stack(
                    children: [
                      Positioned(
                        left: -110, // 👈 shift image to the left to center the face
                        top: 0,
                        child: Image.asset(
                          "assets/myImage.png",
                          width: 300,  // 👈 wider image so your face fits inside the visible circle
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // name
          Text(
            " Kaushik_  ",
            style: TextStyle(
              fontSize: 60,
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
                ).createShader(Rect.fromLTWH(100, 100, 200, 10)),
            ),
          ),
          const SizedBox(height: 15),
          // intro
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "App developer, Bit Beast Pvt. Ltd, UI/UX designer, and a lifelong learner based in India 🇮🇳, with a love for all things colorful and creative. Debugging life 🛠️ with a cup of stories ☕📘 and a cat on my lap 🐱.",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Aptos',
                color: CustomColor.whitePrimary,
              ),
            ),
          ),
          const SizedBox(height: 15),
          // contact btn
          SizedBox(
            width: 190.0,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Get in touch"),
            ),
          )
        ],
      ),
    );
  }
}
