import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/resources/resources.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_data_table.dart';
import '../../model/campaigns_model.dart';

Widget campaignScreenLoading() {
  return Shimmer.fromColors(
    baseColor: R.colors.baseColorShimmer,
    highlightColor: R.colors.highlightColorShimmer,
    enabled: true,
    child: Column(
      children: [
        AppButton(
          icon: SvgPicture.asset(R.icons.add),
          text: 'Create Campaign',
          onPressed: () {},
        ),
        spacingV(20),
        const AppDataTable<Campaigns>(
          data: [],
          headers: [],
          dataExtractors: [],
        ),
      ],
    ),
  );
}
