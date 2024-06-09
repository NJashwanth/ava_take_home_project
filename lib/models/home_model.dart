// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ava_take_home_project/models/credeit_factors_model.dart';
import 'package:ava_take_home_project/models/credit_account_model.dart';
import 'package:ava_take_home_project/models/credit_score_model.dart';

class HomeModel {
  int creditScore;
  List<CreditScoreModel> creditScoreList;
  List<CreditFactorsModel> creditFactorsList;
  double creditLimit;
  double balance;
  double utilization;
  double spendLimit;
  double totlaBalance;
  double totalLimit;
  List<CreditAccountModel> creditAccounts;

  HomeModel({
    required this.creditScore,
    required this.creditScoreList,
    required this.creditFactorsList,
    required this.creditLimit,
    required this.balance,
    required this.utilization,
    required this.totlaBalance,
    required this.totalLimit,
    required this.creditAccounts,
    required this.spendLimit,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      creditScore: json['creditScore'] as int,
      creditScoreList: (json['creditScoreList'] as List)
          .map((e) => CreditScoreModel.fromJson(e))
          .toList(),
      creditFactorsList: (json['creditFactorsList'] as List)
          .map((e) => CreditFactorsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      creditLimit: (json['creditLimit'] as num).toDouble(),
      balance: (json['balance'] as num).toDouble(),
      utilization: (json['utilization'] as num).toDouble(),
      totlaBalance: (json['totlaBalance'] as num).toDouble(),
      totalLimit: (json['totalLimit'] as num).toDouble(),
      creditAccounts: (json['creditAccounts'] as List)
          .map((e) => CreditAccountModel.fromJson(e))
          .toList(),
      spendLimit: (json['spendLimit'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'creditScore': creditScore,
      'creditScoreList': creditScoreList.map((e) => e.toJson()).toList(),
      'creditFactorsList': creditFactorsList.map((e) => e.toJson()).toList(),
      'creditLimit': creditLimit,
      'balance': balance,
      'utilization': utilization,
      'totlaBalance': totlaBalance,
      'totalLimit': totalLimit,
      'creditAccounts': creditAccounts.map((e) => e.toJson()).toList(),
      'spendLimit': spendLimit,
    };
  }

  HomeModel copyWith({
    int? creditScore,
    List<CreditScoreModel>? creditScoreList,
    List<CreditFactorsModel>? creditFactorsList,
    double? creditLimit,
    double? balance,
    double? utilization,
    double? totlaBalance,
    double? totalLimit,
    List<CreditAccountModel>? creditAccounts,
    double? spendLimit,
  }) {
    return HomeModel(
      creditScore: creditScore ?? this.creditScore,
      creditScoreList: creditScoreList ?? this.creditScoreList,
      creditFactorsList: creditFactorsList ?? this.creditFactorsList,
      creditLimit: creditLimit ?? this.creditLimit,
      balance: balance ?? this.balance,
      utilization: utilization ?? this.utilization,
      totlaBalance: totlaBalance ?? this.totlaBalance,
      totalLimit: totalLimit ?? this.totalLimit,
      creditAccounts: creditAccounts ?? this.creditAccounts,
      spendLimit: spendLimit ?? this.spendLimit,
    );
  }
}
