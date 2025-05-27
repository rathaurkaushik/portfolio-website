import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_website/constant/colors.dart';
import 'package:portfolio_website/constant/nav_items.dart';
import 'package:portfolio_website/utils/navigation_controller.dart';

class DrawerMobile extends StatelessWidget {
  DrawerMobile({super.key});

  final navController = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: CustomColor.scaffoldBg,
      child: ListView(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                top: 20,
                bottom: 20,
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the drawer
                },
                icon: const Icon(Icons.close, color: Colors.white),
              ),
            ),
          ),
          for (int i = 0; i < navIcons.length; i++)
            Obx(() {
              final isSelected = navController.currentRoute.value == navController.routeNames[i];
              return ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 30.0),
                titleTextStyle: TextStyle(
                  color: isSelected ? Colors.amberAccent : CustomColor.whitePrimary,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
                onTap: () {
                  Navigator.of(context).pop(); // Close the drawer
                  navController.onNavMenuTap(i);
                },
                leading: Icon(
                  navIcons[i],
                  color: isSelected ? Colors.amberAccent : CustomColor.whitePrimary,
                ),
                title: Text(navTitles[i]),
              );
            }),
        ],
      ),
    );
  }
}
