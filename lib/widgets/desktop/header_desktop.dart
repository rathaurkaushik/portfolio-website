import 'package:flutter/material.dart';
import 'package:portfolio_website/constant/colors.dart';
import 'package:portfolio_website/constant/nav_items.dart';
import 'package:portfolio_website/styles/style.dart';

int getPageIndexFromRoute(String? routeName) {
  switch (routeName) {
    case '/':
      return 0;
    case '/work':
      return 1;
    default:
      return 0;
  }
}

class HeaderDesktop extends StatelessWidget {
  final Function(int) onNavMenuTap;
  final int page;

  const HeaderDesktop({
    super.key,
    required this.onNavMenuTap,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      height: 50.0,
      margin: const EdgeInsets.only(top: 20),
      decoration: kHederDecoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
           Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: ShaderMask(
              shaderCallback: (bounds) {
                return LinearGradient(
                  colors: [
                    Color(0xFFC471ED),
                    Color(0xFF12C2E9),
                    Color(0xFFF64F59),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height));
              },
              blendMode: BlendMode.srcIn,
              child: Text(
                "Kaushik_  ",
                style: TextStyle(
                  fontSize: 20,
                  height: 1.5,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(width: 60),
          Row(
            children: List.generate(navTitles.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(right: 0),
                child: TextButton(
                  onPressed: () => onNavMenuTap(index),
                  child: Text(
                    navTitles[index],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: page == index
                          ? Colors.amberAccent
                          : CustomColor.whitePrimary,
                      decoration: page == index
                          ? TextDecoration.underline
                          : TextDecoration.none,
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
