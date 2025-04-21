import 'package:flutter/material.dart';
import 'package:trick_crm_app/core/helpers/spacing.dart';
import 'package:trick_crm_app/core/resources/resources.dart';
import 'package:trick_crm_app/core/widgets/app_data_table.dart';
import 'package:trick_crm_app/features/leads/lead-view/Closed-Activities/closed-calls/data/model/closed_call_model.dart';

import '../../../../../../core/widgets/app_bar.dart';

class ClosedCallsScreen extends StatelessWidget {
  final List<ClosedCallModel> callsModel;
  final int leadId;
  const ClosedCallsScreen(
      {super.key, required this.callsModel, required this.leadId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: appBar('Closed Calls'),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(
                "Closed Calls",
                style: R.textStyles.font17PrimaryW600,
              ),
              spacingV(20),
              AppDataTable<ClosedCallModel>(
                dataMessage: 'No Closed Calls',
                data: callsModel,
                headers: const [
                  'Subject',
                  'Call Owner',
                  'Status',
                  'Type',
                  'Due Date',
                ],
                dataExtractors: [
                  (call) => call.subject ?? '_',
                  (call) => call.owner?.name ?? '_',
                  (call) => call.callStatus ?? '_',
                  (call) => call.callType ?? '_',
                  (call) => call.startTime ?? '_',
                ],
                dataIdExtractor: (call) => (call.id ?? 0).toString(),
                onViewDetails: (id, leadName) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
