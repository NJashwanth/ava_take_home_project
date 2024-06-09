import 'package:ava_take_home_project/utils/app_colors.dart';
import 'package:ava_take_home_project/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CreditScoreDetailsWidget extends StatelessWidget {
  const CreditScoreDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Credit Score',
                    style: atAtHaussSemiBold16Black,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                    width: 50,
                    height: 20,
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    alignment: Alignment.center,
                    decoration: ShapeDecoration(
                      color: acGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                    child: const Text(
                      '+2pts',
                      style: atAtHaussSemiBold14White,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 2,
              ),
              const Text(
                'Updated Today | Next May 12',
                style: atAtHaussRegular14Grey,
              ),
            ],
          ),
          const Text(
            'Experian',
            style: atAtHaussSemiBold12Violet,
          ),
        ],
      ),
    );
  }
}
