import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/widgets/app_card_feat_view.dart';
import 'package:trick_crm_app/features/calls/call-view/Information/presentation/information_call_screen.dart';
import '../../../../../../../core/widgets/app_bar.dart';
import '../../../Attatchments/attachment-view/presentation/attachment_call_screen.dart';
import '../../../notes/notes-view/presentation/screen/notes_call_screen.dart';

class CallView extends StatelessWidget {
  final int callId;
  final String callName;
  const CallView({
    super.key,
    required this.callName,
    required this.callId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        callName,
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
                    () => InformationCallScreen(callId: callId),
                  );
                },
              ),
              appCardFeatView(
                title: 'Notes',
                icon: 'notes',
                onTap: () {
                  Get.to(
                    () => NotesCallScreen(callId: callId),
                  );
                },
              ),
              appCardFeatView(
                title: 'Attachments',
                icon: 'attachments',
                onTap: () {
                  Get.to(
                    () => AttachmentCallScreen(callId: callId),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
