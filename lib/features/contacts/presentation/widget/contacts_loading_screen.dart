import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_data_table.dart';
import '../../data/contacts_model.dart';

Widget contactsLoadingScreen() {
  return Shimmer.fromColors(
    baseColor: R.colors.baseColorShimmer,
    highlightColor: R.colors.highlightColorShimmer,
    enabled: true,
    child: Column(
      children: [
        AppButton(
          icon: SvgPicture.asset(R.icons.add),
          text: 'Create Contacts',
          onPressed: () {},
        ),
        spacingV(20),
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
        const AppDataTable<Contacts>(
          data: [],
          headers: [],
          dataExtractors: [],
        ),
      ],
    ),
  );
}
