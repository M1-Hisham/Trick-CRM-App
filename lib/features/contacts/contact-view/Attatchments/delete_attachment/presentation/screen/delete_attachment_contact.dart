import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/features/contacts/contact-view/Attatchments/delete_attachment/logic/cubit/delete_attachment_contact_cubit.dart';

import '../../../../../../../core/di/setup-di/dependency_injection.dart';
import '../../../../../../../core/helpers/show_snack_bar.dart';
import '../../../../../../../core/widgets/app_waiting_feature.dart';
import '../../../../contact-view/logic/cubit/contact_view_cubit.dart';

Future deleteAttachmentContact(context, contactId, idAttachment) {
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
              await getIt<DeleteAttachmentContactCubit>()
                  .deleteContactAttachment(
                contactId,
                idAttachment,
              );
              Get.back();
              Get.back();
              getIt<ContactViewCubit>().getContactView(contactId);
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
