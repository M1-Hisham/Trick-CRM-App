import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/core/api/dio_factory.dart';
import 'package:trick_crm_app/features/calls/call-view/Information/logic/cubit/info_call_view_cubit.dart';
import 'package:trick_crm_app/features/calls/create-call/logic/cubit/create_call_cubit.dart';
import 'package:trick_crm_app/features/clients/client-view/Information/logic/cubit/info_client_view_cubit.dart';
import 'package:trick_crm_app/features/contacts/contact-view/Information/logic/cubit/info_contact_view_cubit.dart';
import 'package:trick_crm_app/features/deals/deal-view/Information/logic/cubit/info_deal_view_cubit.dart';
import 'package:trick_crm_app/features/leads/create-lead/logic/cubit/create_lead_cubit.dart';
import 'package:trick_crm_app/features/leads/lead-view/Information/logic/cubit/information_cubit.dart';
import 'package:trick_crm_app/features/leads/lead-view/notes/create-note/logic/cubit/create_note_cubit.dart';
import 'package:trick_crm_app/features/tasks/task-view/Information/logic/cubit/info_task_view_cubit.dart';

import '../../features/auth/login/data/repos/login_repo.dart';
import '../../features/auth/login/logic/cubit/login_cubit.dart';
import '../../features/brokers/create-broker/logic/cubit/create_broker_cubit.dart';
import '../../features/campaigns/create-campaign/logic/cubit/create_campaign_cubit.dart';
import '../../features/clients/create-client/logic/cubit/create_client_cubit.dart';
import '../../features/contacts/create-contacts/logic/cubit/create_contact_cubit.dart';
import '../../features/deals/create-deal/logic/cubit/create_deal_cubit.dart';
import '../../features/home/data/repo/dashboard_repo.dart';
import '../../features/leads/lead-view/Campaigns/create-campaigns/logic/cubit/create_campaign_lead_cubit.dart';
import '../../features/leads/lead-view/lead-view/logic/cubit/lead_view_cubit.dart';
import '../../features/leads/lead-view/notes/update-note/logic/cubit/update_note_cubit.dart';
import '../../features/leads/leads/logic/cubit/leads_cubit.dart';
import '../../features/meetings/create-meeting/logic/cubit/create_meeting_cubit.dart';
import '../../features/meetings/meeting-view/Information/logic/cubit/info_meeting_view_cubit.dart';
import '../../features/projects/payment-plans/create-payment-plans/logic/cubit/create_payment_plans_cubit.dart';
import '../../features/projects/projects/create-project/logic/cubit/create_project_cubit.dart';
import '../../features/tasks/create-task/logic/cubit/create_task_cubit.dart';
import '../cubits/image_picker_cubit.dart';
import '../cubits/show_fields.cubit.dart';
import '../cubits/user_cubit.dart';

/// This is the dependency injection file for the app.
final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio Instance
  Dio dio = await DioFactory.getDio();

  // User Data Cubit Instance
  getIt.registerLazySingleton<UserCubit>(() => UserCubit()..loadUserData());

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

  // Contacts instance
  // getIt.registerFactory<ContactsCubit>(
  //   () => ContactsCubit(getIt<ApiService>()),
  // );

  // Create Contact instance
  getIt.registerLazySingleton<CreateContactCubit>(
      () => CreateContactCubit(getIt<ApiService>()));

  // Information Contact View instance
  getIt.registerLazySingleton<InfoContactViewCubit>(
      () => InfoContactViewCubit(getIt<ApiService>()));

  // Create Client instance
  getIt.registerLazySingleton<CreateClientCubit>(
      () => CreateClientCubit(getIt<ApiService>()));

  // Information Client View instance
  getIt.registerLazySingleton<InfoClientViewCubit>(
      () => InfoClientViewCubit(getIt<ApiService>()));

  // Create Task instance
  getIt.registerLazySingleton<CreateTaskCubit>(
      () => CreateTaskCubit(getIt<ApiService>()));

  // Information Task View instance
  getIt.registerLazySingleton<InfoTaskViewCubit>(
      () => InfoTaskViewCubit(getIt<ApiService>()));

  // Create Meeting instance
  getIt.registerLazySingleton<CreateMeetingCubit>(
      () => CreateMeetingCubit(getIt<ApiService>()));

  // Information Meeting View instance
  getIt.registerLazySingleton<InfoMeetingViewCubit>(
      () => InfoMeetingViewCubit(getIt<ApiService>()));

  // Create Calls instance
  getIt.registerLazySingleton<CreateCallCubit>(
      () => CreateCallCubit(getIt<ApiService>()));

  // Information Call View instance
  getIt.registerLazySingleton<InfoCallViewCubit>(
      () => InfoCallViewCubit(getIt<ApiService>()));

  // Create Campaign Lead instance
  getIt.registerLazySingleton<CreateCampaignLeadCubit>(
      () => CreateCampaignLeadCubit(getIt<ApiService>()));

  // Create Payment Plans instance
  getIt.registerLazySingleton<CreatePaymentPlansCubit>(
      () => CreatePaymentPlansCubit(getIt<ApiService>()));

  // Create Project instance
  getIt.registerLazySingleton<CreateProjectCubit>(
      () => CreateProjectCubit(getIt<ApiService>()));

  // Create Campaign instance
  getIt.registerLazySingleton<CreateCampaignCubit>(
      () => CreateCampaignCubit(getIt<ApiService>()));

  // Create Deal instance
  getIt.registerLazySingleton<CreateDealCubit>(
      () => CreateDealCubit(getIt<ApiService>()));

  // Information Deal View instance
  getIt.registerLazySingleton<InfoDealViewCubit>(
      () => InfoDealViewCubit(getIt<ApiService>()));

  // Create Broker instance
  getIt.registerLazySingleton<CreateBrokerCubit>(
      () => CreateBrokerCubit(getIt<ApiService>()));
}
