import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trick_crm_app/core/helpers/spacing.dart';
import 'package:trick_crm_app/core/widgets/app_bar.dart';

import '../../../core/resources/resources.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Project'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 180.w,
              height: 180.h,
              color: R.colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    R.icons.projects,
                  ),
                  spacingH(10),
                  Text(
                    'Projects',
                    style: R.textStyles.font17PrimaryW600.copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 180.w,
              height: 180.h,
              color: R.colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      '%',
                      style: R.textStyles.font17PrimaryW600.copyWith(
                        fontSize: 50.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  spacingH(10),
                  Flexible(
                    child: Text(
                      'Payment Plans',
                      style: R.textStyles.font17PrimaryW600.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
