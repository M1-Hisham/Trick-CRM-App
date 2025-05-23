import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trick_crm_app/core/cubits/base_state.dart';
import 'package:trick_crm_app/core/di/setup-di/dependency_injection.dart';
import 'package:trick_crm_app/core/helpers/loading_shimmer.dart';
import 'package:trick_crm_app/core/widgets/app_error_message.dart';
import 'package:trick_crm_app/features/clients/client-view/Information/presentation/widget/information_client_details.dart';
import 'package:trick_crm_app/features/clients/client-view/client-view/data/model/clients_view_model.dart';

import '../../../client-view/logic/cubit/client_view_cubit.dart';

class InfoClientDataBlocBuilder extends StatelessWidget {
  final int clientId;
  const InfoClientDataBlocBuilder({super.key, required this.clientId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientViewCubit, BaseState<ClientsViewModel>>(
      bloc: getIt<ClientViewCubit>()..getClientView(clientId),
      buildWhen: (previous, current) =>
          current is Success || current is Loading || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => loadingShimmer(
            child: informationClientDetails(ClientsViewModel()),
          ),
          success: (ClientsViewModel clientsViewModel) {
            return informationClientDetails(clientsViewModel);
          },
          error: (message) => appErrorMessage(
            message,
            () {
              getIt<ClientViewCubit>().getClientView(clientId);
            },
          ),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
