import 'package:flutter/material.dart';
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
    return


      Padding(
      padding: EdgeInsets.only(top: topPadding),
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
            // spacing: 2,
            // runSpacing: 2,
            children: skills
                .map((skill) => ExperienceSkill(
              label: skill['label'],
              color: skill['color'],
            ))
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
