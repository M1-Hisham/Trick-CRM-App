import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/resources/resources.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_data_table.dart';
import '../../data/model/projects_model.dart';

Widget projectsLoadingScreen() {
  return Shimmer.fromColors(
    baseColor: R.colors.baseColorShimmer,
    highlightColor: R.colors.highlightColorShimmer,
    enabled: true,
    child: Column(
      children: [
        AppButton(
          icon: SvgPicture.asset(R.icons.add),
          text: 'Create Project',
          onPressed: () {},
        ),
        spacingV(20),
        const AppDataTable<Projects>(
          data: [],
          headers: [],
          dataExtractors: [],
        ),
      ],
    ),
  );
}
