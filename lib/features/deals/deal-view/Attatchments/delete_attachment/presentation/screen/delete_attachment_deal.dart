import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../core/di/setup-di/dependency_injection.dart';
import '../../../../../../../core/helpers/show_snack_bar.dart';
import '../../../../../../../core/widgets/app_waiting_feature.dart';
import '../../../../deal-view/deal-view/logic/cubit/deal_view_cubit.dart';
import '../../logic/cubit/delete_attachment_deal_cubit.dart';

Future deleteAttachmentDeal(context, dealId, idAttachment) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Delete Note'),
        content: const Text('Are you sure you want to delete this File?'),
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
              await getIt<DeleteAttachmentDealCubit>()
                  .deleteDealAttachment(dealId, idAttachment);
              Get.back();
              Get.back();
              getIt<DealViewCubit>().getDealView(dealId);
              showSnackBar(context, "Attachment Deleted Successfully");
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
