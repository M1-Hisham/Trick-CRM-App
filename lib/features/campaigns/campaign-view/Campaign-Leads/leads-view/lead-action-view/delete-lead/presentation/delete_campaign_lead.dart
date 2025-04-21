import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/helpers/show_snack_bar.dart';

import '../../../../../../../../core/di/setup-di/dependency_injection.dart';
import '../../../../../../../../core/widgets/app_waiting_feature.dart';
import '../logic/cubit/delete_campaign_lead_cubit.dart';

Future deleteCampaignLead(context, campaignId, leadId) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Delete Lead'),
        content: const Text('Are you sure you want to delete this lead?'),
        actions: [
          TextButton(
            onPressed: Get.back,
            child: const Text(
              'Cancel',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          TextButton(
            onPressed: () async {
              appWaitingFeature(context);
              await getIt<DeleteCampaignLeadCubit>().deleteCampaignLead(
                campaignId,
                leadId,
              );
              Get.back();
              Get.back();
              // ignore: use_build_context_synchronously
              Navigator.pop(context, true);
              // ignore: use_build_context_synchronously
              showSnackBar(context, "Lead Deleted Successfully");
            },
            child: const Text(
              'Delete',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ),
        ],
      );
    },
  );
}
