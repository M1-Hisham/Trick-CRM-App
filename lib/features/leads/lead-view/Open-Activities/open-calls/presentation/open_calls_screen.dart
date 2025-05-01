import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/cubits/base_state.dart';
import 'package:trick_crm_app/core/helpers/spacing.dart';
import 'package:trick_crm_app/core/resources/resources.dart';
import 'package:trick_crm_app/core/widgets/app_button.dart';
import 'package:trick_crm_app/core/widgets/app_data_table.dart';
import 'package:trick_crm_app/features/leads/lead-view/Open-Activities/open-activities-view/data/model/open_activity_model.dart';
import 'package:trick_crm_app/features/leads/lead-view/lead-view/logic/cubit/lead_view_cubit.dart';

import '../../../../../../core/di/setup-di/dependency_injection.dart';
import '../../../../../../core/widgets/app_bar.dart';
import '../../../../../../core/widgets/app_error_message.dart';
import '../../../../../../core/widgets/app_show_modal_bottom_sheet.dart';
import '../../../../../calls/call-view/call-view/presentation/screens/call_view.dart';
import '../../../lead-view/data/model/leads_view_model.dart';
import '../create-call/presentation/create_lead_call_screen.dart';
import '../data/model/open_call_model.dart';
import 'widget/loading_open_calls_screen.dart';

class OpenCallsScreen extends StatelessWidget {
  final int leadId;
  final String leadName;
  const OpenCallsScreen(
      {super.key, required this.leadId, required this.leadName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: appBar('Open Calls'),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: BlocBuilder<LeadViewCubit, BaseState<LeadsViewModel>>(
            buildWhen: (previous, current) =>
                current is Loading || current is Success || current is Error,
            builder: (context, state) {
              return state.maybeWhen(
                loading: () => loadingOpenCallsScreen(),
                success: (LeadsViewModel leadsViewModel) {
                  final List<OpenActivityModel> openActivity =
                      leadsViewModel.openActivity ?? [];
                  final List<OpenCallModel> callModel = openActivity
                      .map((openActivityModel) => openActivityModel.call)
                      .where((call) => call != null)
                      .cast<OpenCallModel>()
                      .toList();
                  final List<Users>? users = leadsViewModel.users;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppButton(
                        icon: SvgPicture.asset(R.icons.add),
                        text: 'Create a New call',
                        onPressed: () async {
                          final result = await appShowModalBottomSheet(
                            context: context,
                            builder: (context) => CreateLeadCallScreen(
                              ownerList: users ?? [],
                              leadId: leadId,
                            ),
                          );
                          if (result == true) {
                            // ignore: use_build_context_synchronously
                            context.read<LeadViewCubit>().getLeadsView(leadId);
                          }
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
                        data: callModel,
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
                        dataLeadNameExtractor: (calls) => calls.subject ?? '_',
                        onViewDetails: (id, callName) async {
                          final result = await Get.to(
                            () => CallView(
                              callName: callName,
                              // leadId: leadId,
                              callId: int.parse(id),
                            ),
                          );
                          if (result == true) {
                            // ignore: use_build_context_synchronously
                            context.read<LeadViewCubit>().getLeadsView(leadId);
                          }
                        },
                      ),
                    ],
                  );
                },
                error: (error) {
                  return appErrorMessage(
                    error,
                    () {
                      getIt<LeadViewCubit>().getLeadsView(leadId);
                    },
                  );
                },
                orElse: () => const SizedBox.shrink(),
              );
            },
          ),
        ),
      ),
    );
  }
}
