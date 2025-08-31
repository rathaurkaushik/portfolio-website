import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/constant/colors.dart';
import 'package:portfolio_website/models/project_model.dart';
import 'dart:js' as js;

class ProjectCardWidgetDesktop extends StatelessWidget {
  final ProjectUtils project;

  const ProjectCardWidgetDesktop({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    double imageWidth = 350;
    double imageHeight = 150;
    double titleFontSize = 18;
    double descFontSize = 20;

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
      width: 750,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xff4c4d4e),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Left: Project Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              project.image,
              width: imageWidth,
              height: imageHeight,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 20),

          // Right: Title, Description, and Platforms
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
                        return Image.network(techIcon, width: 20);
                      }).toList(),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                Text(
                  project.description,
                  style: GoogleFonts.openSans(
                    fontSize: descFontSize,
                    color: CustomColor.whitePrimary,
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
  }
}
