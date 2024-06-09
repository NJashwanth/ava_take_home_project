
import 'package:ava_take_home_project/providers/settings_provider.dart';
import 'package:ava_take_home_project/utils/app_colors.dart';
import 'package:ava_take_home_project/utils/app_styles.dart';
import 'package:ava_take_home_project/widgets/settings/date_time_picker.dart';
import 'package:ava_take_home_project/widgets/settings/dropdown_widget.dart';
import 'package:ava_take_home_project/widgets/settings/info_widget.dart';
import 'package:ava_take_home_project/widgets/settings/primary_button.dart';
import 'package:ava_take_home_project/widgets/settings/radio_widget.dart';
import 'package:ava_take_home_project/widgets/settings/secondary_button.dart';
import 'package:ava_take_home_project/widgets/settings/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  final bool isEdit;
  const SettingsScreen(this.isEdit, {super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  // SettingsModel? initialData;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel = widget.isEdit
          ? ref.read(settingsEditModeModelProvider.notifier)
          : ref.read(settingsViewModeModelProvider.notifier);
      viewModel.loadData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = widget.isEdit
        ? ref.read(settingsEditModeModelProvider.notifier)
        : ref.read(settingsViewModeModelProvider.notifier);

    final viewModelAsyncValue = widget.isEdit
        ? ref.watch(settingsEditModeModelProvider)
        : ref.watch(settingsViewModeModelProvider);
    return Scaffold(
      backgroundColor: acWhiteShade,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: acWhiteShade,
      ),
      body: viewModelAsyncValue.when(
        data: (initialData) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: viewModel.formKey,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (viewModel.isEditMode)
                              Text(
                                'Edit employment information',
                                style: atAtSlamCndSemiBold25Black.copyWith(
                                  fontSize: 40,
                                ),
                              )
                            else ...[
                              Text(
                                'Confirm your employment',
                                style: atAtSlamCndSemiBold25Black.copyWith(
                                  fontSize: 40,
                                ),
                              ),
                              Text(
                                'Please review and confirm the below employment details are up-to-date.',
                                style: atAtHaussRegular14Grey.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                            AvaDropdownWidget(
                              labelText: 'Employement Type',
                              isEnable: viewModel.isEditMode,
                              items: const [
                                'Full-time',
                                'Part-time',
                                'Self-employed',
                              ],
                              value: viewModel.initialData.employementType,
                              onChanged: (String? newValue) =>
                                  viewModel.onEmploymentTypeChanged(newValue),
                            ),
                            AvaTextFormField(
                              formLabel: 'Job Title',
                              labelText: 'Job Title',
                              controller: viewModel.jobTitleController,
                              isEnable: viewModel.isEditMode,
                            ),
                            AvaTextFormField(
                              formLabel: 'Employer',
                              labelText: 'Employer',
                              controller: viewModel.employerController,
                              isEnable: viewModel.isEditMode,
                            ),
                            AvaTextFormField(
                              formLabel: 'Gross Annual Income',
                              labelText: 'Gross Annual Income',
                              controller: viewModel.annualIncomeController,
                              isEnable: viewModel.isEditMode,
                            ),
                            AvaDropdownWidget(
                              labelText: 'Pay Frequency',
                              isEnable: viewModel.isEditMode,
                              items: const ['Bi-weekly', 'Weekly', 'Monthly'],
                              value: viewModel.initialData.payFrequency,
                              onChanged: (String? newValue) =>
                                  viewModel.onPayFrequencyChanged(newValue),
                            ),
                            DateTimeFormField(
                              formLabel: 'My Next Payday',
                              labelText: 'My Next Payday',
                              controller: viewModel.nextPayDayController,
                              isEnable: viewModel.isEditMode,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2101),
                            ),
                            if (viewModel.isEditMode)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Is Your Pay Direct Deposit?',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      AvaRadioButton(
                                        value: 'Yes',
                                        groupValue: initialData.isDirectDeposit,
                                        onChanged: (p0) => viewModel
                                            .onPayDirectDepositChanged(p0),
                                        title: 'Yes',
                                      ),
                                      AvaRadioButton(
                                        value: 'No',
                                        groupValue: initialData.isDirectDeposit,
                                        onChanged: (p0) => viewModel
                                            .onPayDirectDepositChanged(p0),
                                        title: 'No',
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            else
                              const InfoWidget(
                                label: 'Is your pay a direct deposit?',
                                value: 'Yes',
                              ),
                            AvaTextFormField(
                              formLabel: '',
                              labelText: 'Employer Address',
                              controller: viewModel.addressController,
                              isEnable: viewModel.isEditMode,
                              maxLines: 3,
                            ),
                            if (viewModel.isEditMode)
                              Text(
                                'Time with employer',
                                style:
                                    atAtHaussRegular12Grey.copyWith(height: 0),
                              ),
                            if (viewModel.isEditMode)
                              Row(
                                children: [
                                  Expanded(
                                    child: AvaDropdownWidget(
                                      labelText: '',
                                      value: initialData.yearsWithEmployer,
                                      isEnable: viewModel.isEditMode,
                                      items: List.generate(
                                        31,
                                        (index) => '${index + 1} years',
                                      ).toList(),
                                      onChanged: (String? newValue) => viewModel
                                          .onYearsWithEmployerChanged(newValue),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Expanded(
                                    child: AvaDropdownWidget(
                                      labelText: '',
                                      isEnable: viewModel.isEditMode,
                                      value: initialData.monthsWithEmployer,
                                      items: List.generate(
                                        13,
                                        (index) => '$index months',
                                      ).toList(),
                                      onChanged: (String? newValue) =>
                                          viewModel.onMonthsWithEmployerChanged(
                                              newValue,),
                                    ),
                                  ),
                                ],
                              )
                            else
                              InfoWidget(
                                label: 'Time with employer',
                                value:
                                    '${initialData.yearsWithEmployer} ${initialData.monthsWithEmployer} ',
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (!viewModel.isEditMode)
                    SecondaryButton(
                      onTap: () => viewModel.navigateToEdit(context),
                    ),
                  const SizedBox(height: 8),
                  PrimaryButton(
                    onTap: () => saveData(context),
                    text: !viewModel.isEditMode ? 'Confirm' : 'Continue',
                  ),
                ],
              ),
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }

  void saveData(BuildContext context) {
    if (widget.isEdit) {
      ref.read(settingsEditModeModelProvider.notifier).saveData();
    } else {
      ref.read(settingsViewModeModelProvider.notifier).navigateToHome(context);
      
    }
  }
}
