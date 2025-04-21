import 'package:flutter/material.dart';
import 'package:trick_crm_app/core/widgets/app_bar.dart';

import 'widget/client_timeline_bloc_builder.dart';

class ClientTimelineSccreen extends StatelessWidget {
  final int clientId;
  const ClientTimelineSccreen({super.key, required this.clientId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Timeline'),
      body: ClientTimelineBlocBuilder(
        clientId: clientId,
      ),
    );
  }
}
