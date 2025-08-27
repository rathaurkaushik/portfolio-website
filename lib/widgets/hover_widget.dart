import 'package:flutter/material.dart';

class HoverImageCard extends StatefulWidget {
  final String imagePath;
  final double height;
  final double width;
  final Color borderColor;

  const HoverImageCard({
    required this.imagePath,
    required this.height,
    required this.width,
    required this.borderColor,
  });

  @override
  State<HoverImageCard> createState() => _HoverImageCardState();
}

class _HoverImageCardState extends State<HoverImageCard> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: AnimatedSlide(
        offset: _isHovering ? const Offset(0, -0.02) : Offset.zero,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: widget.borderColor, width: 1.5),
          ),
          clipBehavior: Clip.antiAlias,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              widget.imagePath,
              height: widget.height,
              width: widget.width,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
