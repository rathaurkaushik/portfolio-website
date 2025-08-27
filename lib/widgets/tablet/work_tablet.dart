import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:js' as js;
import 'package:portfolio_website/constant/colors.dart';
import 'package:portfolio_website/models/project_model.dart';
import 'package:portfolio_website/widgets/platform_icons.dart';

class WorkTablet extends StatelessWidget {
  const WorkTablet({super.key});



  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
        width: screenWidth,
        padding: const EdgeInsets.fromLTRB(80, 60, 80, 100),
        child: Column(
          children: [
          const Text(
          "Works",
          style: TextStyle(
            fontSize: 50,
            fontFamily: 'Aptos',
            fontWeight: FontWeight.bold,
            color: CustomColor.webDev1,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'From websites with pastel hues to intelligent ML models,\n'
              'infused with little bit of playfulness. So go ahead, and take a \n'
              'look around 💖',
          textAlign: TextAlign.center,
          style: GoogleFonts.openSans(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: CustomColor.whitePrimary,
          ),
        ),
          const SizedBox(height: 30),
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
                      blurRadius: 8,
                      offset: Offset(0, 3),
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
                        width: 200,
                        height: 200,
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
                              Text(
                                project.title,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: CustomColor.whitePrimary,
                                ),
                              ),
                              Wrap( // Using Wrap for tech icons in desktop/tablet too
                                spacing: 0,
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
                              fontSize: 16,
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
            SizedBox(height: 100,)
        ],
      ),
    );
  }
}
