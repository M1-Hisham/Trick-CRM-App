import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../core/cubits/base_state.dart';
import '../../../../../../core/resources/resources.dart';
import '../../../../../../core/widgets/app_data_table.dart';
import '../../data/model/payment_plans_model.dart';
import '../../logic/cubit/payment_plans_cubit.dart';

class PaymentPlansDataBlocBuilder extends StatelessWidget {
  const PaymentPlansDataBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentPlansCubit, BaseState<PaymentPlansModel>>(
      buildWhen: (previous, current) => current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
            loading: () => Shimmer.fromColors(
                  baseColor: R.colors.baseColorShimmer,
                  highlightColor: R.colors.highlightColorShimmer,
                  enabled: true,
                  child: const AppDataTable<PaymentPlans>(
                    data: [],
                    headers: [],
                    dataExtractors: [],
                  ),
                ),
            success: (PaymentPlansModel paymentPlansModel) {
              final String? paymentPlansMessage = paymentPlansModel.message;
              final paymentPlans = paymentPlansModel.paymentPlans;
              return AppDataTable<PaymentPlans>(
                dataMessage: paymentPlansMessage,
                data: paymentPlans ?? [],
                headers: const [
                  "Plan Name",
                  "Downpayment %",
                  "Years",
                  "Discount %",
                  "Status",
                ],
                dataExtractors: [
                  (paymentPlans) => paymentPlans.planName ?? '_',
                  (paymentPlans) =>
                      paymentPlans.downPaymentPercentage.toString(),
                  (paymentPlans) => paymentPlans.years.toString(),
                  (paymentPlans) => paymentPlans.discount ?? '_',
                  (paymentPlans) {
                    if (paymentPlans.status == 0) {
                      return 'Active';
                    } else if (paymentPlans.status == 1) {
                      return 'Not Active';
                    } else if (paymentPlans.status == 2) {
                      return 'Deleted';
                    } else {
                      return '_';
                    }
                  },
                ],
                dataIdExtractor: (paymentPlans) =>
                    (paymentPlans.id ?? 0).toString(),
                // dataLeadNameExtractor: (paymentPlans) => paymentPlans.leadName ?? '_',
                onViewDetails: (id, leadName) {
                  // Get.toNamed(
                  //   RoutesNames.leadsView,
                  //   arguments: id != '' ? int.parse(id) : 0,
                  // );
                },
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
