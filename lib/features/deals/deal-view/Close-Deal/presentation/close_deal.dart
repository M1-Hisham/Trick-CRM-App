import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/helpers/spacing.dart';
import 'package:trick_crm_app/core/widgets/app_button.dart';

import '../../../../../core/di/setup-di/dependency_injection.dart';
import '../../../../../core/helpers/show_snack_bar.dart';
import '../../../../../core/resources/resources.dart';
import '../../../../../core/widgets/app_waiting_feature.dart';
import '../../deal-view/logic/cubit/deal_view_cubit.dart';
import '../logic/cubit/close_deal_cubit.dart';

Future closeDeal(context, dealId) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Close Deal'),
        content: const Text('Are you sure you want to close this deal?'),
        actions: [
          Row(
            children: [
              Expanded(
                child: AppButton(
                  backgroundColor: R.colors.darkGery,
                  text: "No",
                  onPressed: Get.back,
                ),
              ),
              spacingH(20),
              Expanded(
                child: AppButton(
                  text: "Yes",
                  onPressed: () async {
                    appWaitingFeature(context);
                    await getIt<CloseDealCubit>().closeDeal(dealId);
                    Get.back();
                    Get.back();
                    getIt<DealViewCubit>().getDealView(dealId);
                    showSnackBar(context, "Deal Closed Successfully");
                  },
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}
