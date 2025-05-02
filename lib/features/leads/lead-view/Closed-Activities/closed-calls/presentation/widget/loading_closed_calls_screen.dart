import 'package:flutter/material.dart';
import 'package:trick_crm_app/core/helpers/loading_shimmer.dart';

import '../../../../../../../core/widgets/app_data_table.dart';
import '../../data/model/closed_call_model.dart';

loadingClosedCallsScreen() {
  return loadingShimmer(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppDataTable<ClosedCallModel>(
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
