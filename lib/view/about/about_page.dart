import 'package:flutter/material.dart';
import 'package:portfolio_website/constant/colors.dart';
import 'package:portfolio_website/constant/size.dart';
import 'package:portfolio_website/widgets/desktop/about_section_desktop.dart';
import 'package:portfolio_website/widgets/desktop/header_desktop.dart';
import 'package:portfolio_website/widgets/desktop/tech_section_desktop.dart';
import 'package:portfolio_website/widgets/mobile/about_section_mobile.dart';
import 'package:portfolio_website/widgets/mobile/header_mobile.dart';
import 'package:portfolio_website/widgets/mobile/tech_section_mobile.dart';
import 'package:portfolio_website/widgets/tablet/about_section_tablet.dart';
import 'package:portfolio_website/widgets/tablet/header_tablet.dart';
import 'package:portfolio_website/widgets/tablet/tech_section_tablet.dart';


class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < mobileWidth;
          final isDesktop = constraints.maxWidth > tabletWidth;
          final isTablet = !isDesktop && constraints.maxWidth > mobileWidth;

          return SingleChildScrollView(
            child: Container(
              color: CustomColor.scaffoldBg,
              child: Column(
                children: [
                  if (isMobile)
                    HeaderMobile()
                  else if (isTablet)
                    HeaderTablet()
                  else
                    HeaderDesktop(),

                  if (isMobile)
                    AboutSectionMobile()
                  else if (isTablet)
                    (AboutSectionTablet())
                  else
                    AboutSectionDesktop(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
