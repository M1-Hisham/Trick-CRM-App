import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trick_crm_app/core/cubits/base_state.dart';
import 'package:trick_crm_app/features/leads/lead-view/lead-view/presentation/screens/leads_view.dart';
import 'package:trick_crm_app/features/leads/leads/logic/cubit/leads_cubit.dart';

import '../../../../../core/resources/resources.dart';
import '../../../../../core/widgets/app_data_table.dart';
import '../../data/models/leads_model.dart';

class LeadsDataBlocBuilder extends StatelessWidget {
  const LeadsDataBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeadsCubit, BaseState<LeadsModel>>(
      buildWhen: (previous, current) => current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
            loading: () => Shimmer.fromColors(
                  baseColor: R.colors.baseColorShimmer,
                  highlightColor: R.colors.highlightColorShimmer,
                  enabled: true,
                  child: const AppDataTable<Leads>(
                    data: [],
                    headers: [],
                    dataExtractors: [],
                  ),
                ),
            success: (leadsModel) {
              final String? leadsMessage = leadsModel.message;
              final leads = leadsModel.leads;
              return AppDataTable<Leads>(
                dataMessage: leadsMessage,
                data: leads ?? [],
                headers: const [
                  "Name",
                  "Lead Source",
                  "Email",
                  "Phone",
                  "Lead Assigned to",
                  "Created At",
                ],
                dataExtractors: [
                  (lead) => lead.leadName ?? '_',
                  (lead) => lead.leadSource ?? '_',
                  (lead) => lead.email ?? '_',
                  (lead) => lead.mobile ?? '_',
                  (lead) => lead.assigned?.name ?? '_',
                  (lead) => lead.createdAt ?? '_',
                ],
                dataIdExtractor: (lead) => (lead.id ?? 0).toString(),
                dataLeadNameExtractor: (lead) =>
                    (lead.firstName ?? 0).toString(),
                onViewDetails: (id, leadName) {
                  Get.to(
                    LeadView(
                      leadId: int.parse(id),
                      leadName: leadName,
                    ),
                  );
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
