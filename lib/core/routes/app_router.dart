import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/cubits/menu_cubit.dart';
import 'package:trick_crm_app/features/deals/logic/cubit/deals_cubit.dart';
import 'package:trick_crm_app/features/deals/presentation/deals_screen.dart';

import '../../features/Base-view/base_view_screen.dart';
import '../../features/auth/login/logic/cubit/login_cubit.dart';
import '../../features/auth/login/presentation/screens/login_screen.dart';
import '../../features/brokers/logic/cubit/brokers_cubit.dart';
import '../../features/brokers/presentation/brokers_screen.dart';
import '../../features/calls/logic/cubit/calls_cubit.dart';
import '../../features/calls/presentation/calls_screen.dart';
import '../../features/campaigns/logic/cubit/campaigns_cubit.dart';
import '../../features/campaigns/presentation/campaigns_screen.dart';
import '../../features/clients/clients/logic/cubit/clients_cubit.dart';
import '../../features/clients/clients/presentation/screen/clients.dart';
import '../../features/contacts/contacts/logic/cubit/contacts_cubit.dart';
import '../../features/contacts/contacts/presentation/contacts_screen.dart';
import '../../features/home/logic/cubit/dashboard_cubit.dart';
import '../../features/leads/leads/logic/cubit/leads_cubit.dart';
import '../../features/leads/leads/presentation/screens/leads_screen.dart';
import '../../features/meetings/logic/cubit/meetings_cubit.dart';
import '../../features/meetings/presentation/meetings_screen.dart';
import '../../features/projects/presentation/project_screen.dart';
import '../../features/splash/splash_screen.dart';
import '../../features/tasks/logic/cubit/tasks_cubit.dart';
import '../../features/tasks/presentation/tasks_screen.dart';
import '../api/api_service.dart';
import '../di/dependency_injection.dart';
import 'routes.dart';

/// App Router class for the app
abstract class AppRouter {
  static final List<GetPage> routes = [
    GetPage(name: RoutesNames.splashScreen, page: () => const SplashScreen()),
    GetPage(
      name: RoutesNames.login,
      page: () => BlocProvider(
        create: (context) => getIt<LoginCubit>(),
        child: const LoginScreen(),
      ),
      transitionDuration: const Duration(milliseconds: 1400),
    ),
    GetPage(
      name: RoutesNames.baseView,
      page: () => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => DashboardCubit(getIt())..getDashboard(),
          ),
          BlocProvider(
            create: (context) => MenuCubit(),
          ),
        ],
        child: const BaseViewScreen(),
      ),
      transitionDuration: const Duration(milliseconds: 1200),
    ),
    // GetPage(
    //   name: RoutesNames.home,
    //   page: () => BlocProvider(
    //     create: (context) => DashboardCubit(getIt())..getDashboard(),
    //     child: const HomeScreen(),
    //   ),
    //   transitionDuration: const Duration(milliseconds: 1200),
    // ),
    // GetPage(
    //   name: RoutesNames.wallet,
    //   page: () => const WalletScreen(),
    //   // transitionDuration: const Duration(milliseconds: 1200),
    // ),
    // GetPage(
    //   name: RoutesNames.profile,
    //   page: () => const ProfileScreen(),
    //   // transitionDuration: const Duration(milliseconds: 1200),
    // ),
    // GetPage(
    //   name: RoutesNames.brokers,
    //   page: () => BlocProvider(
    //     create: (context) => BrokersCubit(getIt<ApiService>())..getData(),
    //     child: const BrokersScreen(),
    //   ),
    // ),
    GetPage(
      name: RoutesNames.leads,
      page: () => BlocProvider(
        create: (context) => LeadsCubit(getIt<ApiService>())..getData(),
        child: const LeadsScreen(),
      ),
    ),
    GetPage(
      name: RoutesNames.clients,
      page: () => BlocProvider(
        create: (context) => ClientsCubit(getIt<ApiService>())..getData(),
        child: const Clients(),
      ),
    ),
    GetPage(
      name: RoutesNames.contacts,
      page: () => BlocProvider(
        create: (context) => ContactsCubit(getIt<ApiService>())..getData(),
        child: const ContactsScreen(),
      ),
    ),
    GetPage(
      name: RoutesNames.campaigns,
      page: () => BlocProvider(
        create: (context) => CampaignsCubit(getIt<ApiService>())..getData(),
        child: const CampaignsScreen(),
      ),
    ),
    GetPage(
      name: RoutesNames.tasks,
      page: () => BlocProvider(
        create: (context) => TasksCubit(getIt<ApiService>())..getData(),
        child: const TasksScreen(),
      ),
    ),
    GetPage(
      name: RoutesNames.meetings,
      page: () => BlocProvider(
        create: (context) => MeetingsCubit(getIt<ApiService>())..getData(),
        child: const MeetingsScreen(),
      ),
    ),
    GetPage(
      name: RoutesNames.calls,
      page: () => BlocProvider(
        create: (context) => CallsCubit(getIt<ApiService>())..getData(),
        child: const CallsScreen(),
      ),
    ),
    GetPage(
      name: RoutesNames.deals,
      page: () => BlocProvider(
        create: (context) => DealsCubit(getIt<ApiService>())..getData(),
        child: const DealsScreen(),
      ),
    ),
    GetPage(
      name: RoutesNames.project,
      page: () => const ProjectScreen(),
    ),
    GetPage(
      name: RoutesNames.brokers,
      page: () => BlocProvider(
        create: (context) => BrokersCubit(getIt<ApiService>())..getData(),
        child: const BrokersScreen(),
      ),
    ),
  ];
}
