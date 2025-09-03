import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_website/constant/colors.dart';
import 'package:portfolio_website/constant/size.dart';
import 'package:portfolio_website/utils/navigation_controller.dart';
import 'package:portfolio_website/view/home/home_controller.dart';
import 'package:portfolio_website/widgets/desktop/header_desktop.dart';
import 'package:portfolio_website/widgets/desktop/tech_section_desktop.dart';
import 'package:portfolio_website/widgets/mobile/header_mobile.dart';
import 'package:portfolio_website/widgets/mobile/tech_section_mobile.dart';
import 'package:portfolio_website/widgets/tablet/header_tablet.dart';
import 'package:portfolio_website/widgets/tablet/tech_section_tablet.dart';
import 'package:portfolio_website/widgets/drawer_mobile.dart';

class TechPage extends GetView<HomeController> {
  const TechPage({super.key});

  @override
  Widget build(BuildContext context) {
    final navController = Get.find<NavigationController>();
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < mobileWidth;
        final isDesktop = constraints.maxWidth > tabletWidth;
        final isTablet = !isDesktop && constraints.maxWidth > mobileWidth;

        return Scaffold(
          key: navController.scaffoldKey,
          backgroundColor: CustomColor.scaffoldBg,
          endDrawer: constraints.maxWidth >= mobileWidth
              ? null
              : DrawerMobile(),
          body: SingleChildScrollView(
            controller: controller.scrollController,
            child: Column(
              children: [
                // HEADER
                if (isMobile)
                  HeaderMobile(
                    onMenuTap: () =>
                        navController.scaffoldKey.currentState?.openEndDrawer(),
                    onLogoTap: () => Get.toNamed('/'),
                  )
                else if (isTablet)
                  HeaderTablet()
                else
                  HeaderDesktop(),

                // MAIN CONTENT
                if (isMobile)
                  TechSectionMobile()
                else if (isTablet)
                  TechSectionTablet()
                else
                  TechSectionDesktop(),
              ],
            ),
          ),
        );
      },
    );
  }
}
