import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/constant/colors.dart';

class ExperienceSkill extends StatelessWidget {
  final String label;
  final Color color;

  const ExperienceSkill({
    super.key,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: Chip(
        shadowColor: color,
        label: Text(label,style: GoogleFonts.openSans(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
          color: Colors.black,
        ),),
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
