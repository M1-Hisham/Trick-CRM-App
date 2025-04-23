import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/widgets/app_card_feat_view.dart';
import 'package:trick_crm_app/features/clients/client-view/Information/presentation/information_client_screen.dart';

import '../../../../../../../core/widgets/app_bar.dart';
import '../../../../../../core/helpers/show_snack_bar.dart';
import '../../../Attatchments/attachment-view/presentation/attachment_client_screen.dart';
import '../../../Timeline/presentation/client_timeline_sccreen.dart';
import '../../../notes/notes-view/presentation/screen/notes_client_screen.dart';

class ClientView extends StatelessWidget {
  final int clientId;
  final String clientName;
  const ClientView({
    super.key,
    required this.clientName,
    required this.clientId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        clientName,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              // Show Cards
              appCardFeatView(
                title: 'Information',
                icon: 'information',
                onTap: () {
                  Get.to(
                    () => InformationClientScreen(clientId: clientId),
                  );
                },
              ),
              appCardFeatView(
                title: 'Timeline',
                icon: 'timeline',
                onTap: () {
                  Get.to(() => ClientTimelineSccreen(clientId: clientId));
                },
              ),
              appCardFeatView(
                title: 'Notes',
                icon: 'notes',
                onTap: () {
                  Get.to(
                    () => NotesClientScreen(clientId: clientId),
                  );
                },
              ),
              appCardFeatView(
                title: 'Attachments',
                icon: 'attachments',
                onTap: () {
                  Get.to(
                    () => AttachmentClientScreen(clientId: clientId),
                  );
                },
              ),
              appCardFeatView(
                title: 'Email',
                icon: 'Emails',
                onTap: () {
                  showSnackBar(context, "Coming soon!");
                },
              ),
              appCardFeatView(
                title: 'Open Activities',
                icon: 'openActivities',
                onTap: () {
                  showSnackBar(context, "Coming soon!");
                },
              ),
              appCardFeatView(
                title: 'Closed Activities',
                icon: 'closedActivities',
                onTap: () {
                  showSnackBar(context, "Coming soon!");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
