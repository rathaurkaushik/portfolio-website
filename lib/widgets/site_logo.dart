import 'package:flutter/material.dart';
import 'package:portfolio_website/constant/colors.dart';

class SiteLogo extends StatelessWidget {
  const SiteLogo({super.key, this.onTap});
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 15, // adjust as needed
        backgroundColor: Colors.transparent,
        backgroundImage: AssetImage("assets/icon.png"),
      ),

      // Text(
      //   " Kaushik_  ",
      //   style: TextStyle(
      //     fontFamily: 'Aptos',
      //     fontSize: 20,
      //     height: 1.5,
      //     fontWeight: FontWeight.bold,
      //     foreground: Paint()
      //       ..shader = const LinearGradient(
      //         colors: [
      //           Color(0xFFC471ED),
      //           Color(0xFF12C2E9),
      //           Color(0xFFF64F59),
      //         ],
      //         begin: Alignment.topLeft,
      //         end: Alignment.bottomRight,
      //       ).createShader(Rect.fromLTWH(40, 20, 60, 50)),
      //   ),
      // ),
    );
  }
}
