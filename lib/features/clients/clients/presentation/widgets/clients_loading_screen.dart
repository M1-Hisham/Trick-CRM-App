import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trick_crm_app/features/clients/clients/data/model/clients_model.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/resources/resources.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_data_table.dart';

Widget clientsLoadingScreen() {
  return Shimmer.fromColors(
    baseColor: R.colors.baseColorShimmer,
    highlightColor: R.colors.highlightColorShimmer,
    enabled: true,
    child: Column(
      children: [
        AppButton(
          icon: SvgPicture.asset(R.icons.add),
          text: 'Create Client',
          onPressed: () {},
        ),
        spacingV(13),
        Row(
          children: [
            Expanded(
              child: AppButton(
                icon: SvgPicture.asset(R.icons.importOptions),
                text: 'Import Options',
                onPressed: () {},
              ),
            ),
            spacingH(8),
            Expanded(
              child: AppButton(
                icon: SvgPicture.asset(R.icons.exportOptions),
                text: 'Export Options',
                onPressed: () {},
              ),
            ),
          ],
        ),
        spacingV(20),
        const AppDataTable<Clients>(
          data: [],
          headers: [],
          dataExtractors: [],
        ),
      ],
    ),
  );
}
