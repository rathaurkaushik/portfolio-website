import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_website/constant/colors.dart';
import 'package:portfolio_website/constant/nav_items.dart';
import 'package:portfolio_website/utils/navigation_controller.dart';
import 'package:portfolio_website/widgets/snsLink.dart';
import 'dart:js' as js;
import '../../constant/sns_links.dart';

class FooterMobile extends StatelessWidget {
  FooterMobile({super.key});

  final navController = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Column(
        children: [
          /// Gradient Top Border
          Container(
            height: 2,
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

          const SizedBox(height: 12),

          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.2),
                    width: 1,
                  ),
                ),
                child: Column(
                  children: [
                    /// Navigation (column for mobile)
                    Obx(
                      () => Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(navTitles.length - 1, (
                            index,
                          ) {
                            final route = routeNames[index + 1];
                            final title = navTitles[index + 1];

                            return
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 6,
                                  horizontal: 10,
                                ),
                                child: MouseRegion(
                                  cursor: SystemMouseCursors.click, // 👈 show hand cursor on hover
                                  child: GestureDetector(
                                    onTap: () {
                                      if (title.toLowerCase() == "resume") {
                                        js.context.callMethod('open', [
                                          SnsLinks.resume,
                                          '_blank',
                                        ]);
                                      } else {
                                        navController.changeRoute(route);
                                      }
                                    },
                                    child: AnimatedDefaultTextStyle(
                                      duration: const Duration(milliseconds: 300),
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: navController.currentRoute.value == route
                                            ? CustomColor.footer_color
                                            : CustomColor.footer_color,
                                      ),
                                      child: Text(title),
                                    ),
                                  ),
                                ),
                              );

                          }),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    /// Social Link
                    const SnsLink(
                      url: 'https://github.com/rathaurkaushik',
                      text: 'Kaushik Rathaur',
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

          SelectableText(
            "© 2025 Kaushik Rathaur",
            style: TextStyle(fontSize: 11, color: Colors.grey.shade400),
          ),
        ],
      ),
    );
  }
}
