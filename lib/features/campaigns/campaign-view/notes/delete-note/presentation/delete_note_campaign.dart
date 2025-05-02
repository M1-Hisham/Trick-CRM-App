import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/helpers/show_snack_bar.dart';

import '../../../../../../core/di/setup-di/dependency_injection.dart';
import '../../../../../../core/widgets/app_waiting_feature.dart';
import '../../../campaign-view/logic/cubit/campaign_view_cubit.dart';
import '../logic/cubit/delete_note_campaign_cubit.dart';

Future deleteNoteCampaign(context, campaignId, idNote) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Delete Note'),
        content: const Text('Are you sure you want to delete this note?'),
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
              await getIt<DeleteNoteCampaignCubit>().deleteCampaignNote(
                campaignId,
                idNote,
              );
              Get.back();
              Get.back();
              getIt<CampaignViewCubit>().getCampaignView(campaignId);
              // ignore: use_build_context_synchronously
              showSnackBar(context, "Note deleted successfully");
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
