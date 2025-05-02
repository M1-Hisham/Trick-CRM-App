import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/resources/resources.dart';
import '../../../../../../core/widgets/app_button.dart';
import '../../../../../../core/widgets/app_text_form_field.dart';

loadingCompanyScreen() {
  return Column(
    children: [
      spacingV(20),
      Center(
        child: CircleAvatar(
          radius: 110.dg,
          backgroundColor: R.colors.secGray,
        ),
      ),
      Text(
        'Company Name',
        style: R.textStyles.font20ShadowGray29W500,
      ),
      spacingV(40),
      AppTextFormField(
        hintText: 'Company Name',
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
        hintText: 'Website',
        fillColor: R.colors.gray,
      ),
      spacingV(20),
      AppTextFormField(
        hintText: 'Industry',
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
