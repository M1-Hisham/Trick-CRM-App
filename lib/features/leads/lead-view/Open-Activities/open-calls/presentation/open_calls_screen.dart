import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trick_crm_app/core/helpers/spacing.dart';
import 'package:trick_crm_app/core/resources/resources.dart';
import 'package:trick_crm_app/core/widgets/app_button.dart';
import 'package:trick_crm_app/core/widgets/app_data_table.dart';
import 'package:trick_crm_app/features/leads/lead-view/Open-Activities/open-calls/data/model/open_call_model.dart';

import '../../../../../../core/widgets/app_bar.dart';

class OpenCallsScreen extends StatelessWidget {
  final List<OpenCallModel> callsModel;
  final int leadId;
  const OpenCallsScreen(
      {super.key, required this.callsModel, required this.leadId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: appBar('Open Calls'),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppButton(
                icon: SvgPicture.asset(R.icons.add),
                text: 'Create a New Call',
                onPressed: () {
                  //   showModalBottomSheet(
                  //     sheetAnimationStyle: AnimationStyle(
                  //       duration: const Duration(milliseconds: 1000),
                  //       curve: Curves.easeInOutCubicEmphasized,
                  //       reverseDuration: const Duration(milliseconds: 600),
                  //     ),
                  //     useSafeArea: true,
                  //     isScrollControlled: true,
                  //     backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  //     shape: const RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.only(
                  //         topLeft: Radius.circular(13),
                  //         topRight: Radius.circular(13),
                  //       ),
                  //     ),
                  //     context: context,
                  //     builder: (BuildContext context) => CreateLeadTask(
                  //       leadId: leadId,
                  //     ),
                  //   );
                },
              ),
              spacingV(20),
              Text(
                "Open Calls",
                style: R.textStyles.font17PrimaryW600,
              ),
              spacingV(20),
              AppDataTable<OpenCallModel>(
                dataMessage: 'No Open Calls',
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
