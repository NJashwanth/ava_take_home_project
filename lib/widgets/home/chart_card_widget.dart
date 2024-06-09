import 'package:ava_take_home_project/models/credit_score_model.dart';
import 'package:ava_take_home_project/utils/app_styles.dart';
import 'package:ava_take_home_project/widgets/home/chart_widget.dart';
import 'package:ava_take_home_project/widgets/home/credit_score_details_widget.dart';
import 'package:flutter/material.dart';

class ChartCardWidget extends StatelessWidget {
  final List<CreditScoreModel> creditScoreList;
  const ChartCardWidget({
    required this.creditScoreList, super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: 343,
        height: 261,
        padding: const EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
          bottom: 12,
        ),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: Colors.black.withOpacity(0.15000000596046448),
            ),
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CreditScoreDetailsWidget(),
            ChartWidget(creditScoreList:creditScoreList),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Last 12 months',
              textAlign: TextAlign.center,
              style: atAtHaussSemiBold12Black,
            ),
            const Text(
              'Score calculated using VantageScore 3.0',
              textAlign: TextAlign.center,
              style: atAtHaussRegular12Grey,
            ),
          ],
        ),
      ),
    );
  }
}
