import 'package:ava_take_home_project/utils/app_colors.dart';
import 'package:flutter/material.dart';

class UShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = acIndigo
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height * 0.67) // Covering 2/3 of the height
      ..quadraticBezierTo(0, size.height * 0.75, size.width * 0.1,
          size.height * 0.75,) // Small curve at the bottom corner
      ..lineTo(
          size.width * 0.9, size.height * 0.75,) // Straight line at the bottom
      ..quadraticBezierTo(
        size.width,
        size.height * 0.75,
        size.width,
        size.height *
            0.67, // Small curve at the bottom corner on the other side
      )
      ..lineTo(size.width, 0) // Long straight line up the other side
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
