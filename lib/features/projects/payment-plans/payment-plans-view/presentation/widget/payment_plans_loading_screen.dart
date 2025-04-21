import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/resources/resources.dart';
import '../../../../../../core/widgets/app_button.dart';
import '../../../../../../core/widgets/app_data_table.dart';
import '../../../../projects/data/model/projects_model.dart';

Widget paymentPlansLoadingScreen() {
  return Shimmer.fromColors(
    baseColor: R.colors.baseColorShimmer,
    highlightColor: R.colors.highlightColorShimmer,
    enabled: true,
    child: Column(
      children: [
        AppButton(
          icon: SvgPicture.asset(R.icons.add),
          text: 'Create Payment Plan',
          onPressed: () {},
        ),
        spacingV(20),
        const AppDataTable<PaymentPlans>(
          data: [],
          headers: [],
          dataExtractors: [],
        ),
      ],
    ),
  );
}
