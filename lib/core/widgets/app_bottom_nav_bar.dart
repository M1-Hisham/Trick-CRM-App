// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../resources/resources.dart';

class AppBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChange;
  const AppBottomNavBar(
      {super.key, required this.selectedIndex, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: R.colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: R.colors.black.withOpacity(.1),
          ),
        ],
      ),
      child: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 35.w, vertical: 11.h),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 8.h),
          child: GNav(
            rippleColor: const Color.fromARGB(20, 37, 175, 190),
            hoverColor: const Color.fromARGB(30, 37, 175, 190),
            gap: 8,
            activeColor: R.colors.primaryColor,
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            duration: const Duration(milliseconds: 400),
            tabBackgroundColor: const Color.fromARGB(72, 37, 175, 190),
            color: const Color(0xFF9DB2CE),
            tabs: [
              GButton(
                leading: SvgPicture.asset(
                  R.icons.home,
                  color: selectedIndex == 0
                      ? R.colors.iconColor
                      : const Color(0XFF9DB2CE),
                  width: 28.w,
                  height: 28.h,
                ),
                text: 'Home',
              ),
              GButton(
                leading: SvgPicture.asset(
                  R.icons.wallet,
                  color: selectedIndex == 1 ? R.colors.iconColor : null,
                  width: 28.w,
                  height: 28.h,
                ),
                text: 'Wallet',
              ),
              GButton(
                leading: SvgPicture.asset(
                  R.icons.user,
                  color: selectedIndex == 2 ? R.colors.iconColor : null,
                  width: 28.w,
                  height: 28.h,
                ),
                text: 'Profile',
              ),
            ],
            selectedIndex: selectedIndex,
            onTabChange: onTabChange,
          ),
        ),
      ),
    );
  }
}
