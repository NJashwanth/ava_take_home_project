// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SettingsModel {
  final String employementType;
  final String employer;
  final String jobTitle;
  final String annualIncome;
  final String nextPayDay;
  final String payFrequency;
  final String address;
  final String isDirectDeposit;
  final String yearsWithEmployer;
  final String monthsWithEmployer;

  SettingsModel({
    required this.employementType,
    required this.employer,
    required this.jobTitle,
    required this.annualIncome,
    required this.nextPayDay,
    required this.payFrequency,
    required this.address,
    required this.isDirectDeposit,
    required this.yearsWithEmployer,
    required this.monthsWithEmployer,
  });

  SettingsModel copyWith({
    String? employementType,
    String? employer,
    String? jobTitle,
    String? annualIncome,
    String? nextPayDay,
    String? payFrequency,
    String? address,
    String? isDirectDeposit,
    String? yearsWithEmployer,
    String? monthsWithEmployer,
  }) {
    return SettingsModel(
      employementType: employementType ?? this.employementType,
      employer: employer ?? this.employer,
      jobTitle: jobTitle ?? this.jobTitle,
      annualIncome: annualIncome ?? this.annualIncome,
      nextPayDay: nextPayDay ?? this.nextPayDay,
      payFrequency: payFrequency ?? this.payFrequency,
      address: address ?? this.address,
      isDirectDeposit: isDirectDeposit ?? this.isDirectDeposit,
      yearsWithEmployer: yearsWithEmployer ?? this.yearsWithEmployer,
      monthsWithEmployer: monthsWithEmployer ?? this.monthsWithEmployer,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'employementType': employementType,
      'employer': employer,
      'jobTitle': jobTitle,
      'annualIncome': annualIncome,
      'nextPayDay': nextPayDay,
      'payFrequency': payFrequency,
      'address': address,
      'isDirectDeposit': isDirectDeposit,
      'yearsWithEmployer': yearsWithEmployer,
      'monthsWithEmployer': monthsWithEmployer,
    };
  }

  factory SettingsModel.fromMap(Map<String, dynamic> map) {
    return SettingsModel(
      employementType: map['employementType'] as String,
      employer: map['employer'] as String,
      jobTitle: map['jobTitle'] as String,
      annualIncome: map['annualIncome'] as String,
      nextPayDay: map['nextPayDay'] as String,
      payFrequency: map['payFrequency'] as String,
      address: map['address'] as String,
      isDirectDeposit: map['isDirectDeposit'] as String,
      yearsWithEmployer: map['yearsWithEmployer'] as String,
      monthsWithEmployer: map['monthsWithEmployer'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SettingsModel.fromJson(String source) => SettingsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SettingsModel(employementType: $employementType, employer: $employer, jobTitle: $jobTitle, annualIncome: $annualIncome, nextPayDay: $nextPayDay, payFrequency: $payFrequency, address: $address, isDirectDeposit: $isDirectDeposit, yearsWithEmployer: $yearsWithEmployer, monthsWithEmployer: $monthsWithEmployer)';
  }

  @override
  bool operator ==(covariant SettingsModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.employementType == employementType &&
      other.employer == employer &&
      other.jobTitle == jobTitle &&
      other.annualIncome == annualIncome &&
      other.nextPayDay == nextPayDay &&
      other.payFrequency == payFrequency &&
      other.address == address &&
      other.isDirectDeposit == isDirectDeposit &&
      other.yearsWithEmployer == yearsWithEmployer &&
      other.monthsWithEmployer == monthsWithEmployer;
  }

  @override
  int get hashCode {
    return employementType.hashCode ^
      employer.hashCode ^
      jobTitle.hashCode ^
      annualIncome.hashCode ^
      nextPayDay.hashCode ^
      payFrequency.hashCode ^
      address.hashCode ^
      isDirectDeposit.hashCode ^
      yearsWithEmployer.hashCode ^
      monthsWithEmployer.hashCode;
  }
}
