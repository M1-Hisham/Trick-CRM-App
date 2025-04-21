import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../core/helpers/spacing.dart';
import '../../../../../../../core/resources/resources.dart';
import '../../../../../../../core/widgets/app_button.dart';

Widget loadingAttachmentScreen() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      AppButton(
        icon: SvgPicture.asset(
          R.icons.add,
        ),
        text: 'Add Attachment',
        onPressed: () {},
      ),
      spacingV(20),
      Text(
        'Attachments',
        style: R.textStyles.font17PrimaryW600,
      ),
      spacingV(20),
      const Center(child: Text("No attachments")),
    ],
  );
}
