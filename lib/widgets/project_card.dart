import 'package:flutter/material.dart';
import 'package:portfolio_website/constant/colors.dart';
import 'package:portfolio_website/constant/size.dart';
import 'package:portfolio_website/utils/project_utils.dart';
import 'dart:js' as js;

class ProjectCardWidget extends StatelessWidget {
  final ProjectUtils project;

  const ProjectCardWidget({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < mobileWidth;
        final isTablet = constraints.maxWidth >= tabletWidth;

        final double imageWidth = isMobile ? double.infinity : 350;
        final double imageHeight = isMobile ? 180 : 150;
        final double cardWidth = isMobile ? double.infinity : 750;
        final double titleFontSize = isMobile ? 16 : (isTablet ? 18 : 20);
        final double descFontSize = isMobile ? 16 : 20;

        Widget platformIcons() {
          return Wrap(
            spacing: 10,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              if (project.androidLink != null)
                InkWell(
                  onTap:
                      () =>
                          js.context.callMethod("open", [project.androidLink]),
                  child: Image.asset("assets/android_icon.png", width: 22),
                ),
              if (project.iosLink != null)
                InkWell(
                  onTap: () => js.context.callMethod("open", [project.iosLink]),
                  child: Image.asset("assets/ios_icon.png", width: 22),
                ),
              if (project.webLink != null)
                InkWell(
                  onTap: () => js.context.callMethod("open", [project.webLink]),
                  child: Image.asset("assets/web_icon.png", width: 22),
                ),
              if (project.githubLink != null)
                InkWell(
                  onTap:
                      () => js.context.callMethod("open", [project.githubLink]),
                  child: Image.asset("assets/github.png", width: 22),
                ),
            ],
          );
        }

        return Container(
          width: cardWidth,
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: Color(0xff4c4d4e),
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black38,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child:
              isMobile
                  ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            project.image,
                            width: imageWidth,
                            height: imageHeight,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              project.title,
                              style: TextStyle(
                                fontSize: titleFontSize,
                                fontWeight: FontWeight.bold,
                                color: CustomColor.whitePrimary,
                              ),
                            ),
                            SizedBox(width: 50,),
                            Wrap(
                              spacing: 8,
                              children: project.tech.map((techIcon) {
                                return Image.asset(techIcon, width: 15);
                              }).toList(),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          textAlign: TextAlign.center,

                          project.description,
                          style: TextStyle(
                            fontSize: descFontSize,
                            color: CustomColor.whitePrimary,
                            fontFamily: 'Aptos',
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                              "Available on:",
                              style: TextStyle(
                                color: CustomColor.yellowSecondary,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(width: 10),
                            platformIcons(),
                          ],
                        ),
                      ],
                    ),
                  )
                  : Row(
                    children: [
                      // Left image section
                      Card(
                        child: Image.asset(
                          project.image,
                          width: imageWidth,
                          height: imageHeight,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(width: 20),
                      // Right text + buttons
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  project.title,
                                  style: TextStyle(
                                    fontSize: titleFontSize,
                                    fontWeight: FontWeight.bold,
                                    color: CustomColor.whitePrimary,
                                  ),
                                ),
                                Wrap(
                                  spacing: 15,
                                  children: project.tech.map((techIcon) {
                                    return Image.asset(techIcon, width: 20);
                                  }).toList(),
                                ),

                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              project.description,
                              style: TextStyle(
                                fontSize: descFontSize,
                                fontWeight: FontWeight.w300,
                                color: CustomColor.whitePrimary,
                                fontFamily: 'Aptos',
                              ),
                            ),
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                const Text(
                                  "Available on:",
                                  style: TextStyle(
                                    color: CustomColor.yellowSecondary,
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                platformIcons(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
        );
      },
    );
  }
}
