import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trick_crm_app/core/cubits/base_state.dart';
import 'package:trick_crm_app/core/helpers/loading_shimmer.dart';
import 'package:trick_crm_app/core/helpers/spacing.dart';
import 'package:trick_crm_app/core/widgets/app_bar.dart';
import 'package:trick_crm_app/core/widgets/app_error_message.dart';
import 'package:trick_crm_app/features/profile/Subscription/data/model/subscription_model.dart';
import 'package:trick_crm_app/features/profile/Subscription/logic/cubit/subscription_cubit.dart';
import 'package:trick_crm_app/features/profile/Subscription/presentation/widget/loading_subscription_screen.dart';

import '../../../../core/helpers/formatted_data_helper.dart';
import '../../../../core/resources/resources.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Subscription'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: BlocBuilder<SubscriptionCubit, BaseState<SubscriptionModel>>(
            buildWhen: (previous, current) =>
                current is Loading || current is Success || current is Error,
            builder: (context, state) {
              return state.maybeWhen(
                loading: () =>
                    loadingShimmer(child: loadingSubscriptionScreen()),
                success: (SubscriptionModel data) {
                  final subscription = data.subscription;
                  return Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: R.colors.white,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            width: 0.8,
                            color: R.colors.secGray,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: R.colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Subscription Details',
                                style:
                                    R.textStyles.font15RegentGrayW500.copyWith(
                                  color: R.colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              spacingV(40),
                              Text(
                                'Subscription Plan',
                                style: R.textStyles.font17PrimaryW600,
                              ),
                              Text(
                                subscription?.plan?.name ?? '_',
                                style: R.textStyles.font14WhiteW500
                                    .copyWith(color: R.colors.black),
                              ),
                              spacingV(40),
                              Text(
                                'Start Date',
                                style: R.textStyles.font17PrimaryW600,
                              ),
                              Text(
                                formattedDateHelper(subscription?.startedAt),
                                style: R.textStyles.font14WhiteW500
                                    .copyWith(color: R.colors.black),
                              ),
                              spacingV(40),
                              Text(
                                'Periodicity',
                                style: R.textStyles.font17PrimaryW600,
                              ),
                              Text(
                                subscription?.plan?.periodicityType ?? '_',
                                style: R.textStyles.font14WhiteW500
                                    .copyWith(color: R.colors.black),
                              ),
                              spacingV(40),
                              Text(
                                'Expiration Date',
                                style: R.textStyles.font17PrimaryW600,
                              ),
                              Text(
                                subscription?.expiredAt ?? '_',
                                style: R.textStyles.font14WhiteW500
                                    .copyWith(color: R.colors.black),
                              ),
                              spacingV(40),
                              Text(
                                'User Balance:',
                                style: R.textStyles.font17PrimaryW600,
                              ),
                              Text(
                                data.userBalance?.toString() ?? '_',
                                style: R.textStyles.font14WhiteW500
                                    .copyWith(color: R.colors.black),
                              ),
                              spacingV(40),
                              Text(
                                'Created At',
                                style: R.textStyles.font17PrimaryW600,
                              ),
                              Text(
                                formattedDateHelper(subscription?.createdAt),
                                style: R.textStyles.font14WhiteW500
                                    .copyWith(color: R.colors.black),
                              ),
                              spacingV(40),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
                error: (message) => appErrorMessage(
                  message,
                  () {
                    context.read<SubscriptionCubit>().getData();
                  },
                ),
                orElse: () => const SizedBox.shrink(),
              );
            },
          ),
        ),
      ),
    );
  }
}
