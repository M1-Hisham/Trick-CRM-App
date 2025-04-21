import 'package:flutter/material.dart';

import '../../../../../../../core/widgets/app_bar.dart';
import '../widget/notes_campaign_data_bloc_builder.dart';

class NotesCampaignScreen extends StatelessWidget {
  final int campaignId;
  const NotesCampaignScreen({super.key, required this.campaignId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Notes'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: NotesCampaignDataBlocBuilder(campaignId: campaignId),
        ),
      ),
    );
  }
}
