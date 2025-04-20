import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/features/Reports/Deals-Report/logic/cubit/get_deals_reports_cubit.dart';
import 'package:trick_crm_app/features/Reports/Deals-Report/sales-by-person/data/model/sales_by_person_model.dart';
import 'package:trick_crm_app/features/Reports/Deals-Report/sales-by-person/presentation/sales_by_person_screen.dart';
import 'package:trick_crm_app/features/Reports/Deals-Report/this-month-sales/data/model/this_month_sales_model.dart';
import 'package:trick_crm_app/features/Reports/Deals-Report/this-month-sales/presentation/this_month_sales_screen.dart';
import 'package:trick_crm_app/features/Reports/Deals-Report/this-quarter-sales/data/model/this_quarter_sales_model.dart';
import 'package:trick_crm_app/features/Reports/Deals-Report/this-quarter-sales/presentation/this_quarter_sales_screen.dart';

import '../../../../core/api/api_service.dart';
import '../../../../core/di/setup-di/dependency_injection.dart';
import '../../../../core/helpers/show_snack_bar.dart';
import '../../../../core/widgets/app_bar.dart';
import '../../../../core/widgets/app_card_feat_view.dart';

class DealsReportsViewScreen extends StatelessWidget {
  const DealsReportsViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Deals Reports"),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              // Show Cards
              appCardFeatView(
                title: 'Today Sales',
                onTap: () {
                  showSnackBar(context, "Coming Soon");
                },
              ),
              appCardFeatView(
                title: 'This Month Sales',
                onTap: () {
                  Get.to(
                    () => BlocProvider(
                      create: (context) =>
                          GetDealsReportsCubit<ThisMonthSalesModel>(
                        apiService: getIt<ApiService>(),
                        fromJson: ThisMonthSalesModel.fromJson,
                      )..getDealReport("thisMonthSales"),
                      child: const ThisMonthSalesScreen(),
                    ),
                  );
                },
              ),
              appCardFeatView(
                title: 'Quarterly Sales',
                onTap: () {
                  Get.to(
                    () => BlocProvider(
                      create: (context) =>
                          GetDealsReportsCubit<ThisQuarterSalesModel>(
                        apiService: getIt<ApiService>(),
                        fromJson: ThisQuarterSalesModel.fromJson,
                      )..getDealReport("thisQuarterSales"),
                      child: const ThisQuarterSalesScreen(),
                    ),
                  );
                },
              ),
              appCardFeatView(
                title: 'Sales By Person',
                onTap: () {
                  Get.to(
                    () => BlocProvider(
                      create: (context) =>
                          GetDealsReportsCubit<SalesByPersonModel>(
                        apiService: getIt<ApiService>(),
                        fromJson: SalesByPersonModel.fromJson,
                      )..getDealReport("salesByPerson"),
                      child: const SalesByPersonScreen(),
                    ),
                  );
                },
              ),
              appCardFeatView(
                title: 'Deals Closing This Month',
                onTap: () {
                  showSnackBar(context, "Coming Soon");
                },
              ),
              appCardFeatView(
                title: 'Open Deals',
                onTap: () {
                  showSnackBar(context, "Coming Soon");
                },
              ),
              appCardFeatView(
                title: 'Closed Deals',
                onTap: () {
                  showSnackBar(context, "Coming Soon");
                },
              ),
              appCardFeatView(
                title: 'Salse By Lead Source',
                onTap: () {
                  showSnackBar(context, "Coming Soon");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
