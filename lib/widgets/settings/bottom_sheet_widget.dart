import 'package:ava_take_home_project/utils/app_colors.dart';
import 'package:ava_take_home_project/widgets/settings/primary_button.dart';
import 'package:flutter/material.dart';

class FeedbackBottomSheet extends StatelessWidget {
  const FeedbackBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      child: SingleChildScrollView(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 32,
                decoration: const BoxDecoration(
                  color: acVioletShade,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              padding: const EdgeInsets.fromLTRB(16.0, 40.0, 16.0, 24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Give us feedback',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: 'It’s been very helpful so far!',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 12.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  PrimaryButton(
                    onTap: () {},
                    text: 'Submit Feedback',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
