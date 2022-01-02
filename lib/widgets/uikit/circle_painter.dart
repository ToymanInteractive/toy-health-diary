import 'package:flutter/rendering.dart';

class CirclePainter extends CustomPainter {
  final double width;
  final Color color;

  const CirclePainter({
    required this.width,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = width * 0.5
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width * 0.5, paint);
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) {
    return width != oldDelegate.width || color != oldDelegate.color;
  }
}
