import 'package:flutter/material.dart';

import '../../../../../core/widgets/app_bar.dart';
import '../widgets/leads_data_bloc_builder.dart';

class LeadsScreen extends StatelessWidget {
  const LeadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: appBar('Leads'),
        body: const SingleChildScrollView(
          // physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(22),
            child: LeadsDataBlocBuilder(),
          ),
        ),
      ),
    );
  }
}
