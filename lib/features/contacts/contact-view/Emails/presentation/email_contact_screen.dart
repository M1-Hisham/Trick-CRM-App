import 'package:flutter/material.dart';

import '../../../../../../core/widgets/app_bar.dart';
import 'widget/email_contact_data_bloc_builder.dart';

class EmailContactScreen extends StatelessWidget {
  final int contactId;
  const EmailContactScreen({super.key, required this.contactId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Contact Emails'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: EmailContactDataBlocBuilder(contactId: contactId),
        ),
      ),
    );
  }
}
