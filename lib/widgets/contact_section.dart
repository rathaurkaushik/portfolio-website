import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:js' as js;
import 'package:portfolio_website/constant/colors.dart';
import 'package:portfolio_website/constant/sns_links.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth < 500
            ? 20
            : screenWidth < 900
            ? 60
            : 160, // Responsive horizontal padding
        vertical: 20,
      ),
      child: Card(
        elevation: 3,
        color: CustomColor.bgLight1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: CustomColor.bgLight1,
            borderRadius: BorderRadius.circular(40),
          ),
          padding: const EdgeInsets.fromLTRB(25, 40, 25, 60),
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 900) {
                return _buildDesktopLayout();
              } else if (constraints.maxWidth > 600) {
                return _buildTabletLayout();
              } else {
                return _buildMobileLayout();
              }
            },
          ),
        ),
      ),
    );
  }

  /// Desktop Layout
  Widget _buildDesktopLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left Content
        Flexible(
          flex: 2,
          child: _contactDetails(),
        ),
        // Right Content (Mailbox image)
        Flexible(
          flex: 1,
          child: Image.asset("assets/mail_box.png", fit: BoxFit.contain),
        ),
      ],
    );
  }

  /// Tablet Layout
  Widget _buildTabletLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 2, child: _contactDetails()),
        const SizedBox(width: 20),
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 200,
            child: Image.asset("assets/mail_box.png", fit: BoxFit.contain),
          ),
        ),
      ],
    );
  }

  /// Mobile Layout
  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 180,
          child: Image.asset("assets/mail_box.png", fit: BoxFit.contain),
        ),
        _contactDetails(),
      ],
    );
  }

  /// Contact Details (reused for desktop/tablet/mobile)
  Widget _contactDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _gradientTitle("Get in touch"),
        const SizedBox(height: 16),
        Text(
          "If you have any queries or would like to discuss potential opportunities,\nplease don't hesitate to reach out to me using the given links:",
          style: GoogleFonts.openSans(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white70,
          ),
        ),
        const SizedBox(height: 15),
        const Divider(thickness: 1),
        const SizedBox(height: 20),
        Wrap(
          spacing: 20,
          runSpacing: 12,
          children: [
            _snsIcon(
              "assets/mail.png",
              SnsLinks.email,
              "@Kaushik",
              Colors.redAccent,
            ), // Gmail red
            _snsIcon(
              "assets/linkedin.png",
              SnsLinks.linkedIn,
              "Kaushik-dev",
              Color(0xFF0A66C2),
            ), // LinkedIn blue
            _snsIcon(
              "assets/github.png",
              SnsLinks.github,
              "#Kaushik",
              Colors.white,
            ), // GitHub white
            _snsIcon(
              "assets/instagram.png",
              SnsLinks.instagram,
              "@Kaushik_15",
              Colors.pinkAccent,
            ), // Instagram pink
          ],
        ),
      ],
    );
  }

  /// Social Icon Widget
  static Widget _snsIcon(
      String assetPath,
      String url,
      String text,
      Color textColor,
      ) {
    return InkWell(
      onTap: () => js.context.callMethod('open', [url]),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(assetPath, width: 26),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }

  /// Gradient Title
  Widget _gradientTitle(String text) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: [Colors.cyan, Colors.purpleAccent, Colors.yellowAccent],
      ).createShader(bounds),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
