import 'package:flutter/material.dart';
import '../../../core/widgets/app_bar.dart';
import 'widget/brokers_data_bloc_builder.dart';

class BrokersScreen extends StatelessWidget {
  const BrokersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: appBar('Brokers'),
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: BrokersDataBlocBuilder(),
          ),
        ),
      ),
    );
  }
}
