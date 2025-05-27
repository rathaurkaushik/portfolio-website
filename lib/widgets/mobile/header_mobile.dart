import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:portfolio_website/constant/colors.dart';
import '../../styles/style.dart'; // Assuming this is used elsewhere
import '../site_logo.dart';

class HeaderMobile extends StatelessWidget {
  const HeaderMobile({super.key, this.onLogoTap, this.onMenuTap});
  final VoidCallback? onLogoTap;
  final VoidCallback? onMenuTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 🎨 Gradient Background with Blur - MODIFIED HERE
        Container(
          width: MediaQuery.of(context).size.width * 0.9, // Increased width for overflow
          height: 50.0, // Increased height for overflow
          margin: const EdgeInsets.only(top: 20), // Adjusted margin for visual centering
          decoration: BoxDecoration( // Changed from const BoxDecoration
            gradient: LinearGradient( // Changed from RadialGradient
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                // Approximations of the colors from your image.
                // Fine-tune these for the exact match.
                Color(0xFF2E2F33), // Dark grey/blue (top-left)
                Color(0xFF5B3C7B), // Purplish
                Color(0xFF4C6B8D), // Bluish
                Color(0xFF7E6B5A), // Brownish/darker orange (bottom-right)
              ],
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          // ClipRRect removed here to allow the gradient to spread
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
            child: Container(
              color: Colors.black.withOpacity(0.3),
            ),
          ),
        ),

        // 🌟 Foreground Nav Content (Remains mostly the same, adjusted width)
        Container(
          height: 50.0,
          width: MediaQuery.of(context).size.width * 0.9, // Original content width
          margin: const EdgeInsets.only(top: 20),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                SiteLogo(onTap: onLogoTap),
                const  Spacer(),
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
                    child: const Text(
                      "Kaushik_",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.3,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                const Spacer(),
                // The second Spacer was redundant, removed it
                IconButton(onPressed: onMenuTap, icon: const Icon(Icons.menu), color: CustomColor.whitePrimary,),
                const SizedBox(width: 15),
              ],
            ),
          ),
        ),
      ],
    );
  }
}