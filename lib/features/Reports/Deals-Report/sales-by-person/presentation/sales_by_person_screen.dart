import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trick_crm_app/core/helpers/loading_shimmer.dart';
import 'package:trick_crm_app/core/widgets/app_error_message.dart';
import 'package:trick_crm_app/core/widgets/app_reports_data_table.dart';
import 'package:trick_crm_app/features/Reports/Deals-Report/logic/cubit/get_deals_reports_cubit.dart';
import 'package:trick_crm_app/features/Reports/Deals-Report/sales-by-person/data/model/sales_by_person_model.dart';

import '../../../../../core/cubits/base_state.dart';
import '../../../../../core/widgets/app_bar.dart';

class SalesByPersonScreen extends StatelessWidget {
  const SalesByPersonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Sales By Person"),
      body: BlocBuilder<GetDealsReportsCubit<SalesByPersonModel>,
          BaseState<SalesByPersonModel>>(
        buildWhen: (previous, current) =>
            current is Success || current is Loading || current is Error,
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => loadingShimmer(
              child: const AppReportsDataTable(
                columns: [
                  DataColumn(label: Text('Created By')),
                  DataColumn(label: Text('Deal Name')),
                  DataColumn(label: Text('Amount')),
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
                groupedData.putIfAbsent(data.dealName, () => []).add(data);
              }

              return AppReportsDataTable(
                columns: const [
                  DataColumn(label: Text('Created By')),
                  DataColumn(label: Text('Deal Name')),
                  DataColumn(label: Text('Amount')),
                  DataColumn(label: Text('Created At')),
                  DataColumn(label: Text('Closing Date')),
                ],
                rows: [
                  for (var entry in groupedData.entries)
                    ...entry.value.asMap().entries.map((e) {
                      final data = e.value;
                      return DataRow(
                        cells: [
                          DataCell(Text(data.createdBy ?? "_")),
                          DataCell(Text(data.dealName ?? "_")),
                          DataCell(Text(data.amount ?? "_")),
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
                    .read<GetDealsReportsCubit<SalesByPersonModel>>()
                    .getDealReport("salesByPerson");
              },
            ),
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
