import 'package:ava_take_home_project/utils/app_styles.dart';
import 'package:flutter/material.dart';

class HeadingWidget extends StatelessWidget {
  final String label;

  const HeadingWidget({required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24,
        right: 8,
        bottom: 8,
        top: 16,
      ),
      child: Text(
        label,
        style: atAtHaussSemiBold20Black,
      ),
    );
  }
}
