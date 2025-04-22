import 'package:flutter/material.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/resources/resources.dart';

Widget loadingSubscriptionScreen() {
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: R.colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            width: 0.8,
            color: R.colors.secGray,
          ),
          boxShadow: [
            BoxShadow(
              color: R.colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Subscription Details'),
              spacingV(40),
              const Text('Subscription Plan'),
              const Text(''),
              spacingV(40),
              const Text('Start Date'),
              const Text(''),
              spacingV(40),
              const Text('Periodicity'),
              const Text(''),
              spacingV(40),
              const Text('Expiration Date'),
              const Text(''),
              spacingV(40),
              const Text('User Balance:'),
              const Text(""),
              spacingV(40),
              const Text('Created At'),
              const Text(''),
              spacingV(40),
            ],
          ),
        ),
      ),
    ],
  );
}
