import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 30),
        width: double.maxFinite,
        alignment: Alignment.center,
        child:
        ShaderMask(
          shaderCallback: (bounds) {
            return const LinearGradient(
              colors: [
                Color(0xFF12C2E9),
                Color(0xFFC471ED),
                Color(0xFFF64F59),
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.bottomRight,
            ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height));
          },
          blendMode: BlendMode.srcIn,
          child: TextButton(
            onPressed: () => Get.toNamed('/'),
            child: const Text(
              "Kaushik_",
              style: TextStyle(
                fontSize: 28,
                height: 1.5,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
