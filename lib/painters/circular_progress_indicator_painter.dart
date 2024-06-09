
import 'dart:math';

import 'package:ava_take_home_project/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CircularIndicatorPainter extends CustomPainter {
  final double percentage;

  CircularIndicatorPainter(this.percentage);

  @override
  void paint(Canvas canvas, Size size) {
    const lineWidth = 10.0;
    final radius = (size.width / 2) - lineWidth / 2;
    final center = Offset(size.width / 2, size.height / 2);

    // Draw the background circle
    final backgroundPaint = Paint()
      ..color = acLightGreen
      ..style = PaintingStyle.stroke
      ..strokeWidth = lineWidth;
    canvas.drawCircle(center, radius, backgroundPaint);

    // Draw the progress arc
    final progressPaint = Paint()
      ..color = acGreen
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = lineWidth;
    final sweepAngle = 2 * pi * percentage;
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        sweepAngle, false, progressPaint,);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}