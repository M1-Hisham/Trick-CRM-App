import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/cubits/base_state.dart';
import 'package:trick_crm_app/core/di/setup-di/dependency_injection.dart';
import 'package:trick_crm_app/core/helpers/formatted_data_helper.dart';
import 'package:trick_crm_app/core/helpers/loading_shimmer.dart';
import 'package:trick_crm_app/core/widgets/app_bar.dart';
import 'package:trick_crm_app/core/widgets/app_button.dart';
import 'package:trick_crm_app/core/widgets/app_error_message.dart';
import 'package:trick_crm_app/core/widgets/app_reports_data_table.dart';
import 'package:trick_crm_app/core/widgets/app_waiting_feature.dart';
import 'package:trick_crm_app/features/profile/Recycle-Bin/recycle-bin-view/logic/cubit/recycle_bin_cubit.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/resources/resources.dart';
import '../../../../../core/widgets/app_control_table_button.dart';
import '../../restore/logic/cubit/restore_cubit.dart';
import '../data/model/recycle_bin_model.dart';

class RecycleBinScreen extends StatefulWidget {
  const RecycleBinScreen({super.key});

  @override
  State<RecycleBinScreen> createState() => _RecycleBinScreenState();
}

class _RecycleBinScreenState extends State<RecycleBinScreen> {
  int _currentPage = 0;
  final int _itemsPerPage = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Recycle Bin'),
      body: BlocBuilder<RecycleBinCubit, BaseState<RecycleBinModel>>(
        buildWhen: (previous, current) =>
            current is Loading || current is Success || current is Error,
        builder: (context, state) {
          return state.maybeWhen(
            loading: () {
              return loadingShimmer(
                child: Column(
                  children: [
                    Expanded(
                      child: AppReportsDataTable(
                        columns: const [
                          DataColumn(label: Text('Deleted At')),
                          DataColumn(label: Text('Owner Name')),
                          DataColumn(label: Text('Type')),
                          DataColumn(label: Text('Name')),
                          DataColumn(label: Text('Action')),
                        ],
                        rows: List.generate(10, (index) {
                          return DataRow(cells: [
                            const DataCell(Text('')),
                            const DataCell(Text('')),
                            const DataCell(Text('')),
                            const DataCell(Text('')),
                            DataCell(
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: AppButton(
                                  icon: Icon(Icons.settings_backup_restore,
                                      color: R.colors.white),
                                  text: 'Restore',
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ]);
                        }).toList(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: _buildPaginationControls(0),
                    ),
                  ],
                ),
              );
            },
            success: (RecycleBinModel data) {
              List<UnifiedTrashedItem> getUnifiedList(RecycleBinModel model) {
                List<UnifiedTrashedItem> unifiedList = [];

                model.trashedLeads?.forEach((lead) {
                  unifiedList.add(UnifiedTrashedItem(
                    id: lead.id ?? 0,
                    deletedAt: formattedDateHelperTHMM(lead.deletedAt ?? ''),
                    ownerName: lead.ownerName ?? '',
                    type: 'Leads',
                    name: lead.lastName ?? '',
                  ));
                });

                model.trashedContacts?.forEach((contact) {
                  unifiedList.add(UnifiedTrashedItem(
                    id: contact.id ?? 0,
                    deletedAt: formattedDateHelperTHMM(contact.deletedAt ?? ''),
                    ownerName: contact.ownerName ?? '',
                    type: 'Contacts',
                    name: contact.contactName ?? '',
                  ));
                });

                model.trashedClients?.forEach((client) {
                  unifiedList.add(UnifiedTrashedItem(
                    id: client.id ?? 0,
                    deletedAt: formattedDateHelperTHMM(client.deletedAt ?? ''),
                    ownerName: client.ownerName ?? '',
                    type: 'Clients',
                    name: client.clientName ?? '',
                  ));
                });

                model.trashedProjects?.forEach((project) {
                  unifiedList.add(UnifiedTrashedItem(
                    id: project.id ?? 0,
                    deletedAt: formattedDateHelperTHMM(project.deletedAt ?? ''),
                    ownerName: '',
                    type: 'Projects',
                    name: project.name ?? '',
                  ));
                });

                model.trashedProjectUnits?.forEach((unit) {
                  unifiedList.add(UnifiedTrashedItem(
                    id: unit.id ?? 0,
                    deletedAt: formattedDateHelperTHMM(unit.deletedAt ?? ''),
                    ownerName: '',
                    type: 'Units',
                    name: unit.unitCode ?? '',
                  ));
                });

                unifiedList.sort((a, b) => b.deletedAt.compareTo(a.deletedAt));
                return unifiedList;
              }

              final List<UnifiedTrashedItem> fullList = getUnifiedList(data);
              final int totalPages = (fullList.length / _itemsPerPage).ceil();

              final List<UnifiedTrashedItem> paginatedList = fullList
                  .skip(_currentPage * _itemsPerPage)
                  .take(_itemsPerPage)
                  .toList();

              return Column(
                children: [
                  Expanded(
                    child: AppReportsDataTable(
                      columns: const [
                        DataColumn(label: Text('Deleted At')),
                        DataColumn(label: Text('Owner Name')),
                        DataColumn(label: Text('Type')),
                        DataColumn(label: Text('Name')),
                        DataColumn(label: Text('Action')),
                      ],
                      rows: paginatedList.map((item) {
                        return DataRow(cells: [
                          DataCell(Text(item.deletedAt)),
                          DataCell(Text(item.ownerName)),
                          DataCell(Text(item.type)),
                          DataCell(Text(item.name)),
                          DataCell(
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: AppButton(
                                icon: Icon(Icons.settings_backup_restore,
                                    color: R.colors.white),
                                text: 'Restore',
                                onPressed: () async {
                                  log('Restore trashed-${item.type.toLowerCase()} ${item.id}');
                                  appWaitingFeature(context);
                                  await getIt<RestoreCubit>().restoreRecycleBin(
                                    "trashed-${item.type.toLowerCase()}",
                                    item.id,
                                  );
                                  Get.back();
                                  // ignore: use_build_context_synchronously
                                  context.read<RecycleBinCubit>().getData();
                                },
                              ),
                            ),
                          ),
                        ]);
                      }).toList(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: _buildPaginationControls(totalPages),
                  ),
                  spacingV(20),
                ],
              );
            },
            error: (message) {
              return appErrorMessage(message, () {
                context.read<RecycleBinCubit>().getData();
              });
            },
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }

  Row _buildPaginationControls(int totalPages) {
    return Row(
      children: [
        Text('${_currentPage + 1} Page of $totalPages'),
        const Spacer(),
        ControlTableButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: _currentPage > 0
              ? () {
                  setState(() {
                    _currentPage--;
                  });
                }
              : null,
        ),
        spacingH(14),
        ControlTableButton(
          icon: const Icon(Icons.arrow_forward_ios_rounded),
          onPressed: _currentPage < totalPages - 1
              ? () {
                  setState(() {
                    _currentPage++;
                  });
                }
              : null,
        ),
      ],
    );
  }
}

class UnifiedTrashedItem {
  final int id;
  final String deletedAt;
  final String ownerName;
  final String type;
  final String name;

  UnifiedTrashedItem({
    required this.id,
    required this.deletedAt,
    required this.ownerName,
    required this.type,
    required this.name,
  });
}
