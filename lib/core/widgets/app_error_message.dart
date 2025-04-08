import 'package:flutter/material.dart';
import 'package:trick_crm_app/core/helpers/spacing.dart';
import 'package:trick_crm_app/core/widgets/app_button.dart';

Widget appErrorMessage(String? message, Function()? onPressedRetry) {
  return Center(
    child: Column(
      children: [
        const Text('An error occurred, Try again'),
        spacingV(10),
        const Icon(
          Icons.error,
          color: Colors.red,
        ),
        spacingV(10),
        const Text('Please check your internet connection'),
        spacingV(10),
        const Text('Or try again later'),
        spacingV(10),
        const Text('If the problem persists, contact support'),
        spacingV(10),
        Text('Error: $message'),
        spacingV(10),
        Padding(
          padding: const EdgeInsets.all(16),
          child: AppButton(
            text: 'Retry',
            onPressed: onPressedRetry ?? () {},
          ),
        ),
      ],
    ),
  );
}
