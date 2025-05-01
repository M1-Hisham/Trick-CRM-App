import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trick_crm_app/core/cubits/base_state.dart';
import 'package:trick_crm_app/core/helpers/formatted_data_helper.dart';
import 'package:trick_crm_app/core/helpers/loading_shimmer.dart';

import '../../../../../../../core/di/setup-di/dependency_injection.dart';
import '../../../../../../../core/widgets/app_data_table.dart';
import '../../../../../../../core/widgets/app_error_message.dart';
import '../../../client-view/data/model/clients_view_model.dart';
import '../../../client-view/logic/cubit/client_view_cubit.dart';
import '../../data/model/client_mails_model.dart';

class EmailClientDataBlocBuilder extends StatelessWidget {
  final int clientId;
  const EmailClientDataBlocBuilder({super.key, required this.clientId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientViewCubit, BaseState<ClientsViewModel>>(
      bloc: getIt<ClientViewCubit>()..getClientView(clientId),
      buildWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => loadingShimmer(
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppDataTable<ClientMailsModel>(
                  data: [],
                  headers: [],
                  dataExtractors: [],
                ),
              ],
            ),
          ),
          success: (ClientsViewModel clientsViewModel) {
            final List<ClientMailsModel> clientMails =
                clientsViewModel.clientMails ?? [];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppDataTable<ClientMailsModel>(
                  dataMessage: 'No Client Mails',
                  data: clientMails,
                  headers: const [
                    "Subject",
                    "Date",
                    "Sent By",
                    "Status",
                  ],
                  dataExtractors: [
                    (clientMails) => clientMails.subject ?? '',
                    (clientMails) =>
                        formattedDateHelperMM(clientMails.createdAt ?? ''),
                    (clientMails) => clientMails.user?.name ?? '',
                    (clientMails) => clientMails.status ?? '_',
                  ],
                ),
              ],
            );
          },
          error: (message) => appErrorMessage(
            message,
            () => getIt<ClientViewCubit>().getClientView(clientId),
          ),
          orElse: () {
            return const SizedBox.shrink();
          },
        );
      },
    );
  }
}
