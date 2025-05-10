import 'package:flutter/material.dart';

class DirectionalDivider extends StatefulWidget {
  final String direction; // Accepts 'left' or 'right'

  const DirectionalDivider({Key? key, this.direction = 'left'})
      : assert(direction == 'left' || direction == 'right'),
        super(key: key);

  @override
  State<DirectionalDivider> createState() => _DirectionalDividerState();
}

class _DirectionalDividerState extends State<DirectionalDivider>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _linePosition;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
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
    double totalWidth = 100;

    return SizedBox(
      height: 40,
      width: totalWidth,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedBuilder(
            animation: _linePosition,
            builder: (context, child) {
              double animatedPos =
                  _linePosition.value * (totalWidth - 70); // Avoid overflow

              return Positioned(
                left: widget.direction == 'right' ? animatedPos : null,
                right: widget.direction == 'left' ? animatedPos : null,
                child: Container(
                  width: 70,
                  height: 2,
                  color: Colors.white,
                ),
              );
            },
          ),

          // Optional: Arrow icon
          // Positioned(
          //   left: widget.direction == 'left' ? 0 : null,
          //   right: widget.direction == 'right' ? 0 : null,
          //   child: Icon(
          //     widget.direction == 'left'
          //         ? Icons.keyboard_arrow_left
          //         : Icons.keyboard_arrow_right,
          //     color: Colors.grey[400],
          //     size: 28,
          //   ),
          // ),
        ],
      ),
    );
  }
}
