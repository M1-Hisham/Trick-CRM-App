import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/features/campaigns/create-campaign/logic/cubit/create_campaign_cubit.dart';

import '../../../features/campaigns/campaign-view/campaign-view/logic/cubit/campaign_view_cubit.dart';
import '../setup-di/dependency_injection.dart';

void setupCampaignsModule() {
  // Create Campaign instance
  getIt.registerLazySingleton<CreateCampaignCubit>(
      () => CreateCampaignCubit(getIt<ApiService>()));

  // Information Campaign View instance
  getIt.registerLazySingleton<CampaignViewCubit>(
      () => CampaignViewCubit(getIt<ApiService>()));
}
