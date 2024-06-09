import 'package:ava_take_home_project/utils/app_colors.dart';
import 'package:ava_take_home_project/utils/app_styles.dart';
import 'package:ava_take_home_project/widgets/home/animated_linear_progress_bar_widget.dart';
import 'package:flutter/material.dart';

class SpendLimitWidget extends StatefulWidget {
  final double creditLimit;
  final double balance;
  final double utilization;
  final double spendLimit;

  const SpendLimitWidget({
    required this.creditLimit,
    required this.balance,
    required this.utilization,
    required this.spendLimit,
    super.key,
  });

  @override
  State<SpendLimitWidget> createState() => _AccountDetailsWidgetState();
}

class _AccountDetailsWidgetState extends State<SpendLimitWidget>
    with TickerProviderStateMixin {
  double get utilization => widget.utilization;
  double get balance => widget.balance;
  double get creditLimit => widget.creditLimit;
  double get spendLimit => widget.spendLimit;

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
        height: 225,
        padding: const EdgeInsets.only(
          top: 16,
          left: 20,
          right: 20,
          bottom: 8,
        ),
        decoration: ShapeDecoration(
          color: acWhite,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: acBlack.withOpacity(0.15000000596046448),
            ),
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        child: Column(
          children: [
            AnimatedLinearProgressBarWidget(
              width: 303,
              height: 8,
              shouldDisplayDot: true,
              dotPosition: calculateDotPosition(balance, spendLimit, 303),
              activeColor: acLightGreen,
              dotValue: balance.toStringAsFixed(0),
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Spend limit: \$$spendLimit ',
                    style: atAtHaussRegular14Black,
                  ),
                  const TextSpan(
                    text: 'Why is it different?',
                    style: atAtHaussSemiBold14Violet,
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\$$balance',
                      style: atAtHaussSemiBold16Black,
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Balance',
                      style: atAtHaussRegular14Black,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '\$$creditLimit',
                      style: atAtHaussSemiBold16Black,
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Credit limit',
                      style: atAtHaussRegular14Black,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            Divider(
              color: Colors.black.withOpacity(0.15000000596046448),
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Utilization',
                    style: atAtHaussSemiBold16Black,
                  ),
                  Text(
                    '$utilization%',
                    style: atAtHaussSemiBold16Black,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  double calculateDotPosition(
    double currentSpend,
    double totalLimit,
    double width,
  ) {
    final spendPercentage = currentSpend / totalLimit;

    var dotPosition = spendPercentage * width;

    dotPosition = dotPosition.clamp(0, width);

    return dotPosition;
  }
}
