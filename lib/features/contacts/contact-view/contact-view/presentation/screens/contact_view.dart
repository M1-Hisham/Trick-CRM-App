import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/widgets/app_card_feat_view.dart';
import 'package:trick_crm_app/features/contacts/contact-view/Information/presentation/information_contact_screen.dart';
import 'package:trick_crm_app/features/contacts/contact-view/notes/notes-view/presentation/screen/notes_contact_screen.dart';
import '../../../../../../../core/widgets/app_bar.dart';
import '../../../Attatchments/attachment-view/presentation/attachment_contact_screen.dart';
import '../../../Emails/presentation/email_contact_screen.dart';
import '../../../Timeline/presentation/contact_timeline_sccreen.dart';

class ContactView extends StatelessWidget {
  final int contactId;
  final String contactName;
  const ContactView({
    super.key,
    required this.contactName,
    required this.contactId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        contactName,
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
                    () => InformationContactScreen(contactId: contactId),
                  );
                },
              ),
              appCardFeatView(
                title: 'Timeline',
                icon: 'timeline',
                onTap: () {
                  Get.to(
                    () => ContactTimelineSccreen(contactId: contactId),
                  );
                },
              ),
              appCardFeatView(
                title: 'Notes',
                icon: 'notes',
                onTap: () {
                  Get.to(
                    () => NotesContactScreen(contactId: contactId),
                  );
                },
              ),
              appCardFeatView(
                title: 'Attachments',
                icon: 'attachments',
                onTap: () {
                  Get.to(
                    () => AttachmentContactScreen(contactId: contactId),
                  );
                },
              ),
              appCardFeatView(
                title: 'Email',
                icon: 'Emails',
                onTap: () {
                  Get.to(
                    () => EmailContactScreen(contactId: contactId),
                  );
                },
              ),
              // appCardFeatView(
              //   title: 'Open Activities',
              //   icon: 'openActivities',
              //   onTap: () {
              //     showSnackBar(context, "Coming soon!");
              //   },
              // ),
              // appCardFeatView(
              //   title: 'Closed Activities',
              //   icon: 'closedActivities',
              //   onTap: () {
              //     showSnackBar(context, "Coming soon!");
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
