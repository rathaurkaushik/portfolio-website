import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/widgets/experience_skill.dart';
import 'package:portfolio_website/widgets/hover_widget.dart';

class ExperienceSection extends StatelessWidget {
  final String title;
  final String description;
  final List<Map<String, dynamic>> skills;
  final String imagePath;
  final Color textColor;
  final Color titleColor;
  final double imageHeight;
  final double imageWidth;
  final double topPadding;

  const ExperienceSection({
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
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: SelectableText(
              title,
              style: GoogleFonts.openSans(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline,
                color: titleColor,
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          SelectableText(
            description,
            style: GoogleFonts.openSans(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
              color: textColor,
            ),
          ),
          const SizedBox(height: 10.0),
          Wrap(
            // spacing: 2,
            // runSpacing: 2,
            children:
                skills
                    .map(
                      (skill) => ExperienceSkill(
                        label: skill['label'],
                        color: skill['color'],
                      ),
                    )
                    .toList(),
          ),
          const SizedBox(height: 20.0),
          HoverImageCard(
            imagePath: imagePath,
            height: imageHeight,
            width: imageWidth,
            borderColor: textColor.withOpacity(0.4),
          ),
        ],
      ),
    );
  }
}
