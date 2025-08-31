import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:js' as js;
import 'package:portfolio_website/constant/colors.dart';
import 'package:portfolio_website/models/project_model.dart';
import 'package:portfolio_website/widgets/mobile/footer_mobile.dart';
import 'package:portfolio_website/widgets/platform_icons.dart';

class WorkMobile extends StatelessWidget {
  const WorkMobile({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SelectableText(
            "Works",
            style: TextStyle(
              fontSize: 35,
              fontFamily: 'Aptos',
              fontWeight: FontWeight.bold,
              color: CustomColor.webDev1,
            ),
          ),
          const SizedBox(height: 15),
          SelectableText(
            'From websites with pastel hues to intelligent ML models,\n'
                'infused with little bit of playfulness. So go ahead, and take a \n'
                'look around 💖',
            textAlign: TextAlign.center,
            style: GoogleFonts.openSans(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: CustomColor.whitePrimary,
            ),
          ),
          const SizedBox(height: 30),
          Column(
            children: workProjectUtils.map((project) {
              return Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: const Color(0xff4c4d4e),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network( // <-- use asset if local image
                        project.image,
                        width: double.infinity,
                        height: 180,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 12),
                    SelectableText(
                      project.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.whitePrimary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    SelectableText(
                      project.description,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                        fontSize: 14,
                        color: CustomColor.whitePrimary,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const SelectableText(
                      "Available on:",
                      style: TextStyle(
                        color: CustomColor.yellowSecondary,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 6),
                    PlatformIcons(project: project)
                    ,
                  ],
                ),
              );
            }).toList(),
          ),
FooterMobile()
        ],
      ),
    );
  }
}
