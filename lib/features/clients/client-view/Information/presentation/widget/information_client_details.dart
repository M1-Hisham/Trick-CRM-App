import 'package:flutter/material.dart';
import 'package:trick_crm_app/core/resources/resources.dart';
import 'package:trick_crm_app/core/widgets/app_text_form_field.dart';
import 'package:trick_crm_app/features/clients/client-view/client-view/data/model/clients_view_model.dart';

Widget informationClientDetails(ClientsViewModel clientsViewModel) {
  final client = clientsViewModel.client;
  final userInfo = {
    "Client Owner": client?.ownerName ?? "-",
    "Email": client?.email ?? "-",
    "Mobile": client?.mobile ?? "-",
    "Client Status": client?.leadStatus ?? "-",
  };

  final clientInfo = {
    "Client Owner": client?.ownerName ?? "-",
    "Client Assigner To": client?.assigned?.name ?? "-",
    "Client End At": client?.endTime ?? "-",
    "Client End At Hour": client?.endTimeHour ?? "-",
    "Title": client?.jobTitle ?? "-",
    "Client Source": client?.leadSource ?? "-",
    "Client Status": client?.leadStatus ?? "-",
    "Industry": client?.industry ?? "-",
    "Email": client?.email ?? "-",
    "Mobile": client?.mobile ?? "-",
    "Sec. Mobile": client?.mobile2 ?? "-",
    "Ar_Name": client?.arName ?? "-",
    "National ID": client?.nationalId ?? "-",
    "Passport ID": client?.passportId ?? "-",
    "Nationality": client?.nationality ?? "-",
    "Ar_Address": client?.address ?? "-",
    "Company": client?.company ?? "-",
    "Client Name": client?.clientName ?? "-",
    "Website": client?.website ?? "-",
    "Rating": client?.rating ?? "-",
  };

  final addressInformation = {
    "State": client?.state ?? "-",
    "City": client?.city ?? "-",
    "Country": client?.country ?? "-",
  };

  final description = {
    "Description": client?.description ?? "-",
  };

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      children: [
        sectionTitle("User Info"),
        buildFields(userInfo),
        sectionTitle("Client Information"),
        buildFields(clientInfo),
        sectionTitle("Address Information"),
        buildFields(addressInformation),
        sectionTitle("Description"),
        buildFields(description),
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
