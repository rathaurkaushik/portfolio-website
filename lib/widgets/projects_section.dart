import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:portfolio_website/constant/colors.dart';
import 'package:portfolio_website/models/project_model.dart';

import 'project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      child: Column(
        children: [
          // Work projects title
          const Text(
            "Works",
            style: TextStyle(
              inherit: true,
              fontSize: 70,
              fontFamily: 'Aptos',
              fontWeight: FontWeight.bold,
              color: CustomColor.webDev,
            ),
          ),
          const SizedBox(height: 50),
          
          Text('From websites with pastel hues to intelligent ML models,\ninfused with little bit of playfulness. So go ahead, and take a \nlook around 💖',textAlign: TextAlign.center, style: TextStyle(color: CustomColor.whitePrimary,fontSize: 20,fontFamily: 'Aptos'),),
          // Work projects cards
          const SizedBox(height: 50),

          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Wrap(
              spacing: 25,
              runSpacing: 25,
              children: [
                for (int i = 0; i < workProjectUtils.length; i++)
                  ProjectCardWidget(
                    project: workProjectUtils[i],
                  ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
