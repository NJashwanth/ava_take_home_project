import 'package:ava_take_home_project/utils/app_colors.dart';
import 'package:ava_take_home_project/widgets/home/tool_tip_container_widget.dart';
import 'package:flutter/material.dart';

class AnimatedLinearProgressBarWidget extends StatefulWidget {
  final bool shouldDisplayDot;
  final double width;
  final double height;
  final double? dotPosition;
  final Color activeColor;
  final double? activePosition;
  final String? dotValue;

  const AnimatedLinearProgressBarWidget({
    required this.shouldDisplayDot,
    required this.width,
    required this.height,
    required this.activeColor,
    this.dotPosition,
    this.activePosition,
    this.dotValue,
    super.key,
  });

  @override
  State<AnimatedLinearProgressBarWidget> createState() =>
      _AnimatedLinearProgressBarWidgetState();
}

class _AnimatedLinearProgressBarWidgetState
    extends State<AnimatedLinearProgressBarWidget>
    with TickerProviderStateMixin {
  late AnimationController _activeLineController;
  late AnimationController _dotController;
  late Animation<double> _activeLineAnimation;
  late Animation<double> _dotAnimation;

  // access the properties of the widget
  bool get shouldDisplayDot => widget.shouldDisplayDot;
  double get width => widget.width;
  double get height => widget.height;
  double? get dotPosition => widget.dotPosition;
  Color get activeColor => widget.activeColor;
  double? get activePosition => widget.activePosition;
  String? get $dotValue => widget.dotValue;

  @override
  void initState() {
    super.initState();

    _activeLineController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _dotController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _activeLineAnimation = Tween<double>(begin: 0, end: activePosition ?? width)
        .animate(_activeLineController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          if (shouldDisplayDot) _dotController.forward();
        }
      });

    if (shouldDisplayDot) {
      _dotAnimation =
          Tween<double>(begin: 0, end: dotPosition).animate(_dotController);
    }

    _activeLineController.forward();
  }

  @override
  void dispose() {
    _activeLineController.dispose();
    _dotController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: AnimatedBuilder(
        animation: _activeLineAnimation,
        builder: (context, child) {
          return Stack(
            children: [
              Container(
                height: height,
                width: width,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              Container(
                height: height,
                width: _activeLineAnimation.value,
                decoration: BoxDecoration(
                  color: activeColor,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              if (shouldDisplayDot)
                AnimatedBuilder(
                  animation: _dotAnimation,
                  builder: (context, child) {
                    return Stack(
                      children: [
                        Container(
                          height: height,
                          width: width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        Positioned(
                          left: _dotAnimation.value - 15,
                          child: Tooltip(
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                            ),
                            richMessage:  WidgetSpan(
                              alignment: PlaceholderAlignment.baseline,
                              baseline: TextBaseline.alphabetic,
                              child: ToolTipContainerWidget(
                                lable: $dotValue!,
                              ),
                            ),
                            triggerMode: TooltipTriggerMode.tap,
                            preferBelow: false,
                            child: Container(
                              height: height,
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: acGreen,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
            ],
          );
        },
      ),
    );
  }
}
