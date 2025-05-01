import 'package:flutter/material.dart';

import '../../../../../../core/widgets/app_bar.dart';
import 'widget/email_client_data_bloc_builder.dart';

class EmailClientScreen extends StatelessWidget {
  final int clientId;
  const EmailClientScreen({super.key, required this.clientId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Client Email'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: EmailClientDataBlocBuilder(clientId: clientId),
        ),
      ),
    );
  }
}
