import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/cubits/menu_cubit.dart';
import 'package:trick_crm_app/core/di/setup-di/dependency_injection.dart';
import 'package:trick_crm_app/core/helpers/show_snack_bar.dart';
import 'package:trick_crm_app/features/profile/Subscription/logic/cubit/subscription_cubit.dart';
import 'package:trick_crm_app/features/profile/presentation/widgets/user_details.dart';

import '../../../core/api/api_service.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/resources/resources.dart';
import '../../auth/logout/logout.dart';
import '../Company/company-view/logic/cubit/company_cubit.dart';
import '../Company/company-view/presentation/company_screen.dart';
import '../Subscription/presentation/subscription_screen.dart';
import 'widgets/build_button.dart';
import 'widgets/profile_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = MenuCubit.get(context);

    return GestureDetector(
      onTap: () {
        cubit.closeMenu();
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                const ProfileBar(),
                Padding(
                  padding: EdgeInsets.only(top: 120.h),
                  child: userDetails(
                    context: context,
                    radius: 110,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(22),
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 1.5),
                  end: Offset.zero,
                ).animate(CurvedAnimation(
                  parent: ModalRoute.of(context)!.animation!,
                  curve: Curves.linear,
                )),
                child: Column(
                  children: [
                    buildButton(
                      'General Info',
                      R.icons.generalInfo,
                      () {
                        showSnackBar(context, 'Coming! Soon');
                      },
                    ),
                    buildButton(
                      'Password & Security',
                      R.icons.lock,
                      () {
                        showSnackBar(context, 'Coming! Soon');
                      },
                    ),
                    buildButton(
                      'Company',
                      R.icons.company,
                      () {
                        Get.to(
                          () => BlocProvider(
                            create: (context) =>
                                CompanyCubit(getIt<ApiService>())..getData(),
                            child: CompanyScreen(),
                          ),
                        );
                      },
                    ),
                    buildButton(
                      'Subscription',
                      R.icons.subscription,
                      () {
                        Get.to(
                          () => BlocProvider(
                            create: (context) =>
                                SubscriptionCubit(getIt<ApiService>())
                                  ..getData(),
                            child: const SubscriptionScreen(),
                          ),
                        );
                      },
                    ),
                    buildButton(
                      'Recycle Bin',
                      R.icons.recycleBin,
                      () {
                        showSnackBar(context, 'Coming! Soon');
                      },
                    ),
                    buildButton(
                      'Support',
                      R.icons.support,
                      () {
                        showSnackBar(context, 'Coming! Soon');
                      },
                    ),
                    buildButton(
                      'Administration',
                      R.icons.administration,
                      () {
                        showSnackBar(context, 'Coming! Soon');
                      },
                    ),
                    spacingV(16),
                    const Logout(),
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
