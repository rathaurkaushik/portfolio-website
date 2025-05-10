import 'package:flutter/material.dart';

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
      width: 90,
      child: Chip(
        shadowColor: color,
        label: Text(label,style: TextStyle(color: Colors.black, fontSize: 10,fontWeight: FontWeight.bold,),),
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
