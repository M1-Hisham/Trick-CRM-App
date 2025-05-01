import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/widgets/app_error_message.dart';
import 'package:trick_crm_app/features/calls/call-view/call-view/presentation/screens/call_view.dart';
import 'package:trick_crm_app/features/calls/calls/data/model/calls_model.dart';
import 'package:trick_crm_app/features/calls/calls/logic/cubit/calls_cubit.dart';

import '../../../../../core/cubits/base_state.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/resources/resources.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_data_table.dart';
import '../../../../../core/widgets/app_show_modal_bottom_sheet.dart';
import '../../../create-call/presentation/create_call_screen.dart';
import 'calls_loading_screen.dart';

class CallsDataBlocBuilder extends StatefulWidget {
  const CallsDataBlocBuilder({super.key});

  @override
  State<CallsDataBlocBuilder> createState() => _CallsDataBlocBuilderState();
}

class _CallsDataBlocBuilderState extends State<CallsDataBlocBuilder> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CallsCubit, BaseState<CallsModel>>(
      buildWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
            loading: () => callsLoadingScreen(),
            success: (CallsModel callsModel) {
              final String? callsMessage = callsModel.message;
              final calls = callsModel.calls;
              return Column(
                children: [
                  AppButton(
                    icon: SvgPicture.asset(R.icons.add),
                    text: 'Create Calls',
                    onPressed: () async {
                      final result = await appShowModalBottomSheet(
                        context: context,
                        builder: (context) => CreateCallScreen(
                          callsModel: callsModel,
                        ),
                      );
                      if (result == true) {
                        // Refresh the data after creating a new call
                        // ignore: use_build_context_synchronously
                        context.read<CallsCubit>().getData();
                      }
                    },
                  ),
                  spacingV(20),
                  AppDataTable<Calls>(
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
                      ""
                    ],
                    dataExtractors: [
                      (calls) => calls.subject ?? '_',
                      (calls) => calls.owner?.name ?? '_',
                      (calls) => calls.callTo ?? '_',
                      (calls) => calls.callStatus ?? '_',
                      (calls) => calls.callType ?? '_',
                      (calls) => calls.callPurpose ?? '_',
                      (calls) => calls.lead?.leadName ?? '_',
                      (calls) => calls.contact?.contactName ?? '_',
                      (calls) => calls.client?.clientName ?? '_',
                      (calls) => '',
                    ],
                    dataIdExtractor: (calls) => (calls.id ?? 0).toString(),
                    dataLeadNameExtractor: (calls) => calls.subject ?? '',
                    onViewDetails: (id, callName) async {
                      final result = await Get.to(
                        () => CallView(
                          callName: callName,
                          callId: int.parse(id),
                        ),
                      );
                      if (result == true) {
                        // Refresh the data after creating a new call
                        // ignore: use_build_context_synchronously
                        context.read<CallsCubit>().getData();
                      }
                    },
                  ),
                ],
              );
            },
            error: (message) => appErrorMessage(message, () {
                  context.read<CallsCubit>().getData();
                }),
            orElse: () {
              return const SizedBox.shrink();
            });
      },
    );
  }
}
