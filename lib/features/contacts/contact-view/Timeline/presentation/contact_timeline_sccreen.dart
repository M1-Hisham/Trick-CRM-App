import 'package:flutter/material.dart';
import 'package:trick_crm_app/core/widgets/app_bar.dart';

import 'widget/contact_timeline_bloc_builder.dart';

class ContactTimelineSccreen extends StatelessWidget {
  final int contactId;
  const ContactTimelineSccreen({super.key, required this.contactId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Timeline'),
      body: ContactTimelineBlocBuilder(
        contactId: contactId,
      ),
    );
  }
}
