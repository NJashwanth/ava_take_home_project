import 'package:ava_take_home_project/utils/app_colors.dart';
import 'package:ava_take_home_project/widgets/settings/info_widget.dart';
import 'package:flutter/material.dart';

class AvaDropdownWidget extends StatelessWidget {
  final String labelText;
  final bool isEnable;
  final List<String> items;
  final String? value;
  final void Function(String?)? onChanged;

  const AvaDropdownWidget({
    required this.labelText,
    required this.isEnable,
    required this.items,
    super.key,
    this.value,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (!isEnable) ...[
          InfoWidget(label: labelText, value: value ?? ''),
        ] else ...[
          Text(
            labelText,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          DropdownButtonFormField<String>(
            items: items.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            value: value,
            onChanged: onChanged,
            decoration: const InputDecoration(
              border: InputBorder.none,
              fillColor: acWhite,
              filled: true,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            ),
          ),
        ],
      ],
    );
  }
}
