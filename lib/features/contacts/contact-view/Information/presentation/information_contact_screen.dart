import 'package:flutter/material.dart';
import 'package:trick_crm_app/core/widgets/app_bar.dart';

import 'widget/info_contact_data_bloc_builder.dart';

class InformationContactScreen extends StatelessWidget {
  final int contactId;
  const InformationContactScreen({super.key, required this.contactId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Information'),
      body: SingleChildScrollView(
        child: InfoContactDataBlocBuilder(contactId: contactId),
      ),
    );
  }
}
