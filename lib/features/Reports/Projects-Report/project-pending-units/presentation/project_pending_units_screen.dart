import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trick_crm_app/core/helpers/loading_shimmer.dart';
import 'package:trick_crm_app/core/widgets/app_error_message.dart';
import 'package:trick_crm_app/core/widgets/app_reports_data_table.dart';
import 'package:trick_crm_app/features/Reports/Projects-Report/logic/cubit/get_projects_reports_cubit.dart';

import '../../../../../core/cubits/base_state.dart';
import '../../../../../core/widgets/app_bar.dart';
import '../data/model/project_pending_units_model.dart';

class ProjectPendingUnitsScreen extends StatelessWidget {
  const ProjectPendingUnitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Project Pending Units"),
      body: BlocBuilder<GetProjectsReportsCubit<ProjectPendingUnitsModel>,
          BaseState<ProjectPendingUnitsModel>>(
        buildWhen: (previous, current) =>
            current is Success || current is Loading || current is Error,
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => loadingShimmer(
              child: const AppReportsDataTable(
                columns: [
                  DataColumn(label: Text('Project Name')),
                  DataColumn(label: Text('Unit Type')),
                  DataColumn(label: Text('Unit Code')),
                  DataColumn(label: Text('Unit Number')),
                  DataColumn(label: Text('Status')),
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
              // return SingleChildScrollView(
              //   child: Center(
              //     child: Column(
              //       children: [
              //         Container(
              //           margin: const EdgeInsets.all(10),
              //           decoration: BoxDecoration(
              //             border: Border.all(color: Colors.black),
              //             borderRadius: BorderRadius.circular(8),
              //           ),
              //           child: Row(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Expanded(
              //                 child: Table(
              //                   border: const TableBorder(
              //                       horizontalInside:
              //                           BorderSide(color: Colors.black),
              //                       right: BorderSide(color: Colors.black)),
              //                   children: [
              //                     TableRow(
              //                         decoration: BoxDecoration(
              //                           color: Colors.grey[300],
              //                           borderRadius: const BorderRadius.only(
              //                             topLeft: Radius.circular(8),
              //                           ),
              //                         ),
              //                         children: const [
              //                           SizedBox(
              //                             height: 30.0,
              //                             child: Center(
              //                               child: Text(
              //                                 'I',
              //                               ),
              //                             ),
              //                           ),
              //                         ]),
              //                     const TableRow(children: [
              //                       SizedBox(
              //                           height: 30.0,
              //                           child: Center(
              //                               child: Text(
              //                             'He',
              //                           ))),
              //                     ]),
              //                     const TableRow(children: [
              //                       SizedBox(
              //                           height: 30.0,
              //                           child: Center(
              //                               child: Text(
              //                             'She',
              //                           ))),
              //                     ]),
              //                     const TableRow(children: [
              //                       SizedBox(
              //                           height: 30.0,
              //                           child: Center(
              //                               child: Text(
              //                             'It',
              //                           ))),
              //                     ]),
              //                     const TableRow(children: [
              //                       SizedBox(
              //                           height: 30.0,
              //                           child: Center(
              //                               child: Text(
              //                             'You',
              //                           ))),
              //                     ]),
              //                     const TableRow(children: [
              //                       SizedBox(
              //                           height: 30.0,
              //                           child: Center(
              //                               child: Text(
              //                             'We',
              //                           ))),
              //                     ]),
              //                   ],
              //                 ),
              //               ),
              //               Expanded(
              //                 child: Table(
              //                   border: const TableBorder.symmetric(
              //                     inside: BorderSide(color: Colors.black),
              //                   ),
              //                   children: [
              //                     TableRow(
              //                         decoration: BoxDecoration(
              //                           color: Colors.grey[300],
              //                           borderRadius: const BorderRadius.only(
              //                             topRight: Radius.circular(8),
              //                           ),
              //                         ),
              //                         children: const [
              //                           SizedBox(
              //                               height: 30.0,
              //                               child: Center(
              //                                   child: Text(
              //                                 'Am',
              //                               )))
              //                         ]),
              //                     const TableRow(
              //                       children: [
              //                         SizedBox(
              //                           height: 60.0,
              //                           child: Center(
              //                             child: Text(
              //                               'Is',
              //                             ),
              //                           ),
              //                         ),
              //                       ],
              //                     ),
              //                     const TableRow(
              //                       children: [
              //                         SizedBox(
              //                           height: 80.0,
              //                           child: Center(
              //                             child: Text(
              //                               'Are',
              //                             ),
              //                           ),
              //                         ),
              //                       ],
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // );

              final Map<String, List<Data>> groupedData = {};
              for (var unit in data.data ?? []) {
                groupedData.putIfAbsent(unit.projectName, () => []).add(unit);
              }

              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                    child: DataTable(
                      headingRowColor: WidgetStateColor.resolveWith(
                          (states) => Colors.grey.shade200),
                      border: TableBorder.all(
                        width: 0.5,
                      ),
                      columns: const [
                        DataColumn(label: Text('Project Name')),
                        DataColumn(label: Text('Unit Type')),
                        DataColumn(label: Text('Unit Code')),
                        DataColumn(label: Text('Unit Number')),
                        DataColumn(label: Text('Status')),
                      ],
                      rows: [
                        for (var entry in groupedData.entries)
                          ...entry.value.asMap().entries.map((e) {
                            final unit = e.value;
                            // final isFirst = e.key == 0;
                            return DataRow(
                              cells: [
                                // if (isFirst)
                                //   DataCell(
                                //     Text(unit.projectName ?? "_"),
                                //     placeholder: false,
                                //   )
                                // else
                                DataCell(Text(unit.projectName ?? "_")),
                                DataCell(Text(unit.unitType ?? "_")),
                                DataCell(Text(unit.unitCode ?? "_")),
                                DataCell(Text(unit.unitNumber ?? "_")),
                                DataCell(Text(unit.status ?? "_")),
                              ],
                            );
                          }),
                      ],
                    ),
                  ),
                ),
              );
            },
            error: (message) => appErrorMessage(
              message,
              () {
                context
                    .read<GetProjectsReportsCubit<ProjectPendingUnitsModel>>()
                    .getProjectReport("ProjectPendingUnits");
              },
            ),
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
