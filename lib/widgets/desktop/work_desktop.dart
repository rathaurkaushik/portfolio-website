import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/constant/colors.dart';
import 'package:portfolio_website/models/project_model.dart';
import 'package:portfolio_website/widgets/desktop/footer_desktop.dart';
import 'package:portfolio_website/widgets/platform_icons.dart';
import 'package:portfolio_website/widgets/project_card.dart';

class WorkDesktop extends StatelessWidget {
  const WorkDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      padding: const EdgeInsets.fromLTRB(80, 60, 80, 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Title
          const SelectableText(
            "Works",
            style: TextStyle(
              fontSize: 80,
              fontFamily: 'Aptos',
              fontWeight: FontWeight.bold,
              color: CustomColor.webDev1,
            ),
          ),

          const SizedBox(height: 40),

          // Subtitle / description
          SelectableText(
            'From websites with pastel hues to intelligent ML models,\n'
                'infused with little bit of playfulness. So go ahead, and take a \n'
                'look around 💖',
            textAlign: TextAlign.center,
            style: GoogleFonts.openSans(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              height: 1.5,
              color: CustomColor.whitePrimary,
            ),
          ),

          const SizedBox(height: 60),

          // Projects Grid
          Column(
            children: workProjectUtils.map((project) {
              return Container(
                width: 750,
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
                child:
                Row(
                  children: [
                    // Left image section
                    ClipRRect( // Added ClipRRect for image in desktop/tablet view as well
                      borderRadius: BorderRadius.circular(12), // Match card border radius
                      child: Image.network(
                        project.image,
                        width: 250,
                        height: 150,
                        fit: BoxFit.cover,
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
                              SelectableText(
                                project.title,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: CustomColor.whitePrimary,
                                ),
                              ),
                              Wrap( // Using Wrap for tech icons in desktop/tablet too
                                spacing: 10,
                                children: project.tech.map((techIcon) {
                                  return Image.network(techIcon, width: 25);
                                }).toList(),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          SelectableText(
                            project.description,
                            style: GoogleFonts.openSans(
                              fontSize: 18,
                              color: CustomColor.whitePrimary,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              const SelectableText(
                                "Available on:",
                                style: TextStyle(
                                  color: CustomColor.yellowSecondary,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(width: 15),
                              PlatformIcons(project: project,),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

              );
            }).toList(),
          ),
      SizedBox(
        width: double.infinity,
        child: FooterDesktop(),
      )
        ]
      ),
    );
  }
}
