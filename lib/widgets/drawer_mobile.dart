import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:js' as js;

import 'package:portfolio_website/constant/colors.dart';
import 'package:portfolio_website/constant/nav_items.dart';
import 'package:portfolio_website/utils/navigation_controller.dart';
import 'package:portfolio_website/constant/sns_links.dart';

class DrawerMobile extends StatelessWidget {
  DrawerMobile({super.key});

  final navController = Get.put(NavigationController());

  void openTopDrawer(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Drawer",
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Align(
          alignment: Alignment.topCenter,
          child: Material(
            color: CustomColor.scaffoldBg,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5, // ✅ half screen
              width: double.infinity,
              padding: const EdgeInsets.only(top: 20),
              child: ListView(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  for (int i = 0; i < navIcons.length; i++)
                    TweenAnimationBuilder<double>(
                      duration: Duration(milliseconds: 300 + (i * 100)),
                      curve: Curves.easeOut,
                      tween: Tween(begin: 0.0, end: 1.0),
                      builder: (context, value, child) {
                        return Transform.translate(
                          offset: Offset(0, -50 * (1 - value)), // top se slide
                          child: Opacity(
                            opacity: value,
                            child: child,
                          ),
                        );
                      },
                      child: Obx(() {
                        final isSelected = navController.currentRoute.value ==
                            navController.routeNames[i];
                        final title = navTitlesMobile[i];

                        return ListTile(
                          contentPadding:
                          const EdgeInsets.symmetric(horizontal: 30.0),
                          titleTextStyle: TextStyle(
                            color: isSelected
                                ? Colors.amberAccent
                                : CustomColor.whitePrimary,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                          onTap: () {
                            Navigator.of(context).pop();

                            // 👉 resume logic same as desktop
                            if (title.toLowerCase() == "resume") {
                              js.context.callMethod(
                                  'open', [SnsLinks.resume, '_blank']);
                            } else {
                              navController.onNavMenuTap(i);
                            }
                          },
                          title: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              title,
                              style: GoogleFonts.openSans(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: CustomColor.whitePrimary,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                ],
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position:
          Tween(begin: const Offset(0, -1), end: Offset.zero).animate(animation),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.more_vert, color: Colors.white),
      onPressed: () => openTopDrawer(context), // ✅ drawer open
    );
  }
}
