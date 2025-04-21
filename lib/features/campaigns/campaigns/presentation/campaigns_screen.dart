import 'package:flutter/material.dart';

import '../../../../core/widgets/app_bar.dart';
import 'widgets/campaigns_data_bloc_builder.dart';

class CampaignsScreen extends StatelessWidget {
  const CampaignsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Campaigns'),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: CampaignsDataBlocBuilder(),
          ),
        ),
      ),
    );
  }
}
