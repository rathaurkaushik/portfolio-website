import 'package:flutter/material.dart';
import 'package:portfolio_website/constant/colors.dart';
import 'package:portfolio_website/constant/nav_items.dart';
import 'package:portfolio_website/widgets/site_logo.dart';

import '../styles/style.dart';

class HeaderDesktop extends StatelessWidget {
  final Function(int) onNavMenuTap;

  const HeaderDesktop({
    super.key,
      required this.onNavMenuTap,
  });
  @override
  Widget build(BuildContext context) {
    return Container(

      height: 60.0,
      margin: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      width: double.maxFinite,
      decoration: kHederDecoration,
      child: Row(
        children: [
          SiteLogo(
            onTap: () {
            },
          ),
          const Spacer(),

          for (int i = 0; i < navTitles.length; i++)
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: TextButton(
                onPressed: () {
                  onNavMenuTap(i);
                },
                child: Text(
                  navTitles[i],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: CustomColor.whitePrimary,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
