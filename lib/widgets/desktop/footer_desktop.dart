import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_website/constant/colors.dart';
import 'package:portfolio_website/constant/nav_items.dart';
import 'package:portfolio_website/utils/navigation_controller.dart';
import 'package:portfolio_website/widgets/snsLink.dart';
import 'dart:js' as js;
import '../../constant/sns_links.dart';

class FooterDesktop extends StatelessWidget {
  FooterDesktop({super.key});

  final navController = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 40),
      child: Column(
        children: [
          /// 🔥 Animated Gradient Top Border
          Container(
            height: 3,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.pink,
                  Colors.blue,
                  Colors.purple,
                  Colors.orange,
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),

          const SizedBox(height: 20),

          /// 🌟 Glassmorphic Background Footer
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.2),
                    width: 1,
                  ),
                ),
                child: Column(
                  children: [
                    /// Navigation Items
                    Obx(
                          () => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(navTitles.length - 1, (index) {
                          final route = routeNames[index + 1];
                          final title = navTitles[index + 1];

                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () {
                                  if (title.toLowerCase() == "resume") {
                                    js.context.callMethod(
                                        'open', [SnsLinks.resume, '_blank']);
                                  } else {
                                    navController.changeRoute(route);
                                  }
                                },
                                child: AnimatedDefaultTextStyle(
                                  duration: const Duration(milliseconds: 300),
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Aptos',
                                    color: CustomColor.footer_color,
                                    decoration: navController.currentRoute.value == route
                                        ? TextDecoration.underline
                                        : TextDecoration.none,
                                  ),
                                  child: Text(title),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),

                    const SizedBox(height: 25),

                    /// 🌐 Social Link
                    const SnsLink(
                        url: 'https://github.com/rathaurkaushik',
                        text: 'Kaushik Rathaur'),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          /// Copyright Text
          SelectableText(
            "© 2025 Kaushik Rathaur | All Rights Reserved",
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey.shade400,
            ),
          ),
        ],
      ),
    );
  }
}
