import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/cubits/base_state.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/resources/resources.dart';
import '../../../../../../core/widgets/app_button.dart';
import '../../../../../../core/widgets/app_data_table.dart';
import '../../../create-payment-plans/presentation/create_payment_plans_screen.dart';
import '../../data/model/payment_plans_model.dart';
import '../../logic/cubit/payment_plans_cubit.dart';
import 'payment_plans_loading_screen.dart';

class PaymentPlansDataBlocBuilder extends StatelessWidget {
  const PaymentPlansDataBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentPlansCubit, BaseState<PaymentPlansModel>>(
      buildWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
            loading: () => paymentPlansLoadingScreen(),
            success: (PaymentPlansModel paymentPlansModel) {
              final String? paymentPlansMessage = paymentPlansModel.message;
              final paymentPlans = paymentPlansModel.paymentPlans;
              return Column(
                children: [
                  AppButton(
                    icon: SvgPicture.asset(R.icons.add),
                    text: 'Create Payment Plan',
                    onPressed: () async {
                      final result = await showDialog(
                        useSafeArea: false,
                        context: context,
                        builder: (context) => CreatePaymentPlansScreen(),
                      );
                      if (result == true) {
                        // Refresh the data after creating a new call
                        // ignore: use_build_context_synchronously
                        context.read<PaymentPlansCubit>().getData();
                      }
                    },
                  ),
                  spacingV(20),
                  AppDataTable<PaymentPlans>(
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
                          context.read<PaymentPlansCubit>().getData();
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
