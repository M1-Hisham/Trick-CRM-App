import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trick_crm_app/core/cubits/menu_cubit.dart';
import 'package:trick_crm_app/core/helpers/show_snack_bar.dart';

import '../../../../core/helpers/shaerd_pref_helper.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/resources/resources.dart';
import '../../../auth/login/data/models/login_response.dart';

class HomeBar extends StatelessWidget {
  const HomeBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: Offset.fromDirection(-4.8, -4.8),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: ModalRoute.of(context)!.animation!,
        curve: Curves.linearToEaseOut,
      )),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: R.colors.primaryColor,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(35),
            bottomRight: Radius.circular(35),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 10.h),
          child: SafeArea(
            child: BlocBuilder<MenuCubit, bool>(
              builder: (context, state) {
                final cubit = MenuCubit.get(context);

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (cubit.isOpenOrClose) ...[
                      SvgPicture.asset(
                        R.icons.notification,
                        width: 32.w,
                        height: 32.h,
                      ),
                      spacingV(115),
                    ] else ...[
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              cubit.toggleMenu();
                            },
                            child: SvgPicture.asset(
                              R.icons.openMenu,
                              width: 35.w,
                              height: 25.h,
                            ),
                          ),
                          spacingH(16),
                          Hero(
                            tag: 'logo',
                            child: Image.asset(
                              R.icons.logoMenu,
                              // width: 122.w,
                              height: 49.h,
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              showSnackBar(context, 'Coming soon!');
                            },
                            child: SvgPicture.asset(
                              R.icons.notification,
                              width: 32.w,
                              height: 32.h,
                            ),
                          ),
                        ],
                      ),
                      spacingV(25),
                      _userBar(),
                      spacingV(10),
                    ]
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  FutureBuilder _userBar() {
    return FutureBuilder(
      future: SharedPrefHelper.getUser(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final UserData userData = snapshot.data!;
          return Row(
            children: [
              CircleAvatar(
                  radius: 35.r,
                  backgroundColor: R.colors.transparent,
                  backgroundImage: NetworkImage(
                    userData.avatar ?? '',
                  ),
                  onBackgroundImageError: (context, error) {
                    if (error.toString().contains("Failed host lookup")) {
                      Image.asset(R.icons.imageUserError);
                    }
                    Image.asset(R.icons.imageUserError);
                  }),
              spacingH(14),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello! Welcome back!",
                    style: R.textStyles.font14WhiteW500,
                  ),
                  spacingV(1.5),
                  Text(
                    userData.name ?? "",
                    style: R.textStyles.font18WhiteW600,
                  ),
                ],
              ),
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
