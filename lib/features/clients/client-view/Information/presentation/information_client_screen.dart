import 'package:flutter/material.dart';
import 'package:trick_crm_app/core/widgets/app_bar.dart';
import 'package:trick_crm_app/features/clients/client-view/Information/presentation/widget/info_client_data_bloc_builder.dart';

class InformationClientScreen extends StatelessWidget {
  final int clientId;
  const InformationClientScreen({super.key, required this.clientId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Information'),
      body: SingleChildScrollView(
        child: InfoClientDataBlocBuilder(clientId: clientId),
      ),
    );
  }
}
