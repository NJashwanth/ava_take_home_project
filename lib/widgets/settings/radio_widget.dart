import 'package:flutter/material.dart';

class AvaRadioButton extends StatelessWidget {
  final String title;
  final String value;
  final String groupValue;
  final void Function(String?)? onChanged;

  const AvaRadioButton({
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Radio(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
        Text(title),
      ],
    );
  }
}
