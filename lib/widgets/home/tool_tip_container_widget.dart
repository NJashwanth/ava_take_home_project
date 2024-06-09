import 'package:ava_take_home_project/painters/arrow_painter.dart';
import 'package:ava_take_home_project/utils/app_colors.dart';
import 'package:ava_take_home_project/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ToolTipContainerWidget extends StatelessWidget {
  final String lable;
  const ToolTipContainerWidget({required this.lable, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: acWhite,
      child: Column(
        children: [
          Container(
            width: 100,
            height: 60,
            decoration: BoxDecoration(
              color: acIndigo,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                '\$$lable',
                style: atAtHaussRegular14WhiteShade,
              ),
            ),
          ),
          CustomPaint(
            size: const Size(20, 10),
            painter: ArrowPainter(),
          ),
        ],
      ),
    );
  }
}
