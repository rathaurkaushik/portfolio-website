import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/constant/colors.dart';
import 'package:portfolio_website/constant/size.dart'; // Ensure this defines `mobileWidth` and `tabletWidth`
import 'package:portfolio_website/widgets/experience_skill.dart';
import 'package:portfolio_website/widgets/hover_widget.dart';

class ExperienceTabletSection extends StatelessWidget {
  final String title;
  final String description;
  final List<Map<String, dynamic>> skills;
  final String imagePath;
  final Color textColor;
  final Color titleColor;
  final double imageHeight;
  final double imageWidth;
  final double topPadding;

  const ExperienceTabletSection({
    super.key,
    required this.title,
    required this.description,
    required this.skills,
    required this.imagePath,
    required this.textColor,
    required this.titleColor,
    required this.imageHeight,
    required this.imageWidth,
    this.topPadding = 0,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final isTablet =
          constraints.maxWidth >= mobileWidth && constraints.maxWidth <= tabletWidth;

      // Scale font size based on screen width (fix pixel issue)
      final double baseFontSize = (constraints.maxWidth / 40).clamp(14.0, 22.0);
      final double titleFontSize = (constraints.maxWidth / 25).clamp(18.0, 28.0);

      Widget content = Padding(
        padding: EdgeInsets.only(top: topPadding),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SelectableText(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: titleColor,
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              SelectableText(
                description,
                textAlign: TextAlign.justify,
                style: GoogleFonts.openSans(
                  fontSize: baseFontSize,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 10.0),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
                alignment: WrapAlignment.start,
                spacing: 8,
                runSpacing: 8,
                children: skills
                    .map((skill) => ExperienceSkill(
                  label: skill['label'],
                  color: skill['color'],
                ))
                    .toList(),
              ),
              const SizedBox(height: 20.0),
              // Image container
              Container(
                width: double.infinity,
                height: imageHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.transparent,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: HoverImageCard(
                    imagePath: imagePath,
                    height: imageHeight,
                    width: imageWidth,
                    borderColor: textColor.withOpacity(0.4),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

      return isTablet
          ? Container(
        width: double.infinity,
        color: Colors.grey.shade900,
        padding: const EdgeInsets.all(16.0),
        child: content,
      )
          : content;
    });
  }
}
