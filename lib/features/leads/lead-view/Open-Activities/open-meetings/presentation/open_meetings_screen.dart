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
import '../../../lead-view/data/model/leads_view_model.dart';
import '../create-lead-meeting/presentation/screen/create_lead_meeting.dart';
import '../data/model/open_meeting_model.dart';
import '../lead-meeting-view/presentation/screens/lead_meeting_view.dart';
import 'widget/loading_meeting_tasks_screen.dart';

class OpenMeetingsScreen extends StatelessWidget {
  final int leadId;
  final String leadName;
  const OpenMeetingsScreen(
      {super.key, required this.leadId, required this.leadName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: appBar('Open meetings'),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: BlocBuilder<LeadViewCubit, BaseState<LeadsViewModel>>(
            buildWhen: (previous, current) =>
                current is Loading || current is Success || current is Error,
            builder: (context, state) {
              return state.maybeWhen(
                loading: () => loadingOpenMeetingsScreen(),
                success: (LeadsViewModel leadsViewModel) {
                  final List<OpenActivityModel> openActivity =
                      leadsViewModel.openActivity ?? [];
                  final List<OpenMeetingModel> meetingModel = openActivity
                      .map((openActivityModel) => openActivityModel.meeting)
                      .where((meeting) => meeting != null)
                      .cast<OpenMeetingModel>()
                      .toList();
                  final List<HostUsers> hostUsers =
                      leadsViewModel.hostUsers ?? [];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppButton(
                        icon: SvgPicture.asset(R.icons.add),
                        text: 'Create a New meeting',
                        onPressed: () async {
                          final result = await appShowModalBottomSheet(
                            context: context,
                            builder: (context) => CreateLeadMeeting(
                              leadId: leadId,
                              leadName: leadName,
                              users: leadsViewModel.users ?? [],
                              hostUsers: hostUsers,
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
                        "Open meetings",
                        style: R.textStyles.font17PrimaryW600,
                      ),
                      spacingV(20),
                      AppDataTable<OpenMeetingModel>(
                        dataMessage: 'No Open meetings',
                        data: meetingModel,
                        headers: const [
                          "Title",
                          "From",
                          "To",
                          "Related To	",
                          "Host",
                          "Status",
                        ],
                        dataExtractors: [
                          (meetings) => meetings.title ?? '_',
                          (meetings) => meetings.startTime ?? '_',
                          (meetings) => meetings.endTime ?? '_',
                          (meetings) => meetings.relatedTo ?? '_',
                          (meetings) => meetings.host?.name ?? '_',
                          (meeting) => meeting.status ?? '_',
                        ],
                        dataIdExtractor: (meeting) =>
                            (meeting.id ?? 0).toString(),
                        dataLeadNameExtractor: (meetings) =>
                            meetings.title ?? '_',
                        onViewDetails: (id, meetingName) async {
                          final result = await Get.to(
                            () => LeadMeetingView(
                              meetingName: meetingName,
                              leadId: leadId,
                              meetingId: int.parse(id),
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
