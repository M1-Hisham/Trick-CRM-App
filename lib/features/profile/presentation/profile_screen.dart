import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trick_crm_app/core/cubits/menu_cubit.dart';
import 'package:trick_crm_app/features/profile/presentation/widgets/user_details.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/resources/resources.dart';
import '../../auth/logout/logout.dart';
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
                      () {},
                    ),
                    buildButton(
                      'Password & Security',
                      R.icons.lock,
                      () {},
                    ),
                    buildButton(
                      'Company',
                      R.icons.company,
                      () {},
                    ),
                    buildButton(
                      'Subscription',
                      R.icons.subscription,
                      () {},
                    ),
                    buildButton(
                      'Recycle Bin',
                      R.icons.recycleBin,
                      () {},
                    ),
                    buildButton(
                      'Support',
                      R.icons.support,
                      () {},
                    ),
                    buildButton(
                      'Administration',
                      R.icons.administration,
                      () {},
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
