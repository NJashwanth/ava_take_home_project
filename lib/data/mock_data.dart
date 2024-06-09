import 'package:ava_take_home_project/models/credeit_factors_model.dart';
import 'package:ava_take_home_project/models/credit_account_model.dart';
import 'package:ava_take_home_project/models/credit_score_model.dart';
import 'package:ava_take_home_project/models/enums/credit_factor_impact_enum.dart';
import 'package:ava_take_home_project/models/settings_model.dart';

class MockRepository {
  Future<List<CreditScoreModel>> fetchCreditScoreList() async {
    return [
      CreditScoreModel(creditScore: '600', monthNumber: '1'),
      CreditScoreModel(creditScore: '615', monthNumber: '2'),
      CreditScoreModel(creditScore: '630', monthNumber: '3'),
      CreditScoreModel(creditScore: '650', monthNumber: '4'),
      CreditScoreModel(creditScore: '635', monthNumber: '5'),
      CreditScoreModel(creditScore: '650', monthNumber: '6'),
      CreditScoreModel(creditScore: '660', monthNumber: '7'),
      CreditScoreModel(creditScore: '670', monthNumber: '8'),
      CreditScoreModel(creditScore: '700', monthNumber: '9'),
      CreditScoreModel(creditScore: '705', monthNumber: '10'),
      CreditScoreModel(creditScore: '705', monthNumber: '11'),
      CreditScoreModel(creditScore: '705', monthNumber: '12'),
    ];
  }

  Future<List<CreditFactorsModel>> fetchCreditFactors() async {
    return [
      CreditFactorsModel(
        title: 'Payment History',
        value: '100%',
        impact: CreditFactorImpactEnum.high,
      ),
      CreditFactorsModel(
        title: 'Credit Card Utilization',
        value: '4%',
        impact: CreditFactorImpactEnum.low,
      ),
      CreditFactorsModel(
        title: 'Derogatory Marks',
        value: '2',
        impact: CreditFactorImpactEnum.medium,
      ),
      CreditFactorsModel(
        title: 'Age of Credit History',
        value: '12',
        impact: CreditFactorImpactEnum.low,
      ),
      CreditFactorsModel(
        title: 'Hard Inquiries',
        value: '3',
        impact: CreditFactorImpactEnum.medium,
      ),
      CreditFactorsModel(
        title: 'Total Accounts',
        value: '9',
        impact: CreditFactorImpactEnum.medium,
      ),
    ];
  }

  Future<List<CreditAccountModel>> fetchCreditAccounts() async {
    return [
      CreditAccountModel(
        name: 'Chase Freedom',
        balance: 1000,
        limit: 5000,
        utilization: 0.2,
        reportedDate: DateTime.now(),
      ),
      CreditAccountModel(
        name: 'Discover It',
        balance: 2000,
        limit: 10000,
        utilization: 0.2,
        reportedDate: DateTime.now(),
      ),
      CreditAccountModel(
        name: 'Capital One',
        balance: 1000,
        limit: 15000,
        utilization: 0.2,
        reportedDate: DateTime.now(),
      ),
    ];
  }

  Future<int> getCreditScore() async {
    // Mock implementation
    return Future.value(700);
  }

  Future<double> getCreditLimit() async {
    // Mock implementation
    return Future.value(5000.0);
  }

  Future<double> getBalance() async {
    // Mock implementation
    return Future.value(750.0);
  }

  Future<double> getTotalBalance() async {
    // Mock implementation
    return Future.value(1500.0);
  }

  Future<double> getTotalLimit() async {
    // Mock implementation
    return Future.value(5000.0);
  }

  Future<double> getSpendLimit() async {
    return Future.value(2000.0);
  }

  Future<SettingsModel> getinitialSettingsModel() {
    return Future.value(
      SettingsModel(
        employementType: 'Full-time',
        employer: 'Google',
        jobTitle: 'Software Engineer',
        annualIncome: '100000',
        nextPayDay: 'Sept 22nd, 2023 (Friday)',
        payFrequency: 'Bi-weekly',
        address: '1234 Main St, San Francisco, CA 94111',
        isDirectDeposit: 'Yes',
        yearsWithEmployer: '1 years',
        monthsWithEmployer: '0 months',
      ),
    );
  }
}
