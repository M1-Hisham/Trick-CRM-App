import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trick_crm_app/core/helpers/show_snack_bar.dart';
import 'package:trick_crm_app/core/resources/resources.dart';
import 'package:trick_crm_app/core/widgets/app_bar.dart';

class AdministrationScreen extends StatelessWidget {
  const AdministrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Administration'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                showSnackBar(context, 'Comming Soon!');
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Card(
                  color: R.colors.white,
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 9.0),
                      // Logo and Name
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // Logo
                          Padding(
                            padding: EdgeInsets.only(right: 12.w),
                            child: Padding(
                              padding: const EdgeInsets.all(14),
                              child: SvgPicture.asset(
                                R.icons.userDepartment,
                                width: 32.w,
                                height: 32.h,
                              ),
                            ),
                          ),
                          // Name
                          Flexible(
                            child: Text(
                              'User & Department',
                              style:
                                  R.textStyles.font20ShadowGray29W500.copyWith(
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF333333),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                showSnackBar(context, 'Comming Soon!');
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Card(
                  color: R.colors.white,
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 9.0),
                      // Logo and Name
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // Logo
                          Padding(
                            padding: EdgeInsets.only(right: 12.w),
                            child: Padding(
                              padding: const EdgeInsets.all(14),
                              child: SvgPicture.asset(
                                R.icons.roles,
                                width: 32.w,
                                height: 32.h,
                              ),
                            ),
                          ),
                          // Name
                          Flexible(
                            child: Text(
                              'Roles',
                              style:
                                  R.textStyles.font20ShadowGray29W500.copyWith(
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF333333),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
