import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/cubits/base_state.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/resources/resources.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_data_table.dart';
import '../../../../../core/widgets/app_show_modal_bottom_sheet.dart';
import '../../../create-client/presentation/create_client_screen.dart';
import '../../data/model/clients_model.dart';
import '../../logic/cubit/clients_cubit.dart';
import 'clients_loading_screen.dart';

class ClientsDataBlocBuilder extends StatelessWidget {
  const ClientsDataBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientsCubit, BaseState<ClientsModel>>(
      buildWhen: (previous, current) => current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
            loading: () => clientsLoadingScreen(),
            success: (clientsModel) {
              final String? clientsMessage = clientsModel.message;
              final client = clientsModel.clients;
              return Column(
                children: [
                  AppButton(
                    icon: SvgPicture.asset(R.icons.add),
                    text: 'Create Client',
                    onPressed: () {
                      appShowModalBottomSheet(
                        context: context,
                        builder: (context) =>
                            CreateClientScreen(clientsModel: clientsModel),
                      );
                    },
                  ),
                  spacingV(13),
                  Row(
                    children: [
                      Expanded(
                        child: AppButton(
                          icon: SvgPicture.asset(R.icons.importOptions),
                          text: 'Import Options',
                          onPressed: () {},
                        ),
                      ),
                      spacingH(8),
                      Expanded(
                        child: AppButton(
                          icon: SvgPicture.asset(R.icons.exportOptions),
                          text: 'Export Options',
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                  spacingV(20),
                  AppDataTable<Clients>(
                    dataMessage: clientsMessage,
                    data: client ?? [],
                    headers: const [
                      "Client Name",
                      "Company",
                      "Email",
                      "Phone",
                      "Lead Source",
                      "Client Assigned to",
                    ],
                    dataExtractors: [
                      (client) => client.clientName ?? '_',
                      (client) => client.company ?? '_',
                      (client) => client.email ?? '_',
                      (client) => client.mobile ?? '_',
                      (client) => client.leadSource ?? '_',
                      (client) => client.assigned?.name ?? '_',
                    ],
                    dataIdExtractor: (client) => (client.id ?? 0).toString(),
                    dataLeadNameExtractor: (client) => client.firstName ?? '',
                    onViewDetails: (id, leadName) {
                      // Get.toNamed(
                      //   RoutesNames.leadsView,
                      //   arguments: id != '' ? int.parse(id) : 0,
                      // );
                    },
                  ),
                ],
              );
            },
            error: (message) => const Center(
                  child: Text('An error occurred, Try again'),
                ),
            orElse: () {
              return const SizedBox.shrink();
            });
      },
    );
  }
}
