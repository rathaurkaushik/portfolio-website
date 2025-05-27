import 'package:flutter/material.dart';
import 'dart:js' as js;

class SnsLink extends StatefulWidget {
  final String url;
  final String text;

  const SnsLink({
    super.key,
    required this.url,
    required this.text,
  });

  @override
  _SnsLinkState createState() => _SnsLinkState();
}

class _SnsLinkState extends State<SnsLink> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: InkWell(
          onTap: () {
            js.context.callMethod('open', [widget.url]);
          },
          child: Stack( // Using Stack for layering
            alignment: Alignment.center, // Center the content within the stack
            children: [
              // 1. Gradient Background (the "spill" effect)
              Container(
                // Adjust size slightly larger than the actual button content
                // to create the "overflow" effect.
                width: _isHovering ? null : 200, // Example: Larger width on hover or fixed
                height: _isHovering ? null : 60, // Example: Larger height on hover or fixed
                constraints: const BoxConstraints(
                  minWidth: 180, // Minimum width for the button
                  minHeight: 55, // Minimum height for the button
                ),
                padding: const EdgeInsets.all(8.0), // Padding for the gradient overflow effect
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), // Slightly larger border radius for background
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft, // Consistent with header gradient
                    end: Alignment.bottomRight, // Consistent with header gradient
                    colors: [
                      // The four colors from your main background image
                      Color(0xFF2E2F33), // Dark grey/blue
                      Color(0xFF5B3C7B), // Purplish
                      Color(0xFF4C6B8D), // Bluish
                      Color(0xFF7E6B5A), // Brownish/darker orange
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      spreadRadius: 3,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
              ),

              // 2. Foreground Content (the actual button shape and text)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), // Rounded corners for the visible button
                  color: Colors.black.withOpacity(0.6), // A slightly translucent dark background for the button itself
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min, // Keep the row compact
                  children: [
                    ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: [Colors.cyanAccent, Colors.purpleAccent, Colors.amberAccent],
                      ).createShader(bounds),
                      child: Text(
                        widget.text,
                        style: const TextStyle(
                          fontSize: 20,
                          fontFamily: 'Aptos',
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // This color will be masked by the shader
                        ),
                      ),
                    ),
                    if (_isHovering) ...[
                      const SizedBox(width: 10),
                      Row(
                        children: const [
                          Text(
                            'Check my awesome repo',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 4),
                          Icon(Icons.star, color: Colors.amber, size: 18),
                        ],
                      ),
                    ]
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}