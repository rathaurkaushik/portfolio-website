import 'package:flutter/material.dart';
import 'dart:math';

import 'package:portfolio_website/constant/colors.dart';

class WavingHandIcon extends StatefulWidget {
  const WavingHandIcon({super.key});

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
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);

    _rotation = Tween<double>(begin: -0.2, end: 0.1).animate(
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
            size: 70,
          ),
        );
      },
    );
  }
}
