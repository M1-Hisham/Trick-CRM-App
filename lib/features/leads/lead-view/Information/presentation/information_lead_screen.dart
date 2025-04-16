import 'package:flutter/material.dart';
import 'package:trick_crm_app/core/widgets/app_bar.dart';

import 'widget/information_lead_data_bloc_builder.dart';

class InformationLeadScreen extends StatelessWidget {
  final int leadId;
  const InformationLeadScreen({super.key, required this.leadId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Information'),
      body: SingleChildScrollView(
        child: InformationLeadDataBlocBuilder(leadId: leadId),
      ),
    );
  }
}
