import 'package:ava_take_home_project/utils/app_colors.dart';
import 'package:ava_take_home_project/utils/app_styles.dart';
import 'package:ava_take_home_project/widgets/settings/info_widget.dart';
import 'package:flutter/material.dart';

class AvaTextFormField extends StatelessWidget {
  final String formLabel;
  final String labelText;
  final TextEditingController controller;
  final bool isEnable;
  final int? maxLines;

  const AvaTextFormField({
    required this.formLabel,
    required this.labelText,
    required this.controller,
    required this.isEnable,
    this.maxLines,
    super.key,
  });

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
              maxLines: maxLines,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '$formLabel is required';
                }
                return null;
              },
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(
                  left: 8,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
