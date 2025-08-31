import 'dart:ui';
import 'dart:js' as js;
import 'dart:math'; // ✅ min() ke liye import
import 'package:flutter/material.dart';
import 'package:portfolio_website/constant/colors.dart';
import 'package:portfolio_website/constant/nav_items.dart';
import 'package:get/get.dart';
import 'package:portfolio_website/constant/sns_links.dart';
import 'package:portfolio_website/utils/navigation_controller.dart';

class HeaderTablet extends StatelessWidget {
  HeaderTablet({super.key});
  final navController = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 🎨 Gradient Background with Blur
        Container(
          width: MediaQuery.of(context).size.width * 0.75,
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

        // 🌟 Foreground Nav Content
        Container(
          width: MediaQuery.of(context).size.width * 0.75,
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
                  onPressed: () => navController.changeRoute(routeNames[0]),
                  child: Text(
                    navTitles[0],
                    style: const TextStyle(
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
                children: List.generate(
                  min(navTitles.length - 1, routeNames.length - 1), // ✅ safe limit
                      (index) {
                    final route = routeNames[index + 1];
                    final title = navTitles[index + 1];

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 7),
                      child: TextButton(
                        onPressed: () {
                          if (title == "resume") {
                            // 👇 open in new tab
                            js.context.callMethod('open', [SnsLinks.resume, '_blank']);
                          } else {
                            // 👇 normal navigation
                            navController.changeRoute(route);
                          }
                        },
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 16, // ✅ second code se liya
                            fontWeight: FontWeight.bold, // ✅ bold style
                            fontFamily: 'Aptos', // ✅ custom font
                            color: navController.currentRoute.value == route
                                ? CustomColor.experience // ✅ active color
                                : CustomColor.whitePrimary, // ✅ default color
                            decoration: navController.currentRoute.value == route
                                ? TextDecoration.underline
                                : TextDecoration.none,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ))

            ],
          ),
        ),
      ],
    );
  }
}
