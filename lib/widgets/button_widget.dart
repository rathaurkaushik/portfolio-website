import 'dart:js' as js;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_website/constant/colors.dart';
import 'package:portfolio_website/constant/sns_links.dart';
import 'package:portfolio_website/utils/navigation_controller.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final Color color;
  final String iconAssetPath;
  final String? route;
  final VoidCallback? onTap;

  ButtonWidget({
    super.key,
    required this.title,
    required this.color,
    required this.iconAssetPath,
    this.route,
    this.onTap,
  });

  final navController = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ??
              () {
            if (title.toLowerCase() == "resume") {
              // open resume in new tab
              js.context.callMethod('open', [SnsLinks.resume, '_blank']);
            } else if (route != null) {
              // normal navigation
              navController.changeRoute(route!);
            }
          },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: color,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                iconAssetPath,
                width: 18,
                height: 18,
                color: CustomColor.whitePrimary,
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Aptos',
                  color: navController.currentRoute.value == route
                      ? CustomColor.experience
                      : CustomColor.whitePrimary,
                  decoration: navController.currentRoute.value == route
                      ? TextDecoration.underline
                      : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
