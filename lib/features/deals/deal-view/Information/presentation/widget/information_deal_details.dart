import 'package:flutter/material.dart';
import 'package:trick_crm_app/core/di/setup-di/dependency_injection.dart';
import 'package:trick_crm_app/core/helpers/spacing.dart';
import 'package:trick_crm_app/core/resources/resources.dart';
import 'package:trick_crm_app/core/widgets/app_text_form_field.dart';
import 'package:trick_crm_app/features/deals/deal-view/Close-Deal/presentation/close_deal.dart';
import 'package:trick_crm_app/features/deals/deal-view/deal-view/data/model/deal_view_model.dart';

import '../../../../../../core/widgets/app_button.dart';
import '../../../../../../core/widgets/app_show_modal_bottom_sheet.dart';
import '../../../../deals/data/model/deals_model.dart';
import '../../../Edit-Deal/presentation/widget/edit_deal_details.dart';
import '../../../deal-view/logic/cubit/deal_view_cubit.dart';

Widget informationDealDetails(
    context, DealsModel dealsModel, DealViewModel dealViewModel) {
  final deal = dealViewModel.deal;
  final userInfo = {
    "Deal Owner": deal?.owner?.name ?? "-",
    "Closing Date": deal?.closingDate ?? "-",
    "Created By": deal?.createdBy ?? "-",
    "Client Name": deal?.client?.clientName ?? "-",
  };

  final dealInfo = {
    "Deal Name": deal?.dealName ?? "_",
    "Deal Owner": deal?.owner?.name ?? "_",
    "Deal Source": deal?.leadSource ?? "_",
    "Deal Status": deal?.status ?? "_",
    "Amount": deal?.amount ?? "_",
    "Project Name": dealViewModel.dealProject?.name ?? "_",
    "Project Size": dealViewModel.dealProject?.size ?? "_",
    "Project location": dealViewModel.dealProject?.location ?? "_",
    "building number": dealViewModel.dealUnit?.buildingNumber ?? "_",
    "Unit type": dealViewModel.dealUnit?.unitType ?? "_",
    "Unit code": dealViewModel.dealUnit?.unitCode ?? "_",
    "Unit number": dealViewModel.dealUnit?.unitNumber ?? "_",
    "Unit reservation status": dealViewModel.dealUnit?.reservationStatus ?? "_",
    "Plan Name": dealViewModel.unitPlanDetails?.planName ?? "_",
    "Down Payment":
        "${dealViewModel.unitPlanDetails?.downPaymentPercentage.toString() ?? "_"}%",
    "Installment Years":
        dealViewModel.unitPlanDetails?.years?.toString() ?? "_",
  };

  final description = {
    "Description": deal?.description ?? "_",
  };

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      children: [
        spacingV(10),
        Row(
          children: [
            Expanded(
              child: AppButton(
                text: "Edit Deal",
                onPressed: () async {
                  final result = await appShowModalBottomSheet(
                    context: context,
                    builder: (context) => EditDealDetails(
                      dealsModel: dealsModel,
                      dealViewModel: dealViewModel,
                      dealId: deal?.id ?? 0,
                    ),
                  );
                  if (result == true) {
                    getIt<DealViewCubit>().getDealView(deal?.id ?? 0);
                  }
                },
              ),
            ),
            spacingH(20),
            Expanded(
              child: AppButton(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                borderColor: Colors.red,
                text: "Close Deal",
                textStyle: TextStyle(
                  color: R.colors.red,
                ),
                onPressed: () => closeDeal(context, deal?.id ?? 0),
              ),
            ),
          ],
        ),
        spacingV(20),
        sectionTitle("User Info"),
        buildFields(userInfo),
        sectionTitle("Deal Information"),
        buildFields(dealInfo),
        sectionTitle("Description"),
        buildFields(description),
        if (deal?.broker != null)
          ...borkerInformation(deal?.broker)
        else
          const SizedBox.shrink(),
      ],
    ),
  );
}

borkerInformation(Broker? broker) {
  final borkerInfo = {
    "broker name": broker?.personName ?? "_",
    "broker email": broker?.email ?? "_",
    "broker company name": broker?.companyName ?? "_",
    "broker mobile": broker?.mobile ?? "_",
    "broker mobile 2": broker?.mobile2 ?? "_",
  };
  return [
    sectionTitle("Borker Information"),
    buildFields(borkerInfo),
  ];
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
