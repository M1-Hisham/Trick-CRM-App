import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/helpers/show_snack_bar.dart';

import '../../../../../../core/di/setup-di/dependency_injection.dart';
import '../../../../../../core/widgets/app_waiting_feature.dart';
import '../../../client-view/logic/cubit/client_view_cubit.dart';
import '../logic/cubit/delete_note_client_cubit.dart';

Future deleteNoteClient(context, clientId, idNote) {
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
              await getIt<DeleteNoteClientCubit>().deleteClientNote(
                clientId,
                idNote,
              );
              Get.back();
              Get.back();
              getIt<ClientViewCubit>().getClientView(clientId);
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
