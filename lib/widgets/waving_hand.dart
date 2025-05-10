import 'package:flutter/material.dart';
import 'dart:math';

import 'package:portfolio_website/constant/colors.dart';

class WavingHandIcon extends StatefulWidget {
  final double handSize;
  const WavingHandIcon({super.key, required this.handSize});

  @override
  State<WavingHandIcon> createState() => _WavingHandIconState();
}

class _WavingHandIconState extends State<WavingHandIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..repeat(reverse: true);

    _rotation = Tween<double>(begin: -0.2, end: 0.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _rotation,
      builder: (context, child) {
        return Transform.rotate(
          angle: _rotation.value,
          alignment: Alignment.bottomCenter,
          child: Icon(
            Icons.waving_hand,
            color: CustomColor.handToneColor,
            size: widget.handSize,
          ),
        );
      },
    );
  }
}
