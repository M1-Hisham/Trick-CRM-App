import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/helpers/spacing.dart';
import 'package:trick_crm_app/core/widgets/app_bar.dart';
import 'package:trick_crm_app/features/projects/payment-plans/payment-plans-view/logic/cubit/payment_plans_cubit.dart';

import '../../../core/di/dependency_injection.dart';
import '../../../core/resources/resources.dart';
import '../payment-plans/payment-plans-view/presentation/payment_plans_screen.dart';
import '../projects/logic/cubit/projects_cubit.dart';
import '../projects/presentation/projects_screen.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Project'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                Get.to(() => BlocProvider(
                      create: (context) => ProjectsCubit(getIt())..getData(),
                      child: const ProjectsScreen(),
                    ));
              },
              child: Container(
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
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => BlocProvider(
                      create: (context) =>
                          PaymentPlansCubit(getIt())..getData(),
                      child: const PaymentPlansScreen(),
                    ));
              },
              child: Container(
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
            ),
          ],
        ),
      ),
    );
  }
}
