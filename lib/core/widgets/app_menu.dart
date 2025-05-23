import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/cubits/menu_cubit.dart';
import '../../features/auth/login/data/models/login_response.dart';
import '../helpers/shaerd_pref_helper.dart';
import '../helpers/spacing.dart';
import '../resources/resources.dart';
import '../routes/routes.dart';

class AppMenu extends StatelessWidget {
  final Function? onTapProfile;
  const AppMenu({super.key, this.onTapProfile});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: R.colors.white,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  BlocBuilder<MenuCubit, bool>(
                    builder: (context, state) {
                      final cubit = MenuCubit.get(context);

                      return GestureDetector(
                        onTap: () {
                          cubit.toggleMenu();
                        },
                        child: SvgPicture.asset(
                          R.icons.closeMenu,
                          width: 60.w,
                          height: 35.h,
                        ),
                      );
                    },
                  ),
                  spacingH(16),
                  Image.asset(
                    R.icons.logoMenu,
                    color: R.colors.primaryColor,
                    // width: 122.w,
                    height: 49.h,
                  ),
                ],
              ),
              spacingV(25),
              _userMenu(onTapProfile),
              spacingV(35),
              ..._menuList(),
            ],
          ),
        ),
      ),
    );
  }

  FutureBuilder _userMenu(onTap) {
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
              spacingH(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userData.name ?? "",
                    style: R.textStyles.font18WhiteW600.copyWith(
                      color: R.colors.black,
                    ),
                  ),
                  spacingV(1.5),
                  GestureDetector(
                    onTap: onTap,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "View Profile",
                        style: R.textStyles.font12PrimaryColorW500.copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: R.colors.primaryColor,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
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

  List<Widget> _menuList() {
    List<Widget> menuItems = [];
    Map<String, String> menuRoutes = {
      // 'Dashboard': RoutesNames.home,
      'Contacts': RoutesNames.contacts,
      'Leads': RoutesNames.leads,
      'Clients': RoutesNames.clients,
      'Campaigns': RoutesNames.campaigns,
      'Tasks': RoutesNames.tasks,
      'Meetings': RoutesNames.meetings,
      'Calls': RoutesNames.calls,
      'Deals': RoutesNames.deals,
      'Projects': RoutesNames.project,
      'Brokers': RoutesNames.brokers,
      'Reports': RoutesNames.reports,
      //? more routes here
    };
    for (MapEntry menus in R.icons.iconsMenu.entries) {
      String? routeName = menuRoutes[menus.key];
      menuItems.add(
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: GestureDetector(
              onTap: routeName != null
                  ? () {
                      Get.toNamed(routeName);
                    }
                  : null,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    menus.value,
                    width: 27.w,
                    height: 27.h,
                  ),
                  spacingH(16),
                  Flexible(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        menus.key,
                        style: R.textStyles.font20ShadowGray29W500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
      menuItems.add(spacingV(18));
    }
    return menuItems;
  }
}
