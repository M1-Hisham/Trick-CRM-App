import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/widgets/app_button.dart';
import 'package:trick_crm_app/core/widgets/app_top_bar_dialog.dart';
import 'package:trick_crm_app/core/widgets/app_upload_image.dart';

import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/resources/resources.dart';

class AddAttachmentScreen extends StatelessWidget {
  const AddAttachmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          appTopBarDialog('Add New Attachment'),
          spacingV(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Attachment',
                  style: R.textStyles.font17PrimaryW600,
                ),
                spacingV(20),
                Center(
                  child: AppUploadImage(
                    onImageSelected: (file) {
                      log('File: $file');
                    },
                  ),
                ),
                spacingV(20),
                Center(
                  child: Text(
                    'Add New Attachment',
                    style: R.textStyles.font14DimGrayW400,
                  ),
                ),
                spacingV(30),
                Row(
                  children: [
                    Expanded(
                      child: AppButton(
                        icon: SvgPicture.asset(
                          R.icons.add,
                        ),
                        text: 'Add',
                        onPressed: () {},
                      ),
                    ),
                    spacingH(10),
                    Expanded(
                      child: AppButton(
                        text: 'Cancel',
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
