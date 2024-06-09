import 'package:ava_take_home_project/utils/app_styles.dart';
import 'package:ava_take_home_project/widgets/home/circular_progress_widget.dart';
import 'package:ava_take_home_project/widgets/home/percentage_bar_widget.dart';
import 'package:flutter/material.dart';

class TotalBalanceCardWidget extends StatelessWidget {
  final double totalLimit;
  final double totalBalance;
  const TotalBalanceCardWidget({
    required this.totalLimit,
    required this.totalBalance,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 8,
      ),
      child: Container(
        width: 343,
        // height: 196,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Total balance: ',
                            style: atAtHaussSemiBold16Black,
                          ),
                          TextSpan(
                            text: '\$$totalBalance',
                            style: atAtHaussSemiBold16Green,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      'Total limit: \$${totalLimit.toStringAsFixed(0)}',
                      style: atAtHaussRegular14Grey,
                    ),
                  ],
                ),
                CircularProgressIndicatingWidget(
                  title:
                      '${calculateUtilizationPercentage(totalBalance, totalLimit).toStringAsFixed(0)}%',
                  subTitle: 'Excellent',
                  value: totalBalance / totalLimit,
                ),
              ],
            ),
            const PercentageBarwidget(),
          ],
        ),
      ),
    );
  }

  double calculateUtilizationPercentage(
      double totalBalance, double totalLimit,) {
    // Ensure totalLimit is not zero to avoid division by zero error
    if (totalLimit == 0) {
      return 0.0;
    }

    // Calculate utilization percentage
    final utilizationPercentage = (totalBalance / totalLimit) * 100;

    // Round to two decimal places
    return utilizationPercentage;
  }
}
