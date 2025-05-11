import 'package:flutter/material.dart';
import 'package:portfolio_website/constant/colors.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onTap;
  final String iconAssetPath; // PNG asset path like "assets/icons/pdf.png"

  const ButtonWidget({
    super.key,
    required this.title,
    required this.color,
    required this.iconAssetPath,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: color,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                iconAssetPath,
                width: 18,
                height: 18,
                color: CustomColor.whitePrimary,

                // optional: tint white
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Aptos',
                  color: CustomColor.whitePrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
