import 'package:ava_take_home_project/utils/app_colors.dart';
import 'package:ava_take_home_project/utils/app_styles.dart';
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final void Function() onTap;

  const SecondaryButton({required this.onTap, super.key});

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
          color: acWhite,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 2, color: acIndigo),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          'Edit',
          textAlign: TextAlign.center,
          style: atAtHaussSemiBold16White.copyWith(color: acIndigo),
        ),
      ),
    );
  }
}
