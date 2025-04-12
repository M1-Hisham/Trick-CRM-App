import 'package:flutter/material.dart';
import 'package:trick_crm_app/core/helpers/spacing.dart';
import 'package:trick_crm_app/core/resources/resources.dart';
import 'package:trick_crm_app/core/widgets/app_text_form_field.dart';
import 'package:trick_crm_app/features/calls/call-view/call-view/data/model/call_view_model.dart';

import '../../../../../../core/widgets/app_button.dart';
import '../../../mark-call-compeleted/presentation/mark_call_compeleted.dart';

Widget informationCallDetails(CallViewModel callViewModel, context) {
  final call = callViewModel.call;
  final userInfo = {
    "subject": call?.subject ?? "-",
    "Date": call?.startTime ?? "-",
    "Status": call?.callStatus ?? "-",
  };

  final callInfo = {
    "Call Owner": call?.owner?.name ?? "-",
    "Subject": call?.subject ?? "-",
    "Due Date": call?.startTime ?? "-",
    "Status": call?.callStatus ?? "-",
    "Lead": call?.lead?.leadName ?? "-",
    "Call Purpose": call?.callPurpose ?? "-",
  };

  final description = {
    "Description": call?.description ?? "-",
  };

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      children: [
        AppButton(
          text: "Mark As Compeleted",
          onPressed: () => markCallCompeleted(
            context,
            call!.id!,
          ),
        ),
        // spacingV(10),
        // Row(
        //   children: [
        //     Expanded(
        //       child: AppButton(
        //         icon: Icon(Icons.edit, color: R.colors.white, size: 20),
        //         text: "Edit",
        //         onPressed: () {},
        //       ),
        //     ),
        //     spacingH(10),
        //     Expanded(
        //       child: AppButton(
        //         borderColor: R.colors.red,
        //         // overlayColor: R.colors.red,
        //         backgroundColor: R.colors.red,
        //         // backgroundColor: ThemeData.light().scaffoldBackgroundColor,
        //         icon: Icon(Icons.delete, color: R.colors.white, size: 20),
        //         text: "Delete",
        //         onPressed: () {},
        //       ),
        //     ),
        //   ],
        // ),
        spacingV(20),
        buildFields(userInfo),
        sectionTitle("Call Information"),
        buildFields(callInfo),
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
