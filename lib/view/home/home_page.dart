import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_website/constant/colors.dart';
import 'package:portfolio_website/constant/size.dart';

import 'package:portfolio_website/widgets/contact_section.dart';
import 'package:portfolio_website/widgets/drawer_mobile.dart';

import 'package:portfolio_website/widgets/desktop/header_desktop.dart';
import 'package:portfolio_website/widgets/mobile/header_mobile.dart';
import 'package:portfolio_website/widgets/desktop/main_desktop.dart';
import 'package:portfolio_website/widgets/mobile/main_mobile.dart';

import 'package:portfolio_website/widgets/snsLink.dart';
import 'package:portfolio_website/widgets/tablet/header_tablet.dart';
import 'package:portfolio_website/widgets/tablet/main_tablet.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: controller.scaffoldKey,
          backgroundColor: CustomColor.scaffoldBg,
          endDrawer: constraints.maxWidth >= mobileWidth
              ? null
              : DrawerMobile(),
          body: SingleChildScrollView(
            controller: controller.scrollController,
            child: Column(
              children: [
                SizedBox(key: controller.navbarKeys.first),

                // HEADER
                if (constraints.maxWidth >= tabletWidth)
                  HeaderDesktop()
                else if (constraints.maxWidth >= mobileWidth)
                  HeaderTablet()
                else
                  HeaderMobile(
                    onMenuTap: () => controller.scaffoldKey.currentState?.openEndDrawer(),
                    onLogoTap: () => Get.toNamed('/'),
                  ),

                // MAIN
                if (constraints.maxWidth >= tabletWidth)
                  const MainDesktop()
                else if (constraints.maxWidth >= mobileWidth)
                  const MainTablet()
                else
                  const MainMobile(),

                const SizedBox(height: 30),

                ContactSection(),
                const SizedBox(height: 30),
                SnsLink(url: 'https://github.com/rathaurkaushik', text: 'Kaushik Rathaur'),
              ],
            ),
          ),
        );
      },
    );
  }
}
