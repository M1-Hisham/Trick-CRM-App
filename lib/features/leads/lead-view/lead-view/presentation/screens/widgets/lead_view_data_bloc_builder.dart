import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/cubits/base_state.dart';
import 'package:trick_crm_app/core/di/dependency_injection.dart';
import 'package:trick_crm_app/core/helpers/loading_shimmer.dart';
import 'package:trick_crm_app/features/leads/lead-view/Emails/emails_screen.dart';
import 'package:trick_crm_app/features/leads/lead-view/lead-view/logic/cubit/lead_view_cubit.dart';
import 'package:trick_crm_app/features/leads/lead-view/notes/notes-view/model/lead_note.dart';
import 'package:trick_crm_app/features/leads/lead-view/notes/notes-view/presentation/screen/notes_screen.dart';

import '../../../../Attatchments/attachment-view/model/attachments_model.dart';
import '../../../../Attatchments/attachment-view/presentation/attachment_screen.dart';
import '../../../../Campaigns/campaigns-view/presentation/campaigns_screen.dart';
import '../../../../Information/presentation/information_screen.dart';
import '../../../../Open-Activities/presentation/open_activities_screen.dart';
import '../../../data/model/leads_view_model.dart';
import 'card_lead_view.dart';

class LeadViewDataBlocBuilder extends StatelessWidget {
  final int leadId;
  const LeadViewDataBlocBuilder({super.key, required this.leadId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeadViewCubit, BaseState<LeadsViewModel>>(
        bloc: getIt<LeadViewCubit>()..getLeadsView(leadId),
        buildWhen: (previous, current) =>
            current is Loading || current is Success || current is Error,
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => loadingShimmer(
              child: Column(
                children: [
                  // Show Cards
                  cardLeadView(
                    title: 'Information',
                    icon: 'information',
                    onTap: () {},
                  ),
                  cardLeadView(
                    title: 'Timeline',
                    icon: 'timeline',
                    onTap: () {},
                  ),
                  cardLeadView(
                    title: 'Notes',
                    icon: 'notes',
                    onTap: () {},
                  ),
                  cardLeadView(
                    title: 'Attachments',
                    icon: 'attachments',
                    onTap: () {},
                  ),
                  cardLeadView(
                    title: 'Campaigns',
                    icon: 'Campaigns',
                    onTap: () {},
                  ),
                  cardLeadView(
                    title: 'Email',
                    icon: 'Emails',
                    onTap: () {},
                  ),
                  cardLeadView(
                    title: 'Open Activities',
                    icon: 'openActivities',
                    onTap: () {},
                  ),
                ],
              ),
            ),
            success: (LeadsViewModel leadsViewModel) {
              final List<LeadNote>? leadNotes = leadsViewModel.leadNotes;
              final List<LeadAttatchment>? leadAttatchments =
                  leadsViewModel.leadAttatchment;
              return Column(
                children: [
                  // Show Cards
                  cardLeadView(
                    title: 'Information',
                    icon: 'information',
                    onTap: () {
                      Get.to(() => InformationScreen(leadId: leadId));
                    },
                  ),
                  cardLeadView(
                    title: 'Timeline',
                    icon: 'timeline',
                    onTap: () {},
                  ),
                  cardLeadView(
                    title: 'Notes',
                    icon: 'notes',
                    onTap: () {
                      Get.to(() => NotesScreen(
                          leadNotes: leadNotes ?? [], leadId: leadId));
                    },
                  ),
                  cardLeadView(
                    title: 'Attachments',
                    icon: 'attachments',
                    onTap: () {
                      Get.to(
                        () => AttachmentScreen(
                          leadAttatchment: leadAttatchments ?? [],
                        ),
                      );
                    },
                  ),
                  cardLeadView(
                    title: 'Campaigns',
                    icon: 'Campaigns',
                    onTap: () {
                      Get.to(() => const CampaignsScreen());
                    },
                  ),
                  cardLeadView(
                    title: 'Email',
                    icon: 'Emails',
                    onTap: () {
                      Get.to(() => const EmailsScreen());
                    },
                  ),
                  cardLeadView(
                    title: 'Open Activities',
                    icon: 'openActivities',
                    onTap: () {
                      Get.to(() => const OpenActivitiesScreen());
                    },
                  ),
                ],
              );
            },
            error: (message) {
              return const Center(
                child: Text('Error Occurred Try Again'),
              );
            },
            orElse: () => const SizedBox.shrink(),
          );
        });
  }
}
