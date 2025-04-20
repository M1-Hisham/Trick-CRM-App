import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trick_crm_app/core/helpers/loading_shimmer.dart';
import 'package:trick_crm_app/core/widgets/app_error_message.dart';
import 'package:trick_crm_app/core/widgets/app_reports_data_table.dart';
import 'package:trick_crm_app/features/Reports/Deals-Report/deals-closing-this-month/data/model/deals_closing_this_month_model.dart';
import 'package:trick_crm_app/features/Reports/Deals-Report/logic/cubit/get_deals_reports_cubit.dart';

import '../../../../../core/cubits/base_state.dart';
import '../../../../../core/widgets/app_bar.dart';

class DealsClosingThisMonthScreen extends StatelessWidget {
  const DealsClosingThisMonthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Deals Closing This Month"),
      body: BlocBuilder<GetDealsReportsCubit<DealsClosingThisMonthModel>,
          BaseState<DealsClosingThisMonthModel>>(
        buildWhen: (previous, current) =>
            current is Success || current is Loading || current is Error,
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => loadingShimmer(
              child: const AppReportsDataTable(
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
            ),
            success: (data) {
              final Map<String, List<Data>> groupedData = {};
              for (var data in data.data ?? []) {
                groupedData
                    .putIfAbsent(data.dealName ?? "_", () => [])
                    .add(data);
              }

              return AppReportsDataTable(
                columns: const [
                  DataColumn(label: Text('Deal Name')),
                  DataColumn(label: Text('Amount')),
                  DataColumn(label: Text('Created By')),
                  DataColumn(label: Text('Created At')),
                  DataColumn(label: Text('Closing Date')),
                ],
                rows: [
                  for (var entry in groupedData.entries)
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
              );
            },
            error: (message) => appErrorMessage(
              message,
              () {
                context
                    .read<GetDealsReportsCubit<DealsClosingThisMonthModel>>()
                    .getDealReport("DealsClosingThisMonth");
              },
            ),
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
