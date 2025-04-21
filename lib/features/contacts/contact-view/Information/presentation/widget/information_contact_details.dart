import 'package:flutter/material.dart';
import 'package:trick_crm_app/core/resources/resources.dart';
import 'package:trick_crm_app/core/widgets/app_text_form_field.dart';
import 'package:trick_crm_app/features/contacts/contact-view/contact-view/data/model/contacts_view_model.dart';

Widget informationContactDetails(ContactsViewModel contactsViewModel) {
  final contact = contactsViewModel.contact;
  final userInfo = {
    "Contact Owner": contact?.ownerName ?? "-",
    "Email": contact?.email ?? "-",
    "Mobile": contact?.mobile ?? "-",
  };

  final contactInfo = {
    "Contact Owner": contact?.ownerName ?? "-",
    "Contact Assigner To": contact?.assigned?.name ?? "-",
    "Contact End At": contact?.endTime ?? "-",
    "Contact End At Hour": contact?.endTimeHour ?? "-",
    "Title": contact?.jobTitle ?? "-",
    "Contact Source": contact?.leadSource ?? "-",
    "Industry": contact?.industry ?? "-",
    "Email": contact?.email ?? "-",
    "Mobile": contact?.mobile ?? "-",
    "Sec. Mobile": contact?.mobile2 ?? "-",
    "Company": contact?.company ?? "-",
    "Contact Name": contact?.contactName ?? "-",
    "Website": contact?.website ?? "-",
    "Rating": contact?.rating ?? "-",
  };

  final addressInformation = {
    "State": contact?.state ?? "-",
    "City": contact?.city ?? "-",
    "Country": contact?.country ?? "-",
  };

  final description = {
    "Description": contact?.description ?? "-",
  };

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      children: [
        sectionTitle("User Info"),
        buildFields(userInfo),
        sectionTitle("Contact Information"),
        buildFields(contactInfo),
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
