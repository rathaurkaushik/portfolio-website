import 'package:flutter/material.dart';
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
      final isTablet = constraints.maxWidth >= mobileWidth && constraints.maxWidth <= tabletWidth;

      Widget content = Padding(
        padding: EdgeInsets.only(top: topPadding),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  title,
                  style: TextStyle(
                    color: titleColor,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                description,
                style: TextStyle(fontSize: 16.0, color: textColor),
              ),
              const SizedBox(height: 10.0),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
                alignment: WrapAlignment.start,
                children: skills
                    .map((skill) => ExperienceSkill(
                  label: skill['label'],
                  color: skill['color'],
                ))
                    .toList(),
              ),
              const SizedBox(height: 20.0),
              // Image container, making sure the photo matches the container size
              Container(
                width: double.infinity,
                height: imageHeight, // Use height based on provided imageHeight
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                  color: Colors.transparent, // Keep transparent if the image is shown
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12), // Ensure the image matches the border radius
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

      // Apply background color and container only for tablet
      return isTablet
          ? Container(
        width: double.infinity,
        color: Colors.grey.shade900, // Background color for tablet view
        padding: const EdgeInsets.all(16.0),
        child: content,
      )
          : content;
    });
  }
}
