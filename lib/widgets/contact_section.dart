import 'package:flutter/material.dart';
import 'dart:js' as js;
import 'package:portfolio_website/constant/colors.dart';
import 'package:portfolio_website/constant/sns_links.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(100),
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
              return constraints.maxWidth > 600
                  ? _buildDesktopLayout()
                  : _buildMobileLayout();
            },
          ),
        ),
      ),
    );
  }

  /// Desktop Layout
  Widget _buildDesktopLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Left Content
        Flexible(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _gradientTitle("Get in touch"),
              const SizedBox(height: 16),
              const Text(
                "If you have any queries or would like to discuss potential opportunities,\nplease don't hesitate to reach out to me using the given links:",
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
              const SizedBox(height: 20),
              const Divider(thickness: 1),
              const SizedBox(height: 20),
              Row(
                children: [
                  _snsIcon("assets/github.png", SnsLinks.github, "#Kaushik"),
                  const SizedBox(width: 16),
                  _snsIcon("assets/linkedin.png", SnsLinks.linkedIn, "Kaushik-dev"),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  _snsIcon("assets/instagram.png", SnsLinks.instagram, "@Kaushik_15"),
                  const SizedBox(width: 16),
                  _snsIcon("assets/mail.png", SnsLinks.email, "@Kaushik"),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 30),
        // Right Content (Mailbox image)
        Flexible(
          flex: 1,
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.asset(
              "assets/mail_box.png",
              fit: BoxFit.contain,
            ),
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
        _gradientTitle("Get in touch"),
        const SizedBox(height: 16),
        const Text(
          "If you have any queries or would like to discuss potential opportunities, please don't hesitate to reach out to me using the given links:",
          style: TextStyle(fontSize: 14, color: Colors.white70),
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 20),
        const Divider(thickness: 1),
        const SizedBox(height: 20),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          alignment: WrapAlignment.start,
          children: [
            _snsIcon("assets/mail.png", SnsLinks.email, "@Kaushik"),
            _snsIcon("assets/linkedin.png", SnsLinks.linkedIn, "Kaushik-dev"),
            _snsIcon("assets/github.png", SnsLinks.github, "#Kaushik"),
            _snsIcon("assets/instagram.png", SnsLinks.instagram, "@Kaushik_15"),
          ],
        ),
        const SizedBox(height: 30),
        Center(
          child: SizedBox(
            height: 180,
            child: Image.asset(
              "assets/mail_box.png",
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }

  /// Social Icon Widget
  static Widget _snsIcon(String assetPath, String url, String text) {
    return InkWell(
      onTap: () {
        js.context.callMethod('open', [url]);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(assetPath, width: 28),
          const SizedBox(width: 8),
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Colors.cyan, Colors.purple],
            ).createShader(bounds),
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
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
        colors: [Colors.cyan, Colors.purple],
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
