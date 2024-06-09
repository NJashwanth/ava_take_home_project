import 'package:ava_take_home_project/models/credit_account_model.dart';
import 'package:ava_take_home_project/utils/app_colors.dart';
import 'package:ava_take_home_project/utils/app_styles.dart';
import 'package:ava_take_home_project/widgets/home/animated_linear_progress_bar_widget.dart';
import 'package:flutter/material.dart';

class OpenAccountWidget extends StatelessWidget {
  final CreditAccountModel creditAccount;
  const OpenAccountWidget({required this.creditAccount, super.key, required});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(creditAccount.name, style: atAtHaussSemiBold16Black),
              Text(
                '${utiliztionPercentage(creditAccount.balance, creditAccount.limit)}%',
                style: atAtHaussSemiBold16Black,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: AnimatedLinearProgressBarWidget(
              width: 287,
              height: 8,
              shouldDisplayDot: false,
              activeColor: acGreen,
              activePosition: calculateDotPosition(
                  creditAccount.balance, creditAccount.limit, 287,),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${creditAccount.balance} Balance',
                style: atAtHaussRegular14Black,
              ),
              Text(
                '\$${creditAccount.limit} Limit',
                textAlign: TextAlign.right,
                style: atAtHaussRegular14Black,
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'Reported on June 20, 2023',
            style: atAtHaussRegular12Grey,
          ),
        ],
      ),
    );
  }

  String utiliztionPercentage(double balance, double limit) {
    return ((balance / limit) * 100).toStringAsFixed(0);
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
