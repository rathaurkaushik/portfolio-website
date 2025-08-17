import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:portfolio_website/constant/colors.dart';
import '../../constant/nav_items.dart';
import '../site_logo.dart';

class HeaderMobile extends StatelessWidget {
  const HeaderMobile({
    super.key,
    this.onLogoTap,
    this.onMenuTap,
  });

  final VoidCallback? onLogoTap;
  final VoidCallback? onMenuTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: MediaQuery.of(context).size.width * 0.9,
      height: 50,
      child: Stack(
        children: [
          // Background gradient
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50.0,
            margin: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  // Color(0xFF2E2F33),
                  CustomColor.yellowPrimary,
                  Colors.blue,
                  Colors.pink,
                  Color(0xFF7E6B5A),
                  Colors.red,
                  CustomColor.yellowSecondary,
                  CustomColor.experience,
                ],
              ),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 70, sigmaY:   70),
              child: Container(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
          ),

          // Blur overlay
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
              child: Container(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
          ),

          // Foreground navigation row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Logo
                SiteLogo(onTap: onLogoTap),

                // Center Title with gradient text
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
                  child: Text(
                    (navTitles.isNotEmpty && navTitles[0].isNotEmpty)
                        ? navTitles[0]
                        : "Kaushik_",
                    style: const TextStyle(
                      fontSize: 18,
                      height: 1.3,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // Menu button
                IconButton(
                  onPressed: onMenuTap,
                  icon: const Icon(Icons.menu),
                  color: CustomColor.whitePrimary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
