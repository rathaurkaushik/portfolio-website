import 'package:flutter/material.dart';
import 'package:portfolio_website/constant/colors.dart';


class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30),
      width: double.maxFinite,
      alignment: Alignment.center,
      child:
      Text(
        " Kaushik_  ",
        style: TextStyle(
          fontSize: 20,
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
    );
  }
}
