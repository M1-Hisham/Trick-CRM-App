import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trick_crm_app/core/helpers/spacing.dart';
import 'package:trick_crm_app/core/widgets/app_bar.dart';
import 'package:trick_crm_app/core/widgets/app_button.dart';

import '../../../../../core/resources/resources.dart';
import 'widget/payment_plans_data_bloc_builder.dart';

class PaymentPlansScreen extends StatelessWidget {
  const PaymentPlansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Payment Plans'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            AppButton(
              icon: SvgPicture.asset(R.icons.add),
              text: 'Create Payment Plan',
              onPressed: () {},
            ),
            spacingV(20),
            const PaymentPlansDataBlocBuilder(),
          ],
        ),
      ),
    );
  }
}
