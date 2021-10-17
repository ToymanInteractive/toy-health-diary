import 'dart:math';

import 'package:flutter/rendering.dart';

class CirclePainter extends CustomPainter {
  final double width;
  final Color color;

  const CirclePainter({
    required this.width,
    this.color = const Color(0xFF000000),
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = width
      ..style = PaintingStyle.stroke;

    canvas.drawArc(Offset.zero & size, 0, pi * 2, false, paint);
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) {
    return width != oldDelegate.width || color != oldDelegate.color;
  }
}
