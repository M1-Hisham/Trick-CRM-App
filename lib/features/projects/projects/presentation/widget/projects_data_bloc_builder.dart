import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trick_crm_app/features/projects/projects/data/model/projects_model.dart';
import 'package:trick_crm_app/features/projects/projects/logic/cubit/projects_cubit.dart';

import '../../../../../core/cubits/base_state.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/resources/resources.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_data_table.dart';
import '../../create-project/presentation/create_project_screen.dart';
import 'projects_loading_screen.dart';

class ProjectsDataBlocBuilder extends StatelessWidget {
  const ProjectsDataBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectsCubit, BaseState<ProjectsModel>>(
      buildWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
            loading: () => projectsLoadingScreen(),
            success: (ProjectsModel projectsModel) {
              final String? projectMessage = projectsModel.message;
              final projects = projectsModel.projects;
              final paymentPlans = projectsModel.paymentPlans;
              return Column(
                children: [
                  AppButton(
                    icon: SvgPicture.asset(R.icons.add),
                    text: 'Create Project',
                    onPressed: () async {
                      final result = await showDialog(
                        useSafeArea: false,
                        context: context,
                        builder: (context) => CreateProjectScreen(
                          paymentPlans: paymentPlans ?? [],
                        ),
                      );
                      if (result == true) {
                        // Refresh the data after creating a new call
                        // ignore: use_build_context_synchronously
                        context.read<ProjectsCubit>().getData();
                      }
                    },
                  ),
                  spacingV(20),
                  AppDataTable<Projects>(
                    dataMessage: projectMessage,
                    data: projects ?? [],
                    headers: const [
                      "Project Id",
                      "Project Name",
                      "Size",
                      "Location",
                    ],
                    dataExtractors: [
                      (project) => project.id.toString(),
                      (project) => project.name ?? '',
                      (project) => project.size ?? '',
                      (project) => project.location ?? '',
                    ],
                    dataIdExtractor: (project) => (project.id ?? 0).toString(),
                    // dataLeadNameExtractor: (project) => project.leadName ?? '_',
                    onViewDetails: (id, leadName) {
                      // Get.toNamed(
                      //   RoutesNames.leadsView,
                      //   arguments: id != '' ? int.parse(id) : 0,
                      // );
                    },
                  ),
                ],
              );
            },
            error: (message) => Center(
                  child: Column(
                    children: [
                      const Text('An error occurred, Try again'),
                      spacingV(10),
                      const Icon(
                        Icons.error,
                        color: Colors.red,
                      ),
                      spacingV(10),
                      const Text('Please check your internet connection'),
                      spacingV(10),
                      const Text('Or try again later'),
                      spacingV(10),
                      const Text('If the problem persists, contact support'),
                      spacingV(10),
                      Text('Error: $message'),
                      spacingV(10),
                      AppButton(
                        text: 'Retry',
                        onPressed: () {
                          context.read<ProjectsCubit>().getData();
                        },
                      ),
                    ],
                  ),
                ),
            orElse: () {
              return const SizedBox.shrink();
            });
      },
    );
  }
}
