import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trick_crm_app/features/calls/data/model/calls_model.dart';
import 'package:trick_crm_app/features/calls/logic/cubit/calls_cubit.dart';

import '../../../../core/cubits/base_state.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/widgets/app_data_table.dart';

class CallsDataBlocBuilder extends StatelessWidget {
  const CallsDataBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CallsCubit, BaseState<CallsModel>>(
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
            success: (CallsModel callsModel) {
              final String? callsMessage = callsModel.message;
              final calls = callsModel.calls;
              return AppDataTable<Calls>(
                dataMessage: callsMessage,
                data: calls ?? [],
                headers: const [
                  "Subject",
                  "Call Owner",
                  "Related To",
                  "Status",
                  "Type",
                  "Call Purpose",
                  "Lead Name",
                  "Contact Name",
                  "Client Name",
                ],
                dataExtractors: [
                  (calls) => calls.subject ?? '_',
                  (calls) => calls.callAgenda ?? '_',
                  (calls) => calls.relatedTo ?? '_',
                  (calls) => calls.callStatus ?? '_',
                  (calls) => calls.callType ?? '_',
                  (calls) => calls.callPurpose ?? '_',
                  (calls) => calls.lead?.leadName ?? '_',
                  (calls) => calls.contact ?? '_',
                  (calls) => calls.client?.clientName ?? '_',
                ],
                dataIdExtractor: (calls) => (calls.id ?? 0).toString(),
                dataLeadNameExtractor: (calls) => calls.subject ?? '',
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
