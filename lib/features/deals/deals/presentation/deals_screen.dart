import 'package:flutter/material.dart';

import '../../../../core/widgets/app_bar.dart';
import 'widgets/deals_data_bloc_builder.dart';

class DealsScreen extends StatelessWidget {
  const DealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: appBar('Deals'),
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: DealsDataBlocBuilder(),
          ),
        ),
      ),
    );
  }
}
