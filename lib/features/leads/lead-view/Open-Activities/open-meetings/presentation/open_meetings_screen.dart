import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trick_crm_app/core/helpers/spacing.dart';
import 'package:trick_crm_app/core/widgets/app_button.dart';

import '../../../../../../core/resources/resources.dart';
import '../../../../../../core/widgets/app_bar.dart';

class OpenMeetingsScreen extends StatelessWidget {
  const OpenMeetingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Open Meetings'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppButton(
              icon: SvgPicture.asset(R.icons.add),
              text: 'Create a New Meeting',
              onPressed: () {},
            ),
            spacingV(20),
            Text(
              'Open Meetings',
              style: R.textStyles.font17PrimaryW600,
            ),
          ],
        ),
      ),
    );
  }
}
