import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  final String label;
  final String value;
  const InfoWidget({required this.label, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
     return Padding(
       padding: const EdgeInsets.symmetric(vertical:8.0),
       child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: const TextStyle(fontSize: 18),
          ),
        ],
           ),
     );
  }

   
}