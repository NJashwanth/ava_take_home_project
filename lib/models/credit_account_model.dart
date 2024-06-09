// ignore_for_file: public_member_api_docs, sort_constructors_first

class CreditAccountModel {
  String name;
  double balance;
  double limit;
  double utilization;
  DateTime reportedDate;

  CreditAccountModel({
    required this.name,
    required this.balance,
    required this.limit,
    required this.utilization,
    required this.reportedDate,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'balance': balance,
      'limit': limit,
      'utilization': utilization,
      'reportedDate': reportedDate.millisecondsSinceEpoch,
    };
  }

  factory CreditAccountModel.fromJson(Map<String, dynamic> map) {
    return CreditAccountModel(
      name: map['name'] as String,
      balance: map['balance'] as double,
      limit: map['limit'] as double,
      utilization: map['utilization'] as double,
      reportedDate:
          DateTime.fromMillisecondsSinceEpoch(map['reportedDate'] as int),
    );
  }

  @override
  String toString() {
    return 'CreditAccountModel(name: $name, balance: $balance, limit: $limit, utilization: $utilization, reportedDate: $reportedDate)';
  }
}
