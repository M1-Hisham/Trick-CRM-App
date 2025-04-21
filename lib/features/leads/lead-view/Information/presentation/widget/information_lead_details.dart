import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trick_crm_app/core/resources/resources.dart';
import 'package:trick_crm_app/core/widgets/app_text_form_field.dart';

import '../../../lead-view/data/model/leads_view_model.dart';

Widget informationLeadDetails(LeadsViewModel leadsViewModel) {
  final lead = leadsViewModel.lead;
  final userInfo = {
    "Lead Owner": lead?.ownerName ?? "-",
    "Email": lead?.email ?? "-",
    "Mobile": lead?.mobile ?? "-",
    "Lead Status": lead?.leadStatus ?? "-",
  };

  /// Format the date
  var dateValue = DateFormat("yyyy-MM-ddTHH:mm:ssZ")
      .parseUTC(lead?.createdAt ?? "0000-00-00T00:00:21Z")
      .toLocal();
  String formattedDate = DateFormat("yyyy-MM-dd").format(dateValue);

  final leadInfo = {
    "Lead Owner": lead?.ownerName ?? "-",
    "Lead Assigner To": lead?.assigned?.name ?? "-",
    "Lead End At": lead?.endTime ?? "-",
    "Lead End At Hour": lead?.endTimeHour ?? "-",
    "Title": lead?.jobTitle ?? "-",
    "Lead Source": lead?.leadSource ?? "-",
    "Lead Status": lead?.leadStatus ?? "-",
    "Industry": lead?.industry ?? "-",
    "Email": lead?.email ?? "-",
    "Mobile": lead?.mobile ?? "-",
    "Mobile 2": lead?.mobile2 ?? "-",
    "Company": lead?.company ?? "-",
    "Lead Name": lead?.leadName ?? "-",
    "Annual Revenue": lead?.annualRevenue.toString() ?? "-",
    "Website": lead?.website ?? "-",
    "Rating": lead?.rating ?? "-",
    "Created At": formattedDate,
  };

  final addressInformation = {
    "State": lead?.state ?? "-",
    "City": lead?.city ?? "-",
    "Country": lead?.country ?? "-",
  };

  final description = {
    "Description": lead?.description ?? "-",
  };

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      children: [
        sectionTitle("User Info"),
        buildFields(userInfo),
        sectionTitle("Lead Information"),
        buildFields(leadInfo),
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
