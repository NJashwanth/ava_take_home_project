// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ava_take_home_project/models/enums/credit_factor_impact_enum.dart';

class CreditFactorsModel {
  final String title;
  final String value;
  final CreditFactorImpactEnum impact;

  CreditFactorsModel({
    required this.title,
    required this.value,
    required this.impact,
  });

  factory CreditFactorsModel.fromJson(Map<String, dynamic> json) {
    return CreditFactorsModel(
      title: json['title'] as String,
      value: json['value'] as String,
      impact: json['impact'] as CreditFactorImpactEnum,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'value': value,
      'impact': impact,
    };
  }

  @override
  String toString() =>
      'CreditFactorsModel(title: $title, value: $value, impact: $impact)';
}
