import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trick_crm_app/core/helpers/loading_shimmer.dart';
import 'package:trick_crm_app/core/helpers/spacing.dart';
import 'package:trick_crm_app/core/widgets/app_error_message.dart';
import 'package:trick_crm_app/core/widgets/app_reports_data_table.dart';
import 'package:trick_crm_app/features/Reports/Deals-Report/logic/cubit/get_deals_reports_cubit.dart';

import '../../../../../core/cubits/base_state.dart';
import '../../../../../core/resources/resources.dart';
import '../../../../../core/widgets/app_bar.dart';
import '../data/model/this_quarter_sales_model.dart';

class ThisQuarterSalesScreen extends StatelessWidget {
  const ThisQuarterSalesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("This Month Sales"),
      body: BlocBuilder<GetDealsReportsCubit<ThisQuarterSalesModel>,
          BaseState<ThisQuarterSalesModel>>(
        buildWhen: (previous, current) =>
            current is Success || current is Loading || current is Error,
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => loadingShimmer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  spacingV(20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Q1", style: R.textStyles.font17PrimaryW600),
                  ),
                  spacingV(10),
                  const Divider(
                    height: 3,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                  ),
                  const AppReportsDataTable(
                    columns: [
                      DataColumn(label: Text('Deal Name')),
                      DataColumn(label: Text('Amount')),
                      DataColumn(label: Text('Created By')),
                      DataColumn(label: Text('Created At')),
                      DataColumn(label: Text('Closing Date')),
                    ],
                    rows: [
                      DataRow(
                        cells: [
                          DataCell(Text("_")),
                          DataCell(Text("_")),
                          DataCell(Text("_")),
                          DataCell(Text("_")),
                          DataCell(Text("_")),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            success: (ThisQuarterSalesModel thisQuarterSalesModel) {
              final quarterSales = thisQuarterSalesModel.data ?? [];
              final quarter1 = quarterSales
                  .where((element) => element.quarter == "Q1")
                  .expand((element) => element.deals ?? []);
              final quarter2 = quarterSales
                  .where((element) => element.quarter == "Q2")
                  .expand((element) => element.deals ?? []);
              final quarter3 = quarterSales
                  .where((element) => element.quarter == "Q3")
                  .expand((element) => element.deals ?? []);
              final quarter4 = quarterSales
                  .where((element) => element.quarter == "Q4")
                  .expand((element) => element.deals ?? []);

              final Map<String, List<Deals>> groupedDataQ1 = {};
              final Map<String, List<Deals>> groupedDataQ2 = {};
              final Map<String, List<Deals>> groupedDataQ3 = {};
              final Map<String, List<Deals>> groupedDataQ4 = {};
              for (var data in quarter1) {
                groupedDataQ1.putIfAbsent(data.dealName, () => []).add(data);
              }
              for (var data in quarter2) {
                groupedDataQ2.putIfAbsent(data.dealName, () => []).add(data);
              }
              for (var data in quarter3) {
                groupedDataQ3.putIfAbsent(data.dealName, () => []).add(data);
              }
              for (var data in quarter4) {
                groupedDataQ4.putIfAbsent(data.dealName, () => []).add(data);
              }
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    spacingV(20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text("Q1", style: R.textStyles.font17PrimaryW600),
                    ),
                    spacingV(10),
                    const Divider(
                      height: 3,
                      thickness: 1,
                      indent: 20,
                      endIndent: 20,
                    ),
                    AppReportsDataTable(
                      verticalPadding: 10,
                      columns: const [
                        DataColumn(label: Text('Deal Name')),
                        DataColumn(label: Text('Amount')),
                        DataColumn(label: Text('Created By')),
                        DataColumn(label: Text('Created At')),
                        DataColumn(label: Text('Closing Date')),
                      ],
                      rows: [
                        for (var entry in groupedDataQ1.entries)
                          ...entry.value.asMap().entries.map((e) {
                            final data = e.value;
                            return DataRow(
                              cells: [
                                DataCell(
                                  Text(
                                    data.dealName ?? "_",
                                  ),
                                ),
                                DataCell(Text(data.amount ?? "_")),
                                DataCell(Text(data.createdBy ?? "_")),
                                DataCell(Text(data.createdAtFormated ?? "_")),
                                DataCell(Text(data.closingDate ?? "_")),
                              ],
                            );
                          }),
                      ],
                    ),
                    spacingV(20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text("Q2", style: R.textStyles.font17PrimaryW600),
                    ),
                    spacingV(10),
                    const Divider(
                      height: 3,
                      thickness: 1,
                      indent: 20,
                      endIndent: 20,
                    ),
                    AppReportsDataTable(
                      verticalPadding: 10,
                      columns: const [
                        DataColumn(label: Text('Deal Name')),
                        DataColumn(label: Text('Amount')),
                        DataColumn(label: Text('Created By')),
                        DataColumn(label: Text('Created At')),
                        DataColumn(label: Text('Closing Date')),
                      ],
                      rows: [
                        for (var entry in groupedDataQ2.entries)
                          ...entry.value.asMap().entries.map((e) {
                            final data = e.value;
                            return DataRow(
                              cells: [
                                DataCell(
                                  Text(
                                    data.dealName ?? "_",
                                  ),
                                ),
                                DataCell(Text(data.amount ?? "_")),
                                DataCell(Text(data.createdBy ?? "_")),
                                DataCell(Text(data.createdAtFormated ?? "_")),
                                DataCell(Text(data.closingDate ?? "_")),
                              ],
                            );
                          }),
                      ],
                    ),
                    spacingV(20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text("Q3", style: R.textStyles.font17PrimaryW600),
                    ),
                    spacingV(10),
                    const Divider(
                      height: 3,
                      thickness: 1,
                      indent: 20,
                      endIndent: 20,
                    ),
                    AppReportsDataTable(
                      verticalPadding: 10,
                      columns: const [
                        DataColumn(label: Text('Deal Name')),
                        DataColumn(label: Text('Amount')),
                        DataColumn(label: Text('Created By')),
                        DataColumn(label: Text('Created At')),
                        DataColumn(label: Text('Closing Date')),
                      ],
                      rows: [
                        for (var entry in groupedDataQ3.entries)
                          ...entry.value.asMap().entries.map((e) {
                            final data = e.value;
                            return DataRow(
                              cells: [
                                DataCell(Text(data.dealName ?? "_")),
                                DataCell(Text(data.amount ?? "_")),
                                DataCell(Text(data.createdBy ?? "_")),
                                DataCell(Text(data.createdAtFormated ?? "_")),
                                DataCell(Text(data.closingDate ?? "_")),
                              ],
                            );
                          }),
                      ],
                    ),
                    spacingV(20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text("Q4", style: R.textStyles.font17PrimaryW600),
                    ),
                    spacingV(10),
                    const Divider(
                      height: 3,
                      thickness: 1,
                      indent: 20,
                      endIndent: 20,
                    ),
                    AppReportsDataTable(
                      verticalPadding: 10,
                      columns: const [
                        DataColumn(label: Text('Deal Name')),
                        DataColumn(label: Text('Amount')),
                        DataColumn(label: Text('Created By')),
                        DataColumn(label: Text('Created At')),
                        DataColumn(label: Text('Closing Date')),
                      ],
                      rows: [
                        for (var entry in groupedDataQ4.entries)
                          ...entry.value.asMap().entries.map((e) {
                            final data = e.value;
                            return DataRow(
                              cells: [
                                DataCell(Text(data.dealName ?? "_")),
                                DataCell(Text(data.amount ?? "_")),
                                DataCell(Text(data.createdBy ?? "_")),
                                DataCell(Text(data.createdAtFormated ?? "_")),
                                DataCell(Text(data.closingDate ?? "_")),
                              ],
                            );
                          }),
                      ],
                    ),
                    spacingV(40),
                  ],
                ),
              );
            },
            error: (message) => appErrorMessage(
              message,
              () {
                context
                    .read<GetDealsReportsCubit<ThisQuarterSalesModel>>()
                    .getDealReport("thisQuarterSales");
              },
            ),
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
