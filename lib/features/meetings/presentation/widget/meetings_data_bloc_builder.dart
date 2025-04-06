import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trick_crm_app/core/widgets/app_show_modal_bottom_sheet.dart';
import 'package:trick_crm_app/features/meetings/data/model/meetings_model.dart';
import 'package:trick_crm_app/features/meetings/logic/cubit/meetings_cubit.dart';

import '../../../../core/cubits/base_state.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_data_table.dart';
import '../../create-meeting/presentation/create_meeting_screen.dart';
import 'meeting_loading_screen.dart';

class MeetingsDataBlocBuilder extends StatefulWidget {
  const MeetingsDataBlocBuilder({super.key});

  @override
  State<MeetingsDataBlocBuilder> createState() =>
      _MeetingsDataBlocBuilderState();
}

class _MeetingsDataBlocBuilderState extends State<MeetingsDataBlocBuilder> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MeetingsCubit, BaseState<MeetingsModel>>(
      buildWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
            loading: () => meetingsLoadingScreen(),
            success: (MeetingsModel meetingsModel) {
              final String? meetingsMessage = meetingsModel.message;
              final meetings = meetingsModel.meetings;
              return Column(
                children: [
                  AppButton(
                    icon: SvgPicture.asset(R.icons.add),
                    text: 'Create Meeting',
                    onPressed: () async {
                      final result = await appShowModalBottomSheet(
                        context: context,
                        builder: (context) => CreateMeetingScreen(
                          meetingsModel: meetingsModel,
                        ),
                      );
                      if (result == true) {
                        // Refresh the data after creating a new meeting
                        // ignore: use_build_context_synchronously
                        context.read<MeetingsCubit>().getData();
                      }
                    },
                  ),
                  spacingV(20),
                  AppDataTable<Meetings>(
                    dataMessage: meetingsMessage,
                    data: meetings ?? [],
                    headers: const [
                      "Title",
                      "From",
                      "To",
                      "Related To	",
                      "Lead Name",
                      "Contact Name",
                      "Client Name",
                      "Host",
                    ],
                    dataExtractors: [
                      (meetings) => meetings.title ?? '_',
                      (meetings) => meetings.startTime ?? '_',
                      (meetings) => meetings.endTime ?? '_',
                      (meetings) => meetings.relatedTo ?? '_',
                      (meetings) => meetings.lead?.leadName ?? '_',
                      (meetings) => meetings.contact?.contactName ?? '_',
                      (meetings) => meetings.client?.clientName ?? '_',
                      (meetings) => meetings.host?.name ?? '_',
                    ],
                    dataIdExtractor: (meetings) =>
                        (meetings.id ?? 0).toString(),
                    dataLeadNameExtractor: (meetings) => meetings.title ?? '',
                    onViewDetails: (id, leadName) {
                      // Get.toNamed(
                      //   RoutesNames.leadsView,
                      //   arguments: id != '' ? int.parse(id) : 0,
                      // );
                    },
                  ),
                ],
              );
            },
            error: (message) => Center(
                  child: Column(
                    children: [
                      const Text('An error occurred, Try again'),
                      spacingV(10),
                      const Icon(
                        Icons.error,
                        color: Colors.red,
                      ),
                      spacingV(10),
                      const Text('Please check your internet connection'),
                      spacingV(10),
                      const Text('Or try again later'),
                      spacingV(10),
                      const Text('If the problem persists, contact support'),
                      spacingV(10),
                      Text('Error: $message'),
                      spacingV(10),
                      AppButton(
                        text: 'Retry',
                        onPressed: () {
                          context.read<MeetingsCubit>().getData();
                        },
                      ),
                    ],
                  ),
                ),
            orElse: () {
              return const SizedBox.shrink();
            });
      },
    );
  }
}
