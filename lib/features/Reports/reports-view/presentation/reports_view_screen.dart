import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../core/widgets/app_bar.dart';
import '../../../../../../core/widgets/app_card_feat_view.dart';
import '../../../../core/helpers/show_snack_bar.dart';
import '../../../../core/resources/resources.dart';
import '../../Deals-Report/deals-reports-view/deals_reports_view_screen.dart';
import '../../Projects-Report/projects-reports-view/projects_reports_view_screen.dart';

class ReportsViewScreen extends StatelessWidget {
  const ReportsViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Reports"),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              // Show Cards
              appCardFeatView(
                title: 'Deals Report',
                buildIcon: SvgPicture.asset(
                  R.icons.iconsMenu["Deals"] ?? '',
                  width: 42.w,
                  height: 42.h,
                ),
                onTap: () {
                  Get.to(() => const DealsReportsViewScreen());
                },
              ),
              appCardFeatView(
                title: 'Leads Report',
                icon: 'Leads',
                onTap: () {
                  showSnackBar(context, "Coming soon!");
                },
              ),
              appCardFeatView(
                title: 'Campaigns Report',
                icon: 'Campaigns',
                onTap: () {
                  showSnackBar(context, "Coming soon!");
                },
              ),
              appCardFeatView(
                title: 'Clients Report',
                buildIcon: SvgPicture.asset(
                  R.icons.iconsMenu["Clients"] ?? '',
                  width: 42.w,
                  height: 42.h,
                ),
                onTap: () {
                  showSnackBar(context, "Coming soon!");
                },
              ),
              appCardFeatView(
                title: 'Projects Report',
                buildIcon: SvgPicture.asset(
                  R.icons.iconsMenu["Projects"] ?? '',
                  width: 42.w,
                  height: 42.h,
                ),
                onTap: () {
                  Get.to(() => const ProjectsReportsViewScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
