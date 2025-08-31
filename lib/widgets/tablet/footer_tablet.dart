import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_website/constant/colors.dart';
import 'package:portfolio_website/constant/nav_items.dart';
import 'package:portfolio_website/utils/navigation_controller.dart';
import 'package:portfolio_website/widgets/snsLink.dart';
import 'dart:js' as js;
import '../../constant/sns_links.dart';

class FooterTablet extends StatelessWidget {
  FooterTablet({super.key});

  final navController = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      child: Column(
        children: [
          /// Gradient Top Border
          Container(
            height: 3,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.pink, Colors.blue, Colors.purple, Colors.orange],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),

          const SizedBox(height: 15),

          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: BackdropFilter(
              filter: ImageFilter
                  .blur(sigmaX: 25, sigmaY: 25),
              child: Container(
                width: double.infinity  ,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
                ),
                child: Column(
                  children: [
                    /// Navigation Items (smaller)
                    Obx(
                          () => Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 35,
                        runSpacing: 10,
                        children: List.generate(navTitles.length - 1, (index) {
                          final route = routeNames[index + 1];
                          final title = navTitles[index + 1];

                          return GestureDetector(
                            onTap: () {
                              if (title.toLowerCase() == "resume") {
                                js.context.callMethod('open', [SnsLinks.resume, '_blank']);
                              } else {
                                navController.changeRoute(route);
                              }
                            },
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click, // 👈 changes cursor on hover
                              child: AnimatedDefaultTextStyle(
                                duration: const Duration(milliseconds: 300),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: navController.currentRoute.value == route
                                      ? CustomColor.footer_color
                                      : CustomColor.footer_color,
                                ),
                                child: Text(title),
                              ),
                            ),
                          );


                        }),
                      ),
                    ),

                    const SizedBox(height: 20),

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

          const SizedBox(height: 15),

          Text(
            "© 2025 Kaushik Rathaur | All Rights Reserved",
            style: TextStyle(fontSize: 12, color: Colors.grey.shade400),
          ),
        ],
      ),
    );
  }
}
