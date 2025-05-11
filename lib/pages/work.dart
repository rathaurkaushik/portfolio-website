import 'package:flutter/material.dart';
import 'package:portfolio_website/constant/colors.dart';
import 'package:portfolio_website/constant/size.dart';
import 'package:portfolio_website/widgets/desktop/header_desktop.dart';
import 'package:portfolio_website/widgets/header_mobile.dart';
import 'package:portfolio_website/widgets/projects_section.dart';
import 'package:portfolio_website/widgets/tablet/header_tablet.dart';

class WorkPage extends StatelessWidget {
  const WorkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {

          final isMobile = constraints.maxWidth < mobileWidth;
          final isDesktop = constraints.maxWidth > tabletWidth;
          final isTablet =
              !isDesktop &&
                  constraints.maxWidth > mobileWidth;


          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              color: CustomColor.scaffoldBg,
              child: Column(
                children: [
                  if (isMobile)
                    HeaderMobile()
                  else if (isTablet)
                    HeaderTablet(onNavMenuTap: (p0) => 2,)
                  else
                    HeaderDesktop(onNavMenuTap: (p0) => 2, page: 0),

                  SizedBox(height: 50,),
                  Container(
                    child: SingleChildScrollView(
                      child: Expanded(child: ProjectsSection()),
                    ),
                  ),


                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
