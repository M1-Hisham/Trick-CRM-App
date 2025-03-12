import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/resources/resources.dart';
import '../../../core/widgets/app_bar.dart';
import '../../../core/widgets/app_button.dart';
import 'widget/meetings_data_bloc_builder.dart';

class MeetingsScreen extends StatelessWidget {
  const MeetingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Meetings'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            AppButton(
              icon: SvgPicture.asset(R.icons.add),
              text: 'Create Meeting',
              onPressed: () {},
            ),
            spacingV(20),
            const MeetingsDataBlocBuilder(),
          ],
        ),
      ),
    );
  }
}
