import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/core/di/setup-di/dependency_injection.dart';
import 'package:trick_crm_app/core/helpers/show_snack_bar.dart';
import 'package:trick_crm_app/features/Reports/Projects-Report/project-pending-units/data/model/project_pending_units_model.dart';
import 'package:trick_crm_app/features/Reports/Projects-Report/logic/cubit/get_projects_reports_cubit.dart';

import '../../../../core/widgets/app_bar.dart';
import '../../../../core/widgets/app_card_feat_view.dart';
import '../project-pending-units/presentation/project_pending_units_screen.dart';

class ProjectsReportsViewScreen extends StatelessWidget {
  const ProjectsReportsViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Projects Reports"),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              // Show Cards
              appCardFeatView(
                title: 'Project Available Units',
                onTap: () {
                  showSnackBar(context, "Coming Soon");
                },
              ),
              appCardFeatView(
                title: 'Project Pending Units',
                onTap: () {
                  Get.to(
                    () => BlocProvider(
                      create: (context) =>
                          GetProjectsReportsCubit<ProjectPendingUnitsModel>(
                        apiService: getIt<ApiService>(),
                        fromJson: ProjectPendingUnitsModel.fromJson,
                      )..getProjectReport("ProjectPendingUnits"),
                      child: const ProjectPendingUnitsScreen(),
                    ),
                  );
                },
              ),
              appCardFeatView(
                title: 'Project Not Available Units',
                onTap: () {
                  showSnackBar(context, "Coming Soon");
                },
              ),
              appCardFeatView(
                title: 'Project Sold Units Income',
                onTap: () {
                  showSnackBar(context, "Coming Soon");
                },
              ),
              appCardFeatView(
                title: 'Units Sales By Person',
                onTap: () {
                  showSnackBar(context, "Coming Soon");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
