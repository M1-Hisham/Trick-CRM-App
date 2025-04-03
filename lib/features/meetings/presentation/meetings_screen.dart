import 'package:flutter/material.dart';

import '../../../core/widgets/app_bar.dart';
import 'widget/meetings_data_bloc_builder.dart';

class MeetingsScreen extends StatelessWidget {
  const MeetingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: appBar('Meetings'),
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: MeetingsDataBlocBuilder(),
          ),
        ),
      ),
    );
  }
}
