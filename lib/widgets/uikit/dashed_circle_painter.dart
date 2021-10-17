import 'dart:math';

import 'package:flutter/rendering.dart';

class DashedCirclePainter extends CustomPainter {
  final Color color;
  final int dashes;
  final double gapSize;
  final double strokeWidth;

  DashedCirclePainter({
    required this.color,
    required this.dashes,
    required this.gapSize,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final gap = pi / 180 * gapSize;
    final singleAngle = (pi * 2) / dashes;

    for (var index = 0; index < dashes; ++index) {
      final paint = Paint()
        ..color = color
        ..strokeWidth = strokeWidth
        ..style = PaintingStyle.stroke;

      canvas.drawArc(
        Offset.zero & size,
        gap + singleAngle * index,
        singleAngle - gap * 2,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(DashedCirclePainter oldDelegate) {
    return dashes != oldDelegate.dashes || color != oldDelegate.color;
  }
}
