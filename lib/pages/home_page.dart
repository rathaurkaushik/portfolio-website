import 'package:flutter/material.dart';
import 'package:portfolio_website/constant/colors.dart';
import 'package:portfolio_website/constant/size.dart';
import 'package:portfolio_website/constant/sns_links.dart';
import 'package:portfolio_website/widgets/contact_section.dart';
import 'package:portfolio_website/widgets/drawer_mobile.dart';
import 'package:portfolio_website/widgets/footer.dart';
import 'package:portfolio_website/widgets/desktop/header_desktop.dart';
import 'package:portfolio_website/widgets/header_mobile.dart';
import 'package:portfolio_website/widgets/desktop/main_desktop.dart';
import 'package:portfolio_website/widgets/main_mobile.dart';
import 'package:portfolio_website/widgets/projects_section.dart';
import 'package:portfolio_website/widgets/skills_desktop.dart';
import 'package:portfolio_website/widgets/skills_mobile.dart';
import 'dart:js' as js;

import 'package:portfolio_website/widgets/tablet/header_tablet.dart';
import 'package:portfolio_website/widgets/tablet/main_tablet.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(4, (index) => GlobalKey());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        key: scaffoldKey,
        backgroundColor: CustomColor.scaffoldBg,
        endDrawer: constraints.maxWidth >= mobileWidth
            ? null
            : DrawerMobile(onNavItemTap: (int navIndex) {
          scaffoldKey.currentState?.closeEndDrawer();
          scrollToSection(navIndex);
        }),
        body: Container(
      // decoration: const BoxDecoration(
      // gradient: LinearGradient(
      // colors: [
      //   Color(0xFFedd7f7),
      // Color(0xFF5ec0d6),
      //
      // Color(0xFFF64F59),
      // ],
      // begin: Alignment.topCenter,
      // tileMode: TileMode.mirror,
      // end: Alignment.bottomRight,
      // ),
      // ),
          child: SingleChildScrollView(
            controller: scrollController,
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(key: navbarKeys.first),

                // MAIN
                  if (constraints.maxWidth >= tabletWidth)
                    HeaderDesktop(
                      onNavMenuTap: (int navIndex) {
                        scrollToSection(navIndex);
                      },
                      page: 0, // <-- this must be a valid `int` value from your state
                    )

                  else if(constraints.maxWidth >= mobileWidth && constraints.maxWidth <= tabletWidth)
                    HeaderTablet(onNavMenuTap: (int navIndex) {
                      scrollToSection(navIndex);
                    })
                else
                  HeaderMobile(
                    onLogoTap: () {},
                    onMenuTap: () {
                      scaffoldKey.currentState?.openEndDrawer();
                    },
                  ),

                /// --------- Main Screen ----------///
                ///
                ///
                if (constraints.maxWidth >= tabletWidth)
                  const MainDesktop()
                else if(constraints.maxWidth >= mobileWidth && constraints.maxWidth <= tabletWidth)
                  const MainTablet()
                else
                  const MainMobile(),

                // SKILLS
                Container(
                  key: navbarKeys[1],
                  width: screenWidth,
                  padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                  color: CustomColor.bgLight1,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // title
                      const Text(
                        "What I can do",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: CustomColor.whitePrimary,
                        ),
                      ),
                      const SizedBox(height: 50),

                      // platforms and skills
                      if (constraints.maxWidth >= tabletWidth)
                        const SkillsDesktop()
                      else
                        const SkillsMobile(),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // CONTACT
                ContactSection(
                  key: navbarKeys[3],
                ),
                const SizedBox(height: 30),

                // FOOTER
                const Footer(),
              ],
            ),
          ),
        ),
      );
    });
  }

  void scrollToSection(int navIndex) {
    if (navIndex == 4) {
      // open a blog page
      js.context.callMethod('open', [SnsLinks.blog]);
      return;
    }

    final key = navbarKeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
