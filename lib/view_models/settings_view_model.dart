import 'package:ava_take_home_project/models/settings_model.dart';
import 'package:ava_take_home_project/providers/mock_repository_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsViewModel extends StateNotifier<AsyncValue<SettingsModel>> {
  final bool isEditMode;
  final Ref ref;

  SettingsViewModel({
    required this.isEditMode,
    required this.ref,
  }) : super(const AsyncValue.loading()) {
    loadData();
  }

  final TextEditingController employerController = TextEditingController();
  final TextEditingController jobTitleController = TextEditingController();
  final TextEditingController annualIncomeController = TextEditingController();
  final TextEditingController nextPayDayController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  late SettingsModel initialData;
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    employerController.dispose();
    jobTitleController.dispose();
    annualIncomeController.dispose();
    nextPayDayController.dispose();
    addressController.dispose();
    super.dispose();
  }

  Future<void> loadData() async {
    initialData =
        await ref.read(mockRepositoryProvider).getinitialSettingsModel();
    setEmployer(initialData.employer);
    setJobTitle(initialData.jobTitle);
    setAnnualIncome(initialData.annualIncome);
    setNextPayDay(initialData.nextPayDay);
    setAddress(initialData.address);
    state = AsyncValue.data(initialData);
  }

  void setEmployer(String employer) => employerController.text = employer;
  void setJobTitle(String jobTitle) => jobTitleController.text = jobTitle;
  void setAnnualIncome(String annualIncome) =>
      annualIncomeController.text = annualIncome;
  void setNextPayDay(String nextPayDay) =>
      nextPayDayController.text = nextPayDay;
  void setAddress(String address) => addressController.text = address;
  void clear() {
    employerController.clear();
    jobTitleController.clear();
    annualIncomeController.clear();
    nextPayDayController.clear();
    addressController.clear();
  }

  void navigateToEdit(BuildContext context) {
    Navigator.pushNamed(context, '/settings/edit');
  }

  void onEmploymentTypeChanged(String? newValue) {
    initialData = initialData.copyWith(employementType: newValue);
    state = AsyncValue.data(initialData);
  }

  void onPayFrequencyChanged(String? newValue) {
    initialData = initialData.copyWith(payFrequency: newValue);
    state = AsyncValue.data(initialData);
  }

  void onYearsWithEmployerChanged(String? newValue) {
    initialData = initialData.copyWith(yearsWithEmployer: newValue);
    state = AsyncValue.data(initialData);
  }

  void onMonthsWithEmployerChanged(String? newValue) {
    initialData = initialData.copyWith(monthsWithEmployer: newValue);
    state = AsyncValue.data(initialData);
  }

  void onPayDirectDepositChanged(String? newValue) {
    initialData = initialData.copyWith(isDirectDeposit: newValue);
    state = AsyncValue.data(initialData);
  }

  void saveData() {
    if (formKey.currentState!.validate()) {
      //
    }
  }

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      '/',
      (route) => false,
      arguments: {'fromSettings': true},
    );
  }
}
