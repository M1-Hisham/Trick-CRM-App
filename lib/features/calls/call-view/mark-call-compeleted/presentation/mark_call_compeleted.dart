import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/helpers/spacing.dart';
import 'package:trick_crm_app/core/widgets/app_button.dart';
import 'package:trick_crm_app/features/calls/call-view/mark-call-compeleted/logic/cubit/mark_call_completed_cubit.dart';

import '../../../../../core/di/setup-di/dependency_injection.dart';
import '../../../../../core/helpers/show_snack_bar.dart';
import '../../../../../core/resources/resources.dart';
import '../../../../../core/widgets/app_waiting_feature.dart';
import '../../call-view/logic/cubit/call_view_cubit.dart';

Future markCallCompeleted(context, callId) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Mark as completed'),
        content:
            const Text('Are you sure you want to mark this Call as completed?'),
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
                    await getIt<MarkCallCompletedCubit>()
                        .markCallAsComplete(callId);
                    Get.back();
                    Get.back();
                    getIt<CallViewCubit>().getCallView(callId);
                    // ignore: use_build_context_synchronously
                    showSnackBar(context, "Mark as completed successfully");
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
