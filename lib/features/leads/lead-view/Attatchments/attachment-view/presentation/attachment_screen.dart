import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trick_crm_app/core/resources/resources.dart';
import 'package:trick_crm_app/core/widgets/app_bar.dart';
import 'package:trick_crm_app/core/widgets/app_button.dart';
import 'package:trick_crm_app/features/leads/lead-view/Attatchments/create-attachment/presentation/add_attachment_screen.dart';
import 'package:trick_crm_app/features/leads/lead-view/lead-view/data/model/leads_view_model.dart';

import '../../../../../../core/helpers/spacing.dart';

class AttachmentScreen extends StatelessWidget {
  final List<LeadAttatchment> leadAttatchment;
  const AttachmentScreen({super.key, required this.leadAttatchment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Attachments'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppButton(
              icon: SvgPicture.asset(
                R.icons.add,
              ),
              text: 'Add Attachment',
              onPressed: () {
                // Show Add Attachment Dialog
                showDialog(
                  context: context,
                  builder: (context) {
                    return const AddAttachmentScreen();
                  },
                );
              },
            ),
            spacingV(20),
            Text(
              'Attachments',
              style: R.textStyles.font17PrimaryW600,
            ),
            spacingV(10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: leadAttatchment.length,
              itemBuilder: (context, index) {
                return const Column(
                  children: [
                    // Attachment Item
                    Divider(),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
