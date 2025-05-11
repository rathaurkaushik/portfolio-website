import 'package:flutter/material.dart';
import 'package:portfolio_website/constant/colors.dart';
import 'package:portfolio_website/constant/nav_items.dart';
import 'package:portfolio_website/widgets/site_logo.dart';

import '../../styles/style.dart';


class HeaderTablet extends StatelessWidget {
  final Function(int) onNavMenuTap;

  const HeaderTablet({super.key, required this.onNavMenuTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      height: 50.0,
      // margin: const EdgeInsets.symmetric(
      //   vertical: 10.0,
      //   horizontal: 20.0,
      // ),
      decoration: kHederDecoration,
      margin: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ShaderMask(
            shaderCallback: (bounds) {
              return const LinearGradient(
                colors: [
                  Color(0xFFC471ED),
                  Color(0xFF12C2E9),
                  Color(0xFFF64F59),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height));
            },
            blendMode: BlendMode.srcIn, // Required to apply gradient to text
            child: const Text(
              "Kaushik_  ",
              style: TextStyle(
                fontSize: 20,
                height: 1.5,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Important!
              ),
            ),
          ),
          // SiteLogo(
          //   onTap: () {
          //   },
          // ),
          SizedBox(width: 60),
          Row(
            children: [
              for (int i = 0; i < navTitles.length; i++)
                Padding(
                  padding: const EdgeInsets.only(right: 0),
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
          /// Dark And Light Theme
          // IconButton(
          //   onPressed: () {
          //     ThemeData.light();
          //   },
          //   icon:
          //
          //   Icon(Icons.light_mode, color: CustomColor.whitePrimary),
          // ),
        ],
      ),
    );
  }
}
