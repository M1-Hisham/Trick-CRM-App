import 'package:flutter/material.dart';
import 'package:trick_crm_app/core/resources/resources.dart';
import 'package:trick_crm_app/core/widgets/app_text_form_field.dart';
import 'package:trick_crm_app/features/brokers/broker-view/broker-view/data/model/broker_view_model.dart';

Widget informationBrokerDetails(BrokerViewModel brokerViewModel) {
  final broker = brokerViewModel.broker;
  final userInfo = {
    "Broker Owner": broker?.owner?.name ?? "-",
    "broker Assigned To": broker?.assigned?.name ?? "-",
    "broker person name": broker?.personName ?? "-",
    "Broker Status": broker?.isActive == 0 ? "Current" : "Ex",
  };

  final campaingInformation = {
    "Broker Owner": broker?.owner?.name ?? "-",
    "broker Assigned To": broker?.assigned?.name ?? "-",
    "broker person name": broker?.personName ?? "-",
    "Mobile": broker?.mobile ?? "-",
    "Mobile 2": broker?.mobile2 ?? "-",
    "Email": broker?.email ?? "-",
    "Address": broker?.address ?? "-",
    "Commercial Registration": broker?.commercialRegister ?? "-",
    "Tax Card": broker?.taxCard ?? "-",
    "Status": broker?.isActive == 0 ? "Current" : "Ex",
  };

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      children: [
        sectionTitle("Brokers Info"),
        buildFields(userInfo),
        sectionTitle("Campaign Information"),
        buildFields(campaingInformation),
      ],
    ),
  );
}

/// A function that builds a list of fields from a map of data
Widget buildFields(Map<String, String> data) {
  return Column(
    children: data.entries
        .map((entry) => readOnlyField(entry.key, entry.value))
        .toList(),
  );
}

/// A function that builds a section title
Widget sectionTitle(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Text(
      title,
      style: R.textStyles.font17PrimaryW600,
    ),
  );
}

/// A function that builds a read-only field with a label and a value
Widget readOnlyField(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: AppTextFormField(
      hintText: label,
      labelText: label,
      style: R.textStyles.font15RegentGrayW500.copyWith(
        color: R.colors.black,
      ),
      maxLines: label == "Description" ? 3 : null,
      isclickable: false,
      initialValue: value,
      fillColor: R.colors.white,
    ),
  );
}
