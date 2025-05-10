import 'package:flutter/material.dart';

class DrawArrowAnimated extends StatefulWidget {
  const DrawArrowAnimated({Key? key}) : super(key: key);

  @override
  State<DrawArrowAnimated> createState() => _DrawArrowAnimated();
}

class _DrawArrowAnimated extends State<DrawArrowAnimated>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _linePosition;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..repeat();

    _linePosition = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double totalHeight = 80;

    return SizedBox(
      height: totalHeight,
      width: 40,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          // Static grey line
          // Positioned(
          //   top: 0,
          //   child: Container(
          //     width: 2,
          //     height: totalHeight,
          //     color: Colors.grey[700],
          //   ),
          // ),

          // Moving white line segment (animation)
          AnimatedBuilder(
            animation: _linePosition,
            builder: (context, child) {
              return Positioned(
                top
                    : _linePosition.value * 90,
                child: Container(
                  width: 2,
                  height: 80, // Length of animated segment
                  color: Colors.white,
                ),
              );
            },
          ),

          // Arrow icon at the bottom
          Positioned(
            bottom: -10,
            child: Icon(
              Icons.keyboard_arrow_down,
              color: Colors.grey[400],
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}
