import 'package:flutter/material.dart';

import '../styles/style.dart';
import 'site_logo.dart';

class HeaderMobile extends StatelessWidget {
  const HeaderMobile({
    super.key,
    this.onLogoTap,
    this.onMenuTap,
  });
  final VoidCallback? onLogoTap;
  final VoidCallback? onMenuTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      margin: const EdgeInsets.fromLTRB(40, 5, 20, 5),
      decoration: kHederDecoration,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SiteLogo(
            onTap: onLogoTap,
          ),
const Spacer(),
          Text(
            " Kaushik_  ",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
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
                ).createShader(Rect.fromLTWH(200, 50, 50, 35)),
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: onMenuTap,
            icon: const Icon(Icons.menu),
          ),
          const SizedBox(width: 15),
        ],
      ),
    );
  }
}
