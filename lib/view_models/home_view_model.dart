import 'package:ava_take_home_project/models/home_model.dart';
import 'package:ava_take_home_project/providers/mock_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeViewModel extends StateNotifier<AsyncValue<HomeModel>> {
  final Ref ref;

  HomeViewModel(this.ref) : super(const AsyncValue.loading()) {
    _fetchHomeData();
  }

  Future<void> _fetchHomeData() async {
    try {
      final creditScore =
          await ref.read(mockRepositoryProvider).getCreditScore();
      final creditScoreList =
          await ref.read(mockRepositoryProvider).fetchCreditScoreList();
      final creditFactorsList =
          await ref.read(mockRepositoryProvider).fetchCreditFactors();
      final creditLimit =
          await ref.read(mockRepositoryProvider).getCreditLimit();
      final spendLimit = await ref.read(mockRepositoryProvider).getSpendLimit();
      final balance = await ref.read(mockRepositoryProvider).getBalance();
      final utilization = calculateUtilizationPercentage(balance, creditLimit);
      final totalBalance =
          await ref.read(mockRepositoryProvider).getTotalBalance();
      final totalLimit = await ref.read(mockRepositoryProvider).getTotalLimit();
      final creditAccounts =
          await ref.read(mockRepositoryProvider).fetchCreditAccounts();

      state = AsyncValue.data(
        HomeModel(
          creditScore: creditScore,
          creditScoreList: creditScoreList,
          creditFactorsList: creditFactorsList,
          creditLimit: creditLimit,
          balance: balance,
          utilization: utilization,
          totlaBalance: totalBalance,
          totalLimit: totalLimit,
          creditAccounts: creditAccounts,
          spendLimit: spendLimit,
        ),
      );
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
      rethrow;
    }
  }

  double calculateUtilizationPercentage(double balance, double totalLimit) {
    if (totalLimit == 0) {
      return 0.0;
    }

    final utilizationPercentage = (balance / totalLimit) * 100;

    return utilizationPercentage.roundToDouble();
  }
}
