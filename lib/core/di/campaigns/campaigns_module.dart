import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/features/campaigns/create-campaign/logic/cubit/create_campaign_cubit.dart';

import '../../../features/campaigns/campaign-view/Attatchments/delete_attachment/logic/cubit/delete_attachment_campaign_cubit.dart';
import '../../../features/campaigns/campaign-view/Campaign-Leads/create-lead/logic/cubit/create_campaign_lead_cubit.dart';
import '../../../features/campaigns/campaign-view/Campaign-Leads/leads-view/lead-action-view/delete-lead/logic/cubit/delete_campaign_lead_cubit.dart';
import '../../../features/campaigns/campaign-view/Campaign-Leads/leads-view/lead-action-view/edit-lead/logic/cubit/edit_campaign_lead_cubit.dart';
import '../../../features/campaigns/campaign-view/campaign-view/logic/cubit/campaign_view_cubit.dart';
import '../../../features/campaigns/campaign-view/notes/create-note/logic/cubit/create_note_campaign_cubit.dart';
import '../../../features/campaigns/campaign-view/notes/delete-note/logic/cubit/delete_note_campaign_cubit.dart';
import '../../../features/campaigns/campaign-view/notes/edit-note/logic/cubit/edit_note_campaign_cubit.dart';
import '../setup-di/dependency_injection.dart';

void setupCampaignsModule() {
  // Create Campaign instance
  getIt.registerLazySingleton<CreateCampaignCubit>(
      () => CreateCampaignCubit(getIt<ApiService>()));

  // Campaign View instance
  getIt.registerLazySingleton<CampaignViewCubit>(
      () => CampaignViewCubit(getIt<ApiService>()));

  // Create Note instance
  getIt.registerLazySingleton<CreateNoteCampaignCubit>(
      () => CreateNoteCampaignCubit(getIt<ApiService>()));

  // Edit Note instance
  getIt.registerLazySingleton<EditNoteCampaignCubit>(
      () => EditNoteCampaignCubit(getIt<ApiService>()));

  // Delete Note instance
  getIt.registerLazySingleton<DeleteNoteCampaignCubit>(
      () => DeleteNoteCampaignCubit(getIt<ApiService>()));

  // Delete Attachment instance
  getIt.registerLazySingleton<DeleteAttachmentCampaignCubit>(
      () => DeleteAttachmentCampaignCubit(getIt<ApiService>()));

  // Create Campaign Lead instance
  getIt.registerLazySingleton<CreateCampaignLeadCubit>(
      () => CreateCampaignLeadCubit(getIt<ApiService>()));

  // Edit Campaign Lead instance
  getIt.registerLazySingleton<EditCampaignLeadCubit>(
      () => EditCampaignLeadCubit(getIt<ApiService>()));

  // Delete Campaign Lead instance
  getIt.registerLazySingleton<DeleteCampaignLeadCubit>(
      () => DeleteCampaignLeadCubit(getIt<ApiService>()));
}
