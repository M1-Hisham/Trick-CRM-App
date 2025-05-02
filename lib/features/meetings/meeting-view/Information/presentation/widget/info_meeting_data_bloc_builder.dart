import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trick_crm_app/core/di/setup-di/dependency_injection.dart';
import 'package:trick_crm_app/core/helpers/loading_shimmer.dart';
import 'package:trick_crm_app/core/widgets/app_error_message.dart';
import 'package:trick_crm_app/features/meetings/meeting-view/Information/presentation/widget/information_meeting_details.dart';

import '../../../../../../core/cubits/base_state.dart';
import '../../../meeting-view/data/model/meeting_view_model.dart';
import '../../../meeting-view/logic/cubit/meeting_view_cubit.dart';

class InfoMeetingDataBlocBuilder extends StatelessWidget {
  final int meetingId;
  const InfoMeetingDataBlocBuilder({super.key, required this.meetingId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MeetingViewCubit, BaseState<MeetingViewModel>>(
      bloc: getIt<MeetingViewCubit>()..getMeetingView(meetingId),
      buildWhen: (previous, current) =>
          current is Success || current is Loading || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => loadingShimmer(
            child: informationMeetingDetails(
                context, MeetingViewModel(), meetingId),
          ),
          success: (MeetingViewModel meetingViewModel) {
            return informationMeetingDetails(
                context, meetingViewModel, meetingId);
          },
          error: (message) => appErrorMessage(
            message,
            () {
              getIt<MeetingViewCubit>().getMeetingView(meetingId);
            },
          ),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
