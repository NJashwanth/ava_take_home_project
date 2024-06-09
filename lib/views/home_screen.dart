import 'package:ava_take_home_project/providers/home_provider.dart';
import 'package:ava_take_home_project/utils/app_colors.dart';
import 'package:ava_take_home_project/utils/app_styles.dart';
import 'package:ava_take_home_project/widgets/home/chart_card_widget.dart';
import 'package:ava_take_home_project/widgets/home/credit_factor_card_widget.dart';
import 'package:ava_take_home_project/widgets/home/credit_score_card_widget.dart';
import 'package:ava_take_home_project/widgets/home/heading_widget.dart';
import 'package:ava_take_home_project/widgets/home/open_accounts_list_widget.dart';
import 'package:ava_take_home_project/widgets/home/spend_limit_widget.dart';
import 'package:ava_take_home_project/widgets/home/total_balance_card_card.dart';
import 'package:ava_take_home_project/widgets/settings/bottom_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final arguments = ModalRoute.of(context)?.settings.arguments as Map?;
      if (arguments != null && arguments['fromSettings'] == true) {
        _showFeedbackBottomSheet(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final homeModelAsync = ref.watch(homeViewModelProvider);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: homeModelAsync.when(
          data: (homeModel) => SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    // CustomPaint(
                    //   size: Size(
                    //     MediaQuery.of(context).size.width,
                    //     300, // height you want for the custom paint
                    //   ),
                    //   painter: UShapePainter(),
                    // ),
                    Container(
                      decoration: const BoxDecoration(
                        color: acIndigo,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppBar(
                            centerTitle: true,
                            forceMaterialTransparency: true,
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            leading: IconButton(
                              icon: const Icon(
                                Icons.settings,
                                color: acWhite,
                                size: 20,
                              ),
                              onPressed: () => navigateToHome(context),
                            ),
                            title: const Text(
                              'Home',
                              style: atAtHaussSemiBold16White,
                            ),
                          ),
                          CreditScoreCardWidget(
                            creditScore: homeModel.creditScore,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const HeadingWidget(label: 'Chart'),
                ChartCardWidget(
                  creditScoreList: homeModel.creditScoreList,
                ),
                const HeadingWidget(label: 'Credit factors'),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    bottom: 24,
                  ),
                  child: SizedBox(
                    height: 160,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 8,
                      ),
                      itemBuilder: (context, index) => CreditFactorCardWidget(
                        creditFactor: homeModel.creditFactorsList[index],
                      ),
                      itemCount: homeModel.creditFactorsList.length,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
                const HeadingWidget(label: 'Account Details'),
                SpendLimitWidget(
                  creditLimit: homeModel.creditLimit,
                  balance: homeModel.balance,
                  utilization: homeModel.utilization,
                  spendLimit: homeModel.spendLimit,
                ),
                const SizedBox(height: 8),
                TotalBalanceCardWidget(
                  totalBalance: homeModel.totlaBalance,
                  totalLimit: homeModel.totalLimit,
                ),
                const HeadingWidget(label: 'Open credit card accounts'),
                OpenAccountsListWidget(
                  creditAccounts: homeModel.creditAccounts,
                ),
              ],
            ),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(child: Text('Error: $error')),
        ),
      ),
    );
  }

  void navigateToHome(BuildContext context) {
    Navigator.pushNamed(context, '/settings/view');
  }

  void _showFeedbackBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      isScrollControlled: true,
      builder: (context) => Container(
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: const FeedbackBottomSheet(),
        ),
      ),
    );
  }
}
