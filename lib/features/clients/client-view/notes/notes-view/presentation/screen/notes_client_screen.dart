import 'package:flutter/material.dart';

import '../../../../../../../core/widgets/app_bar.dart';
import '../widget/notes_client_data_bloc_builder.dart';

class NotesClientScreen extends StatelessWidget {
  final int clientId;
  const NotesClientScreen({super.key, required this.clientId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Notes'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: NotesClientDataBlocBuilder(clientId: clientId),
        ),
      ),
    );
  }
}
