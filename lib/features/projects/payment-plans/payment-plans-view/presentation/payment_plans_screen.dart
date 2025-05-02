import 'package:flutter/material.dart';
import 'package:trick_crm_app/core/widgets/app_bar.dart';

import 'widget/payment_plans_data_bloc_builder.dart';

class PaymentPlansScreen extends StatelessWidget {
  const PaymentPlansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: appBar('Payment Plans'),
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: PaymentPlansDataBlocBuilder(),
          ),
        ),
      ),
    );
  }
}
