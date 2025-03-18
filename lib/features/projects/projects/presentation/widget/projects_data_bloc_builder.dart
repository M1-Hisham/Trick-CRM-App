import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trick_crm_app/features/projects/projects/data/model/projects_model.dart';
import 'package:trick_crm_app/features/projects/projects/logic/cubit/projects_cubit.dart';

import '../../../../../core/cubits/base_state.dart';
import '../../../../../core/resources/resources.dart';
import '../../../../../core/widgets/app_data_table.dart';

class ProjectsDataBlocBuilder extends StatelessWidget {
  const ProjectsDataBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectsCubit, BaseState<ProjectsModel>>(
      buildWhen: (previous, current) => current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
            loading: () => Shimmer.fromColors(
                  baseColor: R.colors.baseColorShimmer,
                  highlightColor: R.colors.highlightColorShimmer,
                  enabled: true,
                  child: const AppDataTable<Projects>(
                    data: [],
                    headers: [],
                    dataExtractors: [],
                  ),
                ),
            success: (ProjectsModel projectsModel) {
              final String? projectMessage = projectsModel.message;
              final projects = projectsModel.projects;
              return AppDataTable<Projects>(
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
              );
            },
            error: (message) => const Center(
                  child: Text('An error occurred, Try again'),
                ),
            orElse: () {
              return const SizedBox.shrink();
            });
      },
    );
  }
}
