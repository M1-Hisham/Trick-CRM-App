import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trick_crm_app/features/brokers/create-broker/presentation/create_broker_screen.dart';
import 'package:trick_crm_app/features/brokers/data/model/brokers_model.dart';
import 'package:trick_crm_app/features/brokers/logic/cubit/brokers_cubit.dart';

import '../../../../core/cubits/base_state.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_data_table.dart';
import '../../../../core/widgets/app_show_modal_bottom_sheet.dart';
import 'brokers_loading_screen.dart';

class BrokersDataBlocBuilder extends StatelessWidget {
  const BrokersDataBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrokersCubit, BaseState<BrokersModel>>(
      buildWhen: (previous, current) => current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
            loading: () => brokersLoadingScreen(),
            success: (BrokersModel brokersModel) {
              final String? brokersMessage = brokersModel.message;
              final brokers = brokersModel.brokers;
              return Column(
                children: [
                  AppButton(
                    icon: SvgPicture.asset(R.icons.add),
                    text: 'Create Broker',
                    onPressed: () {
                      appShowModalBottomSheet(
                        context: context,
                        builder: (context) => CreateBrokerScreen(
                          brokersModel: brokersModel,
                        ),
                      );
                    },
                  ),
                  spacingV(20),
                  AppDataTable<Brokers>(
                    dataMessage: brokersMessage,
                    data: brokers ?? [],
                    headers: const [
                      "Broker Name",
                      "Person Name",
                      "mobile",
                      "Broker Owner",
                      "Assigned To",
                      "address",
                      "Current Status",
                    ],
                    dataExtractors: [
                      (brokers) => brokers.companyName ?? '_',
                      (brokers) => brokers.personName ?? '_',
                      (brokers) => brokers.mobile ?? '_',
                      (brokers) => brokers.owner?.name ?? '_',
                      (brokers) => brokers.assigned?.name ?? '_',
                      (brokers) => brokers.address ?? '_',
                      (brokers) => brokers.isActive == 0 ? "Current" : "Ex",
                    ],
                    dataIdExtractor: (brokers) => (brokers.id ?? 0).toString(),
                    dataLeadNameExtractor: (brokers) =>
                        brokers.companyName ?? '_',
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
