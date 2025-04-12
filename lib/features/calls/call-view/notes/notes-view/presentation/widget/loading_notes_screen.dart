import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../core/helpers/loading_shimmer.dart';
import '../../../../../../../core/helpers/spacing.dart';
import '../../../../../../../core/resources/resources.dart';
import '../../../../../../../core/widgets/app_button.dart';
import '../../../../../../../core/widgets/app_text_form_field.dart';

Widget loadingNotesScreen() {
  return loadingShimmer(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppButton(
          icon: SvgPicture.asset(R.icons.add),
          text: 'Add Note',
          onPressed: () {},
        ),
        spacingV(20),
        Text(
          'Notes',
          style: R.textStyles.font17PrimaryW600,
        ),
        spacingV(10),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 1,
          itemBuilder: (context, index) {
            return Column(
              children: [
                AppTextFormField(
                  isclickable: false,
                  hintText: '',
                  labelText: 'Note',
                  controller: TextEditingController(
                    text: '-',
                  ),
                  style: TextStyle(
                    color: R.colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                spacingV(25),
              ],
            );
          },
        ),
      ],
    ),
  );
}
