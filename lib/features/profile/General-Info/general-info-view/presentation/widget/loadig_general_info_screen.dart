import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/resources/resources.dart';
import '../../../../../../core/widgets/app_button.dart';
import '../../../../../../core/widgets/app_text_form_field.dart';

Widget loadingGeneralInfoScreen() {
  return Column(
    children: [
      spacingV(10),
      Center(
        child: CircleAvatar(
          radius: 110.dg,
          backgroundColor: R.colors.secGray,
        ),
      ),
      spacingV(20),
      Text(
        'Name',
        style: R.textStyles.font20ShadowGray29W500,
      ),
      spacingV(40),
      AppTextFormField(
        hintText: 'Full Name',
        fillColor: R.colors.gray,
      ),
      spacingV(20),
      AppTextFormField(
        hintText: 'Email',
        fillColor: R.colors.gray,
      ),
      spacingV(20),
      AppTextFormField(
        hintText: 'Phone Number',
        fillColor: R.colors.gray,
      ),
      spacingV(20),
      AppTextFormField(
        hintText: 'Job Title',
        fillColor: R.colors.gray,
      ),
      spacingV(20),
      AppTextFormField(
        hintText: 'Country/Region',
        fillColor: R.colors.gray,
      ),
      spacingV(20),
      AppTextFormField(
        hintText: 'Address',
        fillColor: R.colors.gray,
      ),
      spacingV(30),
      AppButton(
        text: "Save Change",
        onPressed: () {},
      ),
      spacingV(30),
    ],
  );
}
