import 'package:flutter/material.dart';

import '../../../../../../../core/widgets/app_bar.dart';
import '../widget/notes_deal_data_bloc_builder.dart';

class NotesDealScreen extends StatelessWidget {
  final int dealId;
  const NotesDealScreen({super.key, required this.dealId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Notes'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: NotesDealDataBlocBuilder(dealId: dealId),
        ),
      ),
    );
  }
}
