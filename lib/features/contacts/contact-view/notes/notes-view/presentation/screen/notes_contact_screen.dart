import 'package:flutter/material.dart';

import '../../../../../../../core/widgets/app_bar.dart';
import '../widget/notes_contact_data_bloc_builder.dart';

class NotesContactScreen extends StatelessWidget {
  final int contactId;
  const NotesContactScreen({super.key, required this.contactId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Notes'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: NotesContactDataBlocBuilder(contactId: contactId),
        ),
      ),
    );
  }
}
