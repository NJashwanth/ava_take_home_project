import 'package:ava_take_home_project/utils/app_colors.dart';
import 'package:ava_take_home_project/utils/app_styles.dart';
import 'package:flutter/material.dart';

class PercentageBarwidget extends StatelessWidget {
  const PercentageBarwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 303,
          height: 80,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 24,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 101,
                      height: 24,
                      decoration: const ShapeDecoration(
                        color: acGreen,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4),
                            bottomLeft: Radius.circular(4),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 101,
                      height: 24,
                      decoration: const BoxDecoration(
                        color: acCreamShade,
                      ),
                    ),
                    Container(
                      width: 101,
                      height: 24,
                      decoration: const ShapeDecoration(
                        color: acPink,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(4),
                            bottomRight: Radius.circular(4),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                top: 10,
                child: SizedBox(
                  width: 74,
                  child: Text(
                    'Excellent',
                    textAlign: TextAlign.center,
                    style: atAtHaussSemiBold12Green.copyWith(
                      height: 0.11,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 0,
                top: 52,
                child: SizedBox(
                  height: 28,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 4),
                      SizedBox(
                        width: 48,
                        child: Text(
                          '0-9%',
                          style: atAtHaussSemiBold12Green,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(left: 56, top: 52, child: Container()),
              const Positioned(
                left: 269,
                top: 52,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(height: 4),
                    SizedBox(
                      width: 34,
                      child: Text(
                        '<75%',
                        textAlign: TextAlign.right,
                        style: atAtHaussRegular12Grey,
                      ),
                    ),
                  ],
                ),
              ),
              const Positioned(
                left: 202,
                top: 52,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 4),
                    SizedBox(
                      width: 48,
                      child: Text(
                        '50-74%',
                        style: atAtHaussRegular12Grey,
                      ),
                    ),
                  ],
                ),
              ),
              const Positioned(
                left: 127,
                top: 52,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 4),
                    SizedBox(
                      width: 48,
                      child: Text(
                        '30-49%',
                        textAlign: TextAlign.center,
                        style: atAtHaussRegular12Grey,
                      ),
                    ),
                  ],
                ),
              ),
              const Positioned(
                left: 56,
                top: 52,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(height: 4),
                    SizedBox(
                      width: 45,
                      child: Text(
                        '10-29%',
                        textAlign: TextAlign.right,
                        style: atAtHaussRegular12Grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
