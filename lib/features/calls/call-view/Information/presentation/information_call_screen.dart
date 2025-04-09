import 'package:flutter/material.dart';
import 'package:trick_crm_app/core/widgets/app_bar.dart';
import 'package:trick_crm_app/features/calls/call-view/Information/presentation/widget/info_call_data_bloc_builder.dart';

class InformationCallScreen extends StatelessWidget {
  final int callId;
  const InformationCallScreen({super.key, required this.callId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Information'),
      body: SingleChildScrollView(
        child: InfoCallDataBlocBuilder(callId: callId),
      ),
    );
  }
}
