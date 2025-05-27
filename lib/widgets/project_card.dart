import 'package:flutter/material.dart';
import 'package:portfolio_website/constant/colors.dart';
import 'package:portfolio_website/constant/size.dart';
import 'dart:js' as js;

import 'package:portfolio_website/models/project_model.dart'; // Ensure ProjectUtils is correctly imported

class ProjectCardWidget extends StatelessWidget {
  final ProjectUtils project;

  const ProjectCardWidget({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < mobileWidth;
        final isTablet = constraints.maxWidth >= tabletWidth;

        // Adjusted default values for better mobile appearance if not explicitly set
        final double imageWidth = isMobile ? constraints.maxWidth * 0.8 : 350; // Use a percentage of screen width for mobile
        final double imageHeight = isMobile ? 180 : 150;
        final double cardWidth = isMobile ? double.infinity : 750;
        final double titleFontSize = isMobile ? 18 : (isTablet ? 18 : 20); // Slightly larger title for mobile
        final double descFontSize = isMobile ? 14 : 20; // Adjusted description font size for mobile

        Widget platformIcons() {
          return Wrap(
            spacing: 10,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              if (project.androidLink != null)
                InkWell(
                  onTap: () => js.context.callMethod("open", [project.androidLink]),
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
                  onTap: () => js.context.callMethod("open", [project.githubLink]),
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
            color: Color(0xff4c4d4e), // Your existing card background color
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black38,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: isMobile
              ? Padding( // Added Padding for overall mobile card content
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center, // Center all content
              children: [
                // Project Image
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

                // Title
                Text(
                  textAlign: TextAlign.center,
                  project.title,
                  style: TextStyle(
                    fontSize: titleFontSize, // Using responsive title font size
                    fontWeight: FontWeight.bold,
                    color: CustomColor.whitePrimary,
                  ),
                ),
                const SizedBox(height: 8), // Spacing between title and tech icons

                // Tech Icons
                Wrap( // Use Wrap for tech icons to allow wrapping
                  spacing: 8,
                  runSpacing: 4, // Spacing between lines if wrapped
                  alignment: WrapAlignment.center, // Center tech icons horizontally
                  children: project.tech.map((techIcon) {
                    return Image.asset(techIcon, width: 18); // Slightly larger tech icons for mobile
                  }).toList(),
                ),
                const SizedBox(height: 16), // Increased spacing after tech icons

                // Description
                Text(
                  textAlign: TextAlign.center,
                  project.description,
                  style: TextStyle(
                    fontSize: descFontSize, // Using responsive description font size
                    color: CustomColor.whitePrimary,
                    fontFamily: 'Aptos',
                  ),
                ),
                const SizedBox(height: 12),

                // "Available on:" and Platform Icons (Stacked vertically)
                Text(
                  "Available on:",
                  style: TextStyle(
                    color: CustomColor.yellowSecondary,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 8), // Spacing between text and icons
                platformIcons(),
                const SizedBox(height: 10), // Some bottom padding
              ],
            ),
          )
              : Row(
            children: [
              // Left image section
              ClipRRect( // Added ClipRRect for image in desktop/tablet view as well
                borderRadius: BorderRadius.circular(12), // Match card border radius
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
                        Wrap( // Using Wrap for tech icons in desktop/tablet too
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