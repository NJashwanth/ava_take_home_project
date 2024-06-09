
import 'package:flutter/material.dart';

class ArrowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.deepPurple
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(size.width * 0.25, 0); // Start from 1/4 width
    path.lineTo(size.width / 2, size.height); // Draw to center bottom
    path.lineTo(size.width * 0.75, 0); // Draw to 3/4 width
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
