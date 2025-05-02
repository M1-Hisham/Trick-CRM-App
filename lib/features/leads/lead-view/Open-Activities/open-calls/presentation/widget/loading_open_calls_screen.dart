import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trick_crm_app/core/helpers/loading_shimmer.dart';

import '../../../../../../../core/helpers/spacing.dart';
import '../../../../../../../core/resources/resources.dart';
import '../../../../../../../core/widgets/app_button.dart';
import '../../../../../../../core/widgets/app_data_table.dart';
import '../../data/model/open_call_model.dart';

loadingOpenCallsScreen() {
  return loadingShimmer(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppButton(
          icon: SvgPicture.asset(R.icons.add),
          text: 'Create a New Call',
          onPressed: () {},
        ),
        spacingV(20),
        Text(
          "Open Calls",
          style: R.textStyles.font17PrimaryW600,
        ),
        spacingV(20),
        AppDataTable<OpenCallModel>(
          dataMessage: 'No Open Calls',
          data: const [],
          headers: const [
            'Subject',
            'Created By',
            'Due Date',
            'Priority',
            'Status',
          ],
          dataExtractors: [
            (call) => '_',
            (call) => '_',
            (call) => '_',
            (call) => '_',
            (call) => '_',
          ],
          dataIdExtractor: (call) => (call.id ?? 0).toString(),
          dataLeadNameExtractor: (calls) => calls.subject ?? '_',
          onViewDetails: (id, callName) {},
        ),
      ],
    ),
  );
}
