import 'package:flutter/material.dart';

import '../../../core/widgets/app_bar.dart';
import 'widget/calls_data_bloc_builder.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: appBar('Calls'),
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: CallsDataBlocBuilder(),
          ),
        ),
      ),
    );
  }
}
