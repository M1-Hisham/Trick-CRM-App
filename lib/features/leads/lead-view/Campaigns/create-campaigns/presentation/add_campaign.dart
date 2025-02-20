import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/helpers/spacing.dart';
import 'package:trick_crm_app/core/widgets/app_button.dart';
import 'package:trick_crm_app/core/widgets/app_selection_form_field.dart';
import 'package:trick_crm_app/core/widgets/app_top_bar_dialog.dart';

import '../../../../../../core/resources/resources.dart';

class AddCampaign extends StatelessWidget {
  const AddCampaign({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        appTopBarDialog('Add New Campaign'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Create a new lead campaign',
                style: R.textStyles.font17PrimaryW600,
              ),
              spacingV(20),
              AppSelectionFormField(
                labelText: 'Campaign Name',
                selections: const ['selections'],
                onSaved: (value) {},
              ),
              spacingV(20),
              AppSelectionFormField(
                labelText: 'Status',
                selections: const [
                  'Planned',
                  'Invited',
                  'Sent',
                  'Opened',
                  'Responded',
                  'Bounced',
                  'Opted Out',
                ],
                onSaved: (value) {},
              ),
              spacingV(20),
              Row(
                children: [
                  Expanded(
                    child: AppButton(
                      text: 'Done',
                      onPressed: () {},
                    ),
                  ),
                  spacingH(10),
                  Expanded(
                    child: AppButton(
                      text: "Cancel",
                      textStyle: R.textStyles.font14DimGrayW400.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                      onPressed: Get.back,
                      backgroundColor: R.colors.white,
                      borderColor: const Color(0xffC8C8C8),
                      overlayColor: R.colors.primaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
