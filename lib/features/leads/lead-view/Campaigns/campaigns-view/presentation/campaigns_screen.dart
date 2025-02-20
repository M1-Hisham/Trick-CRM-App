import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/resources/resources.dart';
import '../../../../../../core/widgets/app_bar.dart';
import '../../../../../../core/widgets/app_button.dart';
import '../../create-campaigns/presentation/add_campaign.dart';

class CampaignsScreen extends StatelessWidget {
  const CampaignsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Campaigns'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppButton(
              icon: SvgPicture.asset(R.icons.add),
              text: 'Add Campaigns',
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const AddCampaign();
                  },
                );
              },
            ),
            spacingV(20),
            Text(
              'Campaigns',
              style: R.textStyles.font17PrimaryW600,
            ),
            spacingV(10),
            // const AppDataTable(
            //   data: [],
            //   headers: [
            //     'Campaign Name',
            //     'Type',
            //     'Campaign Status',
            //     'Start date',
            //     'End date',
            //     'Status',
            //     'Actions',
            //   ],
            //   dataExtractors: [],
            // ),
          ],
        ),
      ),
    );
  }
}
