import 'package:ava_take_home_project/models/credeit_factors_model.dart';
import 'package:ava_take_home_project/models/enums/credit_factor_impact_enum.dart';
import 'package:ava_take_home_project/utils/app_colors.dart';
import 'package:ava_take_home_project/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CreditFactorCardWidget extends StatelessWidget {
  final CreditFactorsModel creditFactor;
  const CreditFactorCardWidget({required this.creditFactor, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 144,
      height: 160,
      padding: const EdgeInsets.only(
        top: 24,
        left: 16,
        right: 16,
        bottom: 16,
      ),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Colors.black.withOpacity(0.15000000596046448),
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 108,
                child: Text(
                  creditFactor.title,
                  textAlign: TextAlign.center,
                  style: atAtHaussSemiBold14Black,
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: 108,
                child: Text(
                  creditFactor.value.toString(),
                  textAlign: TextAlign.center,
                  style: atAtHaussSemiBold22Indigo,
                ),
              ),
            ],
          ),
          Container(
            width: 112,
            height: 27,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: ShapeDecoration(
              color: fetchColor(creditFactor.impact),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: Text(
              creditFactor.impact.name,
              textAlign: TextAlign.center,
              style: atInterBold11White.copyWith(
                letterSpacing: 0.55,
                color: creditFactor.impact==CreditFactorImpactEnum.low?acBlack:acWhite,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color fetchColor(CreditFactorImpactEnum impact) {
    switch (impact) {
      case CreditFactorImpactEnum.high:
        return acDarkGreen;
      case CreditFactorImpactEnum.medium:
        return acGreen;
      case CreditFactorImpactEnum.low:
        return acLightGreen;
    }
  }
}
