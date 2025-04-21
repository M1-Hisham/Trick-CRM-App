import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../core/di/setup-di/dependency_injection.dart';
import '../../../../../../../core/helpers/show_snack_bar.dart';
import '../../../../../../../core/widgets/app_waiting_feature.dart';
import '../../../../broker-view/logic/cubit/broker_view_cubit.dart';
import '../../logic/cubit/delete_attachment_broker_cubit.dart';

Future deleteAttachmentBroker(context, brokerId, idAttachment) {
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
              await getIt<DeleteAttachmentBrokerCubit>()
                  .deleteBrokerAttachment(brokerId, idAttachment);
              Get.back();
              Get.back();
              getIt<BrokerViewCubit>().getBrokerView(brokerId);
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
