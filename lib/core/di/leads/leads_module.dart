import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/features/leads/create-lead/logic/cubit/create_lead_cubit.dart';
import 'package:trick_crm_app/features/leads/lead-view/Edit-lead/logic/cubit/information_cubit.dart';
import 'package:trick_crm_app/features/leads/lead-view/lead-view/logic/cubit/lead_view_cubit.dart';
import 'package:trick_crm_app/features/leads/leads/logic/cubit/leads_cubit.dart';

import '../../../features/leads/lead-view/Attatchments/delete_attachment/logic/cubit/delete_attachment_lead_cubit.dart';
import '../../../features/leads/lead-view/Lead-Campaigns/campaign-view/campaign-action-view/delete-lead/logic/cubit/delete_lead_campaign_cubit.dart';
import '../../../features/leads/lead-view/Lead-Campaigns/campaign-view/campaign-action-view/edit-lead/logic/cubit/edit_lead_campaign_cubit.dart';
import '../../../features/leads/lead-view/Lead-Campaigns/create-campaign/logic/cubit/create_lead_campaign_cubit.dart';
import '../../../features/leads/lead-view/Open-Activities/open-tasks/create-lead-task/logic/cubit/create_lead_task_cubit.dart';
import '../../../features/leads/lead-view/notes/create-note/logic/cubit/create_note_lead_cubit.dart';
import '../../../features/leads/lead-view/notes/delete-note/logic/cubit/delete_note_lead_cubit.dart';
import '../../../features/leads/lead-view/notes/edit-note/logic/cubit/edit_note_lead_cubit.dart';
import '../setup-di/dependency_injection.dart';

void setupLeadsModule() {
  /// Leads cubit instance
  getIt
      .registerLazySingleton<LeadsCubit>(() => LeadsCubit(getIt<ApiService>()));

  // leads view cubit instance
  getIt.registerLazySingleton<LeadViewCubit>(
      () => LeadViewCubit(getIt<ApiService>()));

  // edit information cubit instance
  getIt
      .registerFactory<EditLeadCubit>(() => EditLeadCubit(getIt<ApiService>()));

  // create lead instance
  getIt.registerLazySingleton<CreateLeadCubit>(
      () => CreateLeadCubit(getIt<ApiService>()));

  // Create Note instance
  getIt.registerLazySingleton<CreateNoteLeadCubit>(
      () => CreateNoteLeadCubit(getIt<ApiService>()));

  // Update Note instance
  getIt.registerLazySingleton<EditNoteLeadCubit>(
      () => EditNoteLeadCubit(getIt<ApiService>()));

  // Delete Note instance
  getIt.registerLazySingleton<DeleteNoteLeadCubit>(
      () => DeleteNoteLeadCubit(getIt<ApiService>()));

  // Create Lead Campaign instance
  getIt.registerLazySingleton<CreateLeadCampaignCubit>(
      () => CreateLeadCampaignCubit(getIt<ApiService>()));

  // Edit Lead Campaign instance
  getIt.registerLazySingleton<EditLeadCampaignCubit>(
      () => EditLeadCampaignCubit(getIt<ApiService>()));

  // Delete Lead Campaign instance
  getIt.registerLazySingleton<DeleteLeadCampaignCubit>(
      () => DeleteLeadCampaignCubit(getIt<ApiService>()));

  // Delete Attachment Lead instance
  getIt.registerLazySingleton<DeleteAttachmentLeadCubit>(
      () => DeleteAttachmentLeadCubit(getIt<ApiService>()));

  // Create Lead Task instance
  getIt.registerLazySingleton<CreateLeadTaskCubit>(
      () => CreateLeadTaskCubit(getIt<ApiService>()));
}
