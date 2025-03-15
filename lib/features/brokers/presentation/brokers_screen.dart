import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/resources/resources.dart';
import '../../../core/widgets/app_bar.dart';
import '../../../core/widgets/app_button.dart';
import 'widget/brokers_data_bloc_builder.dart';

class BrokersScreen extends StatelessWidget {
  const BrokersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Brokers'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            AppButton(
              icon: SvgPicture.asset(R.icons.add),
              text: 'Create Broker',
              onPressed: () {},
            ),
            spacingV(20),
            const BrokersDataBlocBuilder(),
          ],
        ),
      ),
    );
  }
}
