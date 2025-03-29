import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trick_crm_app/features/deals/data/model/deals_model.dart';
import 'package:trick_crm_app/features/deals/logic/cubit/deals_cubit.dart';

import '../../../../core/cubits/base_state.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_data_table.dart';
import '../../create-deal/presentation/create_deal_screen.dart';
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
                    onPressed: () {
                      showModalBottomSheet(
                        sheetAnimationStyle: AnimationStyle(
                          duration: const Duration(milliseconds: 1000),
                          curve: Curves.easeInOutCubicEmphasized,
                          reverseDuration: const Duration(milliseconds: 600),
                        ),
                        useSafeArea: true,
                        isScrollControlled: true,
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(13),
                            topRight: Radius.circular(13),
                          ),
                        ),
                        context: context,
                        builder: (BuildContext context) =>
                            CreateDealScreen(dealsModel: dealsModel),
                      );
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
