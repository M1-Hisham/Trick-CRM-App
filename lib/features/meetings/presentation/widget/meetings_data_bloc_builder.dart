import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trick_crm_app/features/calls/data/model/calls_model.dart';
import 'package:trick_crm_app/features/meetings/data/model/meetings_model.dart';
import 'package:trick_crm_app/features/meetings/logic/cubit/meetings_cubit.dart';

import '../../../../core/cubits/base_state.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/widgets/app_data_table.dart';

class MeetingsDataBlocBuilder extends StatelessWidget {
  const MeetingsDataBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MeetingsCubit, BaseState<MeetingsModel>>(
      buildWhen: (previous, current) => current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
            loading: () => Shimmer.fromColors(
                  baseColor: R.colors.baseColorShimmer,
                  highlightColor: R.colors.highlightColorShimmer,
                  enabled: true,
                  child: const AppDataTable<Calls>(
                    data: [],
                    headers: [],
                    dataExtractors: [],
                  ),
                ),
            success: (MeetingsModel meetingsModel) {
              final String? meetingsMessage = meetingsModel.message;
              final meetings = meetingsModel.meetings;
              return AppDataTable<Meetings>(
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
                dataIdExtractor: (meetings) => (meetings.id ?? 0).toString(),
                dataLeadNameExtractor: (meetings) => meetings.title ?? '',
                onViewDetails: (id, leadName) {
                  // Get.toNamed(
                  //   RoutesNames.leadsView,
                  //   arguments: id != '' ? int.parse(id) : 0,
                  // );
                },
              );
            },
            error: (message) => const Center(
                  child: Text('An error occurred, Try again'),
                ),
            orElse: () {
              return const SizedBox.shrink();
            });
      },
    );
  }
}
