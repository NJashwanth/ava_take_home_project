import 'package:ava_take_home_project/utils/app_colors.dart';
import 'package:ava_take_home_project/utils/app_styles.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final void Function() onTap;
  final String text;
  const PrimaryButton({required this.onTap, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 44,
        width: double.infinity,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
        decoration: ShapeDecoration(
          color: acIndigo,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: atAtHaussSemiBold16White,
        ),
      ),
    );
  }
}
