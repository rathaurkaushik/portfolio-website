import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:portfolio_website/constant/colors.dart';
import 'package:portfolio_website/constant/nav_items.dart';
import 'package:portfolio_website/styles/style.dart'; // Assuming this is used elsewhere
import 'package:get/get.dart';
import 'package:portfolio_website/utils/navigation_controller.dart';

class HeaderTablet extends StatelessWidget {
  HeaderTablet({super.key});
  final navController = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 🎨 Gradient Background with Blur - MODIFIED HERE
        Container(
          width: MediaQuery.of(context).size.width * 0.75, // Increased width for overflow
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
          width: MediaQuery.of(context).size.width * 0.75, // Original content width
          height: 50.0,
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Brand Name
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
                      fontSize: 18,
                      height: 1.3,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              // Navigation Items
              Obx(() => Row(
                children: List.generate(navTitles.length, (index) {
                  final routeNames = ['/', '/work', '/tech', '/mark', '/resume']; // match your GetPages
                  final route = routeNames[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7),
                    child: TextButton(
                      onPressed: () => navController.changeRoute(route),
                      child: Text(
                        navTitles[index],
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: navController.currentRoute.value == route
                              ? Colors.amberAccent
                              : CustomColor.whitePrimary,
                          decoration: navController.currentRoute.value == route
                              ? TextDecoration.underline
                              : TextDecoration.none,
                        ),
                      ),
                    ),
                  );
                }),
              ))
            ],
          ),
        ),
      ],
    );
  }
}