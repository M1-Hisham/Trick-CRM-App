import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trick_crm_app/core/helpers/loading_shimmer.dart';

import '../../../../../../../core/helpers/spacing.dart';
import '../../../../../../../core/resources/resources.dart';
import '../../../../../../../core/widgets/app_button.dart';
import '../../../../../../../core/widgets/app_data_table.dart';
import '../../data/model/open_meeting_model.dart';

loadingOpenMeetingsScreen() {
  return loadingShimmer(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppButton(
          icon: SvgPicture.asset(R.icons.add),
          text: 'Create a New meeting',
          onPressed: () {},
        ),
        spacingV(20),
        Text(
          "Open meetings",
          style: R.textStyles.font17PrimaryW600,
        ),
        spacingV(20),
        AppDataTable<OpenMeetingModel>(
          dataMessage: 'No Open meetings',
          data: const [],
          headers: const [
            'Subject',
            'Created By',
            'Due Date',
            'Priority',
            'Status',
          ],
          dataExtractors: [
            (meeting) => '_',
            (meeting) => '_',
            (meeting) => '_',
            (meeting) => '_',
            (meeting) => '_',
          ],
          dataIdExtractor: (meeting) => (meeting.id ?? 0).toString(),
          dataLeadNameExtractor: (meetings) => meetings.title ?? '_',
          onViewDetails: (id, meetingName) {},
        ),
      ],
    ),
  );
}
