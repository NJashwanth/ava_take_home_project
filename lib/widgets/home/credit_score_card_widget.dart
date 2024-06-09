import 'package:ava_take_home_project/utils/app_colors.dart';
import 'package:ava_take_home_project/widgets/home/circular_progress_widget.dart';
import 'package:ava_take_home_project/widgets/home/credit_score_details_widget.dart';
import 'package:flutter/material.dart';

class CreditScoreCardWidget extends StatelessWidget {
  final int creditScore;

  const CreditScoreCardWidget({required this.creditScore, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 20,
      ),
      child: Container(
        width: 335,
        height: 104,
        padding: const EdgeInsets.all(16),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: acWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CreditScoreDetailsWidget(),
            Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicatingWidget(
                  subTitle: 'Good',
                  title: creditScore.toString(),
                  value: creditScore / 850,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
