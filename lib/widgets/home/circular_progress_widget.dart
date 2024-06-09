import 'package:ava_take_home_project/painters/circular_progress_indicator_painter.dart';
import 'package:ava_take_home_project/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CircularProgressIndicatingWidget extends StatefulWidget {
  final String title;
  final String subTitle;
  final double value;
  const CircularProgressIndicatingWidget({
    required this.title,
    required this.subTitle,
    required this.value,
    super.key,
  });

  @override
  State<CircularProgressIndicatingWidget> createState() =>
      CircularProgressIndicatingWidgetState();
}

class CircularProgressIndicatingWidgetState
    extends State<CircularProgressIndicatingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  String get title => widget.title;
  String get subTitle => widget.subTitle;
  double get value => widget.value;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: value).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(100.0, 100.0),
      foregroundPainter: CircularIndicatorPainter(_animation.value),
      child: SizedBox(
        width: 90.0,
        height: 90.0,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: atAtSlamCndSemiBold25Black,
              ),
              Text(
                subTitle,
                textAlign: TextAlign.center,
                style: atAtHaussSemiBold8Black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
