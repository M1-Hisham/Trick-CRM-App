import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trick_crm_app/core/cubits/base_state.dart';
import 'package:trick_crm_app/core/helpers/formatted_data_helper.dart';
import 'package:trick_crm_app/core/helpers/loading_shimmer.dart';

import '../../../../../../../core/di/setup-di/dependency_injection.dart';
import '../../../../../../../core/widgets/app_data_table.dart';
import '../../../../../../../core/widgets/app_error_message.dart';
import '../../../lead-view/data/model/leads_view_model.dart';
import '../../../lead-view/logic/cubit/lead_view_cubit.dart';
import '../../data/model/lead_meails_model.dart';

class EmailLeadDataBlocBuilder extends StatelessWidget {
  final int leadId;
  const EmailLeadDataBlocBuilder({super.key, required this.leadId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeadViewCubit, BaseState<LeadsViewModel>>(
      bloc: getIt<LeadViewCubit>()..getLeadsView(leadId),
      buildWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => loadingShimmer(
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppDataTable<LeadMailsModel>(
                  data: [],
                  headers: [],
                  dataExtractors: [],
                ),
              ],
            ),
          ),
          success: (LeadsViewModel leadsViewModel) {
            final List<LeadMailsModel> leadMails =
                leadsViewModel.leadMails ?? [];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppDataTable<LeadMailsModel>(
                  dataMessage: 'No lead Mails',
                  data: leadMails,
                  headers: const [
                    "Subject",
                    "Date",
                    "Sent By",
                    "Status",
                  ],
                  dataExtractors: [
                    (leadMails) => leadMails.subject ?? '',
                    (leadMails) =>
                        formattedDateHelperMM(leadMails.createdAt ?? ''),
                    (leadMails) => leadMails.user?.name ?? '',
                    (leadMails) => leadMails.status ?? '_',
                  ],
                ),
              ],
            );
          },
          error: (message) => appErrorMessage(
            message,
            () => getIt<LeadViewCubit>().getLeadsView(leadId),
          ),
          orElse: () {
            return const SizedBox.shrink();
          },
        );
      },
    );
  }
}
