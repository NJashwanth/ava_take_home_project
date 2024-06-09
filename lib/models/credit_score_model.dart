// ignore_for_file: public_member_api_docs, sort_constructors_first

class CreditScoreModel {
  final String creditScore;
  final String monthNumber;

  CreditScoreModel({
    required this.creditScore,
    required this.monthNumber,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'creditScore': creditScore,
      'monthNumber': monthNumber,
    };
  }

  factory CreditScoreModel.fromJson(Map<String, dynamic> map) {
    return CreditScoreModel(
      creditScore: map['creditScore'] as String,
      monthNumber: map['monthNumber'] as String,
    );
  }

  @override
  String toString() =>
      'CreditScoreModel(creditScore: $creditScore, monthNumber: $monthNumber)';
}
