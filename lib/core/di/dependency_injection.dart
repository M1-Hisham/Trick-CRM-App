import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/core/api/dio_factory.dart';
import 'package:trick_crm_app/features/leads/create-lead/logic/cubit/create_lead_cubit.dart';
import 'package:trick_crm_app/features/leads/lead-view/Information/logic/cubit/information_cubit.dart';
import 'package:trick_crm_app/features/leads/lead-view/notes/create-note/logic/cubit/create_note_cubit.dart';

import '../../features/auth/login/data/repos/login_repo.dart';
import '../../features/auth/login/logic/cubit/login_cubit.dart';
import '../../features/home/data/repo/dashboard_repo.dart';
import '../../features/leads/lead-view/Campaigns/create-campaigns/logic/cubit/create_campaign_lead_cubit.dart';
import '../../features/leads/lead-view/lead-view/logic/cubit/lead_view_cubit.dart';
import '../../features/leads/lead-view/notes/update-note/logic/cubit/update_note_cubit.dart';
import '../../features/leads/leads/logic/cubit/leads_cubit.dart';
import '../../features/projects/payment-plans/create-payment-plans/logic/cubit/create_payment_plans_cubit.dart';
import '../../features/projects/projects/create-project/logic/cubit/create_project_cubit.dart';
import '../cubits/image_picker_cubit.dart';
import '../cubits/show_fields.cubit.dart';

/// This is the dependency injection file for the app.
final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio Instance
  Dio dio = await DioFactory.getDio();
  // Api Service Instance
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login repo & login cubit instance
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // dashboard repo instance
  getIt.registerLazySingleton<DashboardRepo>(() => DashboardRepo(getIt()));

  /// Leads cubit instance
  getIt
      .registerLazySingleton<LeadsCubit>(() => LeadsCubit(getIt<ApiService>()));

  // leads view cubit instance
  getIt
      .registerFactory<LeadViewCubit>(() => LeadViewCubit(getIt<ApiService>()));

  // leads information cubit instance
  getIt.registerFactory<InformationCubit>(
      () => InformationCubit(getIt<ApiService>()));

  // show fields cubit instance
  getIt.registerLazySingleton<ShowFieldsCubit>(() => ShowFieldsCubit());

  // create lead instance
  getIt.registerLazySingleton<CreateLeadCubit>(
      () => CreateLeadCubit(getIt<ApiService>()));

  // image picker cubit instance
  getIt.registerLazySingleton<ImagePickerCubit>(() => ImagePickerCubit());

  // Create Note instance
  getIt.registerLazySingleton<CreateNoteCubit>(
      () => CreateNoteCubit(getIt<ApiService>()));

  // Update Note instance
  getIt.registerLazySingleton<UpdateNoteCubit>(
      () => UpdateNoteCubit(getIt<ApiService>()));

  // Create Campaign Lead instance
  getIt.registerLazySingleton<CreateCampaignLeadCubit>(
      () => CreateCampaignLeadCubit(getIt<ApiService>()));

  // Create Payment Plans instance
  getIt.registerLazySingleton<CreatePaymentPlansCubit>(
      () => CreatePaymentPlansCubit(getIt<ApiService>()));

  // Create Project instance
  getIt.registerLazySingleton<CreateProjectCubit>(
      () => CreateProjectCubit(getIt<ApiService>()));
}
