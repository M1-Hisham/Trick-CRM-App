import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../api/api_service.dart';
import '../../api/dio_factory.dart';
import '../../cubits/image_picker_cubit.dart';
import '../../cubits/show_fields.cubit.dart';
import '../../cubits/user_cubit.dart';
import '../auth/auth_module.dart';
import '../brokers/brokers_module.dart';
import '../calls/calls_module.dart';
import '../campaigns/campaigns_module.dart';
import '../clients/client_module.dart';
import '../contacts/contact_module.dart';
import '../dashboard/dashboard_module.dart';
import '../deals/deals_module.dart';
import '../leads/leads_module.dart';
import '../meetings/meetings_module.dart';
import '../payment-plans/payment_plans_module.dart';
import '../projects/projects_module.dart';
import '../tasks/tasks_module.dart';

/// This is the dependency injection file for the app.
final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio Instance
  Dio dio = await DioFactory.getDio();

  // User Data Cubit Instance
  getIt.registerLazySingleton<UserCubit>(() => UserCubit()..loadUserData());

  // Api Service Instance
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // image picker cubit instance
  getIt.registerLazySingleton<ImagePickerCubit>(() => ImagePickerCubit());

  // show fields cubit instance
  getIt.registerLazySingleton<ShowFieldsCubit>(() => ShowFieldsCubit());

  // Auth Module Instance
  setupAuthModule();

  // Dashboard module instance
  setupDashboardModule();

  // Leads module instance
  setupLeadsModule();

  // Contacts module instance
  setupContactModule();

  // Client module instance
  setupClientModule();

  // Tasks module instance
  setupTasksModule();

  // Meetings module instance
  setupMeetingsModule();

  // Calls module instance
  setupCallsModule();

  // Campaigns module instance
  setupCampaignsModule();

  //Payment Plans module instance
  setupPaymentPlansModule();

  //Projects module instance
  setupProjectsModule();

  // Deal module instance
  setupDealsModule();

  // Broker module instance
  setupBrokersModule();
}
