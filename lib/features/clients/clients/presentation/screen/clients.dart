import 'package:flutter/material.dart';

import '../../../../../core/widgets/app_bar.dart';
import '../widgets/clients_data_bloc_builder.dart';

class Clients extends StatelessWidget {
  const Clients({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: appBar('Clients'),
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(22),
            child: ClientsDataBlocBuilder(),
          ),
        ),
      ),
    );
  }
}
