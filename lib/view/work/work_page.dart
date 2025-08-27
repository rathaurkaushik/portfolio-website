import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_website/constant/colors.dart';
import 'package:portfolio_website/constant/size.dart';
import 'package:portfolio_website/view/home/home_controller.dart';
import 'package:portfolio_website/widgets/desktop/header_desktop.dart';
import 'package:portfolio_website/widgets/desktop/work_desktop.dart';
import 'package:portfolio_website/widgets/mobile/header_mobile.dart';
import 'package:portfolio_website/widgets/mobile/work_mobile.dart';
import 'package:portfolio_website/widgets/tablet/header_tablet.dart';
import 'package:portfolio_website/widgets/tablet/work_tablet.dart';
import 'package:portfolio_website/widgets/drawer_mobile.dart';

class WorkPage extends GetView<HomeController> {
  const WorkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < mobileWidth;
        final isDesktop = constraints.maxWidth > tabletWidth;
        final isTablet = !isDesktop && constraints.maxWidth > mobileWidth;

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
                // HEADER
                if (isMobile)
                  HeaderMobile(
                    onMenuTap: () =>
                        controller.scaffoldKey.currentState?.openEndDrawer(),
                    onLogoTap: () => Get.toNamed('/'),
                  )
                else if (isTablet)
                  HeaderTablet()
                else
                  HeaderDesktop(),

                // MAIN CONTENT
                if (isMobile)
                  WorkMobile()
                else if (isTablet)
                  WorkTablet()
                else
                  WorkDesktop(),
              ],
            ),
          ),
        );
      },
    );
  }
}
