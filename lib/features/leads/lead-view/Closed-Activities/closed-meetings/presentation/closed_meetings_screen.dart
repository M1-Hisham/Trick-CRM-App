import 'package:flutter/material.dart';
import 'package:trick_crm_app/core/helpers/spacing.dart';
import 'package:trick_crm_app/features/leads/lead-view/Open-Activities/open-meetings/data/model/open_meeting_model.dart';

import '../../../../../../core/resources/resources.dart';
import '../../../../../../core/widgets/app_bar.dart';
import '../../../../../../core/widgets/app_data_table.dart';

class ClosedMeetingsScreen extends StatelessWidget {
  final List<OpenMeetingModel> meetings;
  const ClosedMeetingsScreen({super.key, required this.meetings});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: appBar('Closed Meetings'),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Closed Meetings',
                style: R.textStyles.font17PrimaryW600,
              ),
              spacingV(20),
              AppDataTable<OpenMeetingModel>(
                dataMessage: 'No Closed Meetings',
                data: meetings,
                headers: const [
                  'Subject',
                  'From',
                  'To',
                  'Related To',
                  // 'Lead Name',
                  // 'Contact Name',
                  // 'Client Name',
                  'Host',
                  'Status',
                ],
                dataExtractors: [
                  (meetings) => meetings.title ?? '_',
                  (meetings) => meetings.startTime ?? '_',
                  (meetings) => meetings.endTime ?? '_',
                  (meetings) => meetings.relatedTo ?? '_',
                  // (meetings) => meetings.
                  // (meetings) => meetings.contactName ?? '_',
                  // (meetings) => meetings.clientName ?? '_',
                  (meetings) => meetings.host?.name ?? '_',
                  (meetings) => meetings.status ?? '_',
                ],
                dataIdExtractor: (meetings) => (meetings.id ?? 0).toString(),
                onViewDetails: (id, leadName) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
