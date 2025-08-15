import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedWaveAvatar extends StatefulWidget {
  final double size;
  final ImageProvider image;
  final double amplitude;
  final double secondaryAmp;
  final int lobes;
  final Duration duration;
  final double strokeWidth;

  const AnimatedWaveAvatar({
    super.key,
    required this.size,
    required this.image,
    this.amplitude = 10,
    this.secondaryAmp = 5,
    this.lobes = 1,
    this.duration = const Duration(seconds: 10),
    this.strokeWidth = 4,
  });

  @override
  State<AnimatedWaveAvatar> createState() => _AnimatedWaveAvatarState();
}

class _AnimatedWaveAvatarState extends State<AnimatedWaveAvatar>
    with SingleTickerProviderStateMixin {
  late AnimationController _waveController;

  @override
  void initState() {
    super.initState();
    _waveController =
    AnimationController(vsync: this, duration: widget.duration)
      ..repeat();
  }

  @override
  void dispose() {
    _waveController.dispose();
    super.dispose();
  }

  Path _wavePath(Size size, double t) {
    final path = Path();
    final r = size.width / 2;
    final cx = size.width / 2;
    final cy = size.height / 2;

    path.moveTo(cx + r, cy);
    for (int i = 0; i <= 360; i++) {
      final theta = i * pi / 180;
      final baseRadius = r - widget.strokeWidth / 2;
      final wave = sin(widget.lobes * theta + t) * widget.amplitude;
      final wave2 =
          sin(widget.lobes * 2 * theta - t * 1.5) * widget.secondaryAmp;
      final radius = baseRadius + wave + wave2;
      final x = cx + radius * cos(theta);
      final y = cy + radius * sin(theta);
      path.lineTo(x, y);
    }
    path.close();
    return path;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: _waveController,
        builder: (context, _) {
          final t = _waveController.value * 2 * pi;

          return Stack(
            children: [
              // Image clipped with wave path
              ClipPath(
                clipper: _WaveClipper(
                  path: _wavePath(Size(widget.size, widget.size), t),
                ),
                child: Image(
                  image: widget.image,
                  fit: BoxFit.cover,
                  width: widget.size,
                  height: widget.size,
                ),
              ),

              // White border
              CustomPaint(
                size: Size(widget.size, widget.size),
                painter: _WaveBorderPainter(
                  path: _wavePath(Size(widget.size, widget.size), t),
                  strokeWidth: widget.strokeWidth,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _WaveBorderPainter extends CustomPainter {
  final Path path;
  final double strokeWidth;

  _WaveBorderPainter({
    required this.path,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _WaveBorderPainter oldDelegate) =>
      oldDelegate.path != path;
}

class _WaveClipper extends CustomClipper<Path> {
  final Path path;
  _WaveClipper({required this.path});

  @override
  Path getClip(Size size) => path;

  @override
  bool shouldReclip(covariant _WaveClipper oldClipper) => true;
}

