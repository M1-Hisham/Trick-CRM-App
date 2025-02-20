import 'package:flutter/material.dart';
import 'package:trick_crm_app/core/helpers/spacing.dart';
import 'package:trick_crm_app/core/widgets/app_bar.dart';

import '../../../../core/resources/resources.dart';

class EmailsScreen extends StatelessWidget {
  const EmailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Emails'),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Emails',
              style: R.textStyles.font17PrimaryW600,
            ),
            Card(
                child: Column(
              children: [
                const Text('Total Number: 0'),
                spacingV(20),
                // Show Emails Data Table
              ],
            )),
          ],
        ),
      ),
    );
  }
}
