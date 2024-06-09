import 'package:ava_take_home_project/models/credit_account_model.dart';
import 'package:ava_take_home_project/widgets/home/open_account_widget.dart';
import 'package:flutter/material.dart';

class OpenAccountsListWidget extends StatelessWidget {
  final List<CreditAccountModel> creditAccounts;
  const OpenAccountsListWidget({
    required this.creditAccounts,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        width: double.infinity,
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.black.withOpacity(0.15000000596046448),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) =>
              OpenAccountWidget(creditAccount: creditAccounts[index]),
          separatorBuilder: (context, index) => Divider(
            color: Colors.black.withOpacity(0.15000000596046448),
            thickness: 1,
          ),
          itemCount: creditAccounts.length,
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
