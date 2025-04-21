import 'package:flutter/material.dart';

import '../../../../../../../core/widgets/app_bar.dart';
import '../widget/notes_lead_data_bloc_builder.dart';

class NotesLeadScreen extends StatelessWidget {
  final int leadId;
  const NotesLeadScreen({super.key, required this.leadId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Notes'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: NotesLeadDataBlocBuilder(leadId: leadId),
        ),
      ),
    );
  }
}
