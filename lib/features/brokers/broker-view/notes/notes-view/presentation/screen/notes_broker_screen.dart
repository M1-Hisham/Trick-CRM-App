import 'package:flutter/material.dart';

import '../../../../../../../core/widgets/app_bar.dart';
import '../widget/notes_broker_data_bloc_builder.dart';

class NotesBrokerScreen extends StatelessWidget {
  final int brokerId;
  const NotesBrokerScreen({super.key, required this.brokerId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Notes'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: NotesBrokerDataBlocBuilder(brokerId: brokerId),
        ),
      ),
    );
  }
}
