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
      width: MediaQuery.of(context).size.width * 0.7,
      height: 40.0,
      // margin: const EdgeInsets.symmetric(
      //   vertical: 10.0,
      //   horizontal: 20.0,
      // ),
      decoration: kHederDecoration,
      margin: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Kaushik_  ",
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Aptos',
              height: 1.5,
              fontWeight: FontWeight.bold,
              foreground: Paint()
                ..shader = const LinearGradient(
                  colors: [
                    Color(0xFFC471ED),
                    Color(0xFF12C2E9),
                    Color(0xFFF64F59),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(Rect.fromLTWH(400, 250, 100,50)),

            ),
          ),
          // SiteLogo(
          //   onTap: () {
          //   },
          // ),
          SizedBox(width:  60,),
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
        ],
      ),
    );
  }
}
