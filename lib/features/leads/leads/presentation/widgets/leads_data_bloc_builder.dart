import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/cubits/base_state.dart';
import 'package:trick_crm_app/core/helpers/loading_shimmer.dart';
import 'package:trick_crm_app/features/leads/lead-view/lead-view/presentation/screens/leads_view.dart';
import 'package:trick_crm_app/features/leads/leads/logic/cubit/leads_cubit.dart';

import '../../../../../core/helpers/show_snack_bar.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/resources/resources.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_data_table.dart';
import '../../../../../core/widgets/app_error_message.dart';
import '../../../../../core/widgets/app_show_modal_bottom_sheet.dart';
import '../../../create-lead/presentation/screen/create_lead_screen.dart';
import '../../data/models/leads_model.dart';

class LeadsDataBlocBuilder extends StatelessWidget {
  const LeadsDataBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeadsCubit, BaseState<LeadsModel>>(
      buildWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
            loading: () => loadingShimmer(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: AppButton(
                              icon: SvgPicture.asset(R.icons.add),
                              text: 'Create Lead',
                              onPressed: () {},
                            ),
                          ),
                          spacingH(8),
                          Expanded(
                            child: AppButton(
                              icon: SvgPicture.asset(R.icons.exportOptions),
                              text: 'Export Options',
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                      spacingV(13),
                      Row(
                        children: [
                          Expanded(
                            child: AppButton(
                              icon: SvgPicture.asset(R.icons.integrateFacebook),
                              text: 'Integrate Facebook',
                              onPressed: () {},
                            ),
                          ),
                          spacingH(8),
                          Expanded(
                            child: AppButton(
                              icon: SvgPicture.asset(R.icons.importOptions),
                              text: 'Import Options',
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                      spacingV(20),
                      const AppDataTable<Leads>(
                        data: [],
                        headers: [],
                        dataExtractors: [],
                      ),
                    ],
                  ),
                ),
            success: (leadsModel) {
              final String? leadsMessage = leadsModel.message;
              final leads = leadsModel.leads;
              return Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: AppButton(
                          icon: SvgPicture.asset(R.icons.add),
                          text: 'Create Lead',
                          onPressed: () async {
                            final result = await appShowModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) =>
                                  CreateLeadScreen(leadsModel: leadsModel),
                            );
                            if (result == true) {
                              // Refresh the data after creating a new lead
                              // ignore: use_build_context_synchronously
                              context.read<LeadsCubit>().getData();
                            }
                          },
                        ),
                      ),
                      spacingH(8),
                      Expanded(
                        child: AppButton(
                          icon: SvgPicture.asset(R.icons.exportOptions),
                          text: 'Export Options',
                          onPressed: () {
                            showSnackBar(context, "Coming soon!");
                          },
                        ),
                      ),
                    ],
                  ),
                  spacingV(13),
                  Row(
                    children: [
                      Expanded(
                        child: AppButton(
                          icon: SvgPicture.asset(R.icons.integrateFacebook),
                          text: 'Integrate Facebook',
                          onPressed: () {
                            showSnackBar(context, "Coming soon!");
                          },
                        ),
                      ),
                      spacingH(8),
                      Expanded(
                        child: AppButton(
                          icon: SvgPicture.asset(R.icons.importOptions),
                          text: 'Import Options',
                          onPressed: () {
                            showSnackBar(context, "Coming soon!");
                          },
                        ),
                      ),
                    ],
                  ),
                  spacingV(20),
                  AppDataTable<Leads>(
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
                        () => LeadView(
                          leadId: int.parse(id),
                          leadName: leadName,
                        ),
                      );
                    },
                  ),
                ],
              );
            },
            error: (message) => appErrorMessage(
                  message,
                  () {
                    context.read<LeadsCubit>().getData();
                  },
                ),
            orElse: () {
              return const SizedBox.shrink();
            });
      },
    );
  }
}
