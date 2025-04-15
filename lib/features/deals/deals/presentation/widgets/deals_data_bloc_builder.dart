import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/features/deals/deal-view/deal-view/presentation/screens/deal_view.dart';
import 'package:trick_crm_app/features/deals/deals/data/model/deals_model.dart';
import 'package:trick_crm_app/features/deals/deals/logic/cubit/deals_cubit.dart';

import '../../../../../core/cubits/base_state.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/resources/resources.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_data_table.dart';
import '../../../../../core/widgets/app_show_modal_bottom_sheet.dart';
import '../../../create-deal/presentation/create_deal_screen.dart';
import 'deals_screen_loading.dart';

class DealsDataBlocBuilder extends StatelessWidget {
  const DealsDataBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DealsCubit, BaseState<DealsModel>>(
      buildWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
            loading: () => dealsScreenLoading(),
            success: (DealsModel dealsModel) {
              final String? dealsMessage = dealsModel.message;
              final deals = dealsModel.deals;
              return Column(
                children: [
                  AppButton(
                    icon: SvgPicture.asset(R.icons.add),
                    text: 'Create Deal',
                    onPressed: () async {
                      final result = await appShowModalBottomSheet(
                        context: context,
                        builder: (context) => CreateDealScreen(
                          dealsModel: dealsModel,
                        ),
                      );
                      if (result == true) {
                        // Refresh the data after creating a new call
                        // ignore: use_build_context_synchronously
                        context.read<DealsCubit>().getData();
                      }
                    },
                  ),
                  spacingV(20),
                  AppDataTable<Deals>(
                    dataMessage: dealsMessage,
                    data: deals ?? [],
                    headers: const [
                      "Deal Name",
                      "Amount",
                      "Status",
                      "Closing Date",
                      "Client Name",
                      "Deal Owner",
                    ],
                    dataExtractors: [
                      (deals) => deals.dealName ?? '',
                      (deals) => deals.amount ?? '',
                      (deals) => deals.status ?? '',
                      (deals) => deals.closingDate ?? '',
                      (deals) => deals.client?.clientName ?? '',
                      (deals) => deals.owner?.name ?? '',
                    ],
                    dataIdExtractor: (deals) => (deals.id ?? 0).toString(),
                    dataLeadNameExtractor: (deals) => deals.dealName ?? '',
                    onViewDetails: (id, dealName) {
                      Get.to(
                        () => DealView(
                          dealName: dealName,
                          dealId: int.parse(id),
                          dealsModel: dealsModel,
                        ),
                      );
                    },
                  ),
                ],
              );
            },
            error: (message) => Center(
                  child: Column(
                    children: [
                      const Text('An error occurred, Try again'),
                      spacingV(10),
                      const Icon(
                        Icons.error,
                        color: Colors.red,
                      ),
                      spacingV(10),
                      const Text('Please check your internet connection'),
                      spacingV(10),
                      const Text('Or try again later'),
                      spacingV(10),
                      const Text('If the problem persists, contact support'),
                      spacingV(10),
                      Text('Error: $message'),
                      spacingV(10),
                      AppButton(
                        text: 'Retry',
                        onPressed: () {
                          context.read<DealsCubit>().getData();
                        },
                      ),
                    ],
                  ),
                ),
            orElse: () {
              return const SizedBox.shrink();
            });
      },
    );
  }
}
