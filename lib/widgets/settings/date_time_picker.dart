import 'package:ava_take_home_project/utils/app_colors.dart';
import 'package:ava_take_home_project/utils/app_styles.dart';
import 'package:ava_take_home_project/widgets/settings/info_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeFormField extends StatelessWidget {
  final String formLabel;
  final String labelText;
  final TextEditingController controller;
  final bool isEnable;
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;

  DateTimeFormField({
    required this.formLabel,
    required this.labelText,
    required this.controller,
    required this.isEnable,
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
    super.key,
  })  : initialDate = initialDate ?? DateTime.now(),
        firstDate = firstDate ?? DateTime(2000),
        lastDate = lastDate ?? DateTime(2101);

  String formatDate(DateTime date) {
    final monthDayYearFormat = DateFormat('MMM d');
    final yearFormat = DateFormat('yyyy');
    final weekdayFormat = DateFormat('EEEE');

    String daySuffix(int day) {
      if (day >= 11 && day <= 13) {
        return 'th';
      }
      switch (day % 10) {
        case 1:
          return 'st';
        case 2:
          return 'nd';
        case 3:
          return 'rd';
        default:
          return 'th';
      }
    }

    return '${monthDayYearFormat.format(date)}${daySuffix(date.day)}, ${yearFormat.format(date)} (${weekdayFormat.format(date)})';
  }

  @override
  Widget build(BuildContext context) {
    if (!isEnable) return InfoWidget(label: labelText, value: controller.text);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: atAtHaussSemiBold14Black,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: acWhite,
            ),
            child: TextFormField(
              controller: controller,
              readOnly: true,
              decoration: const InputDecoration(
                border: InputBorder.none,
                suffixIcon: Icon(Icons.calendar_today),
              ),
              onTap: () async {
                final pickedDate = await showDatePicker(
                  context: context,
                  initialDate: initialDate,
                  firstDate: firstDate,
                  lastDate: lastDate,
                );
                if (pickedDate != null) {
                  controller.text = formatDate(pickedDate);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
