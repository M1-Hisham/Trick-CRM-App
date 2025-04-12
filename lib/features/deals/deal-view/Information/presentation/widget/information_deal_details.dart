import 'package:flutter/material.dart';
import 'package:trick_crm_app/core/resources/resources.dart';
import 'package:trick_crm_app/core/widgets/app_text_form_field.dart';
import 'package:trick_crm_app/features/deals/deal-view/deal-view/data/model/deal_view_model.dart';

Widget informationDealDetails(DealViewModel dealViewModel) {
  final deal = dealViewModel.deal;
  final projects = dealViewModel.projects;
  final userInfo = {
    "Deal Owner": deal?.owner?.name ?? "-",
    "Closing Date": deal?.closingDate ?? "-",
    "Created By": deal?.createdBy ?? "-",
    "Client Name": deal?.client?.clientName ?? "-",
  };

  final dealInfo = {
    "Deal Name": deal?.dealName ?? "-",
    "Deal Owner": deal?.owner?.name ?? "-",
    "Deal Source": deal?.leadSource ?? "-",
    "Deal Status": deal?.status ?? "-",
    "Amount": deal?.amount ?? "-",
    "Project Name": projects != null
        ? projects.where((project) {
            return project.id == deal?.projectId;
          }).map(
            (project) {
              return project.name;
            },
          ).join()
        : "-",
    "Project Size": projects != null
        ? projects.where((project) {
            return project.id == deal?.projectId;
          }).map(
            (project) {
              return project.size;
            },
          ).join()
        : "-",
    "Project location": projects != null
        ? projects.where((project) {
            return project.id == deal?.projectId;
          }).map(
            (project) {
              return project.location;
            },
          ).join()
        : "-",
    "building number": projects != null
        ? projects.where((project) {
            return project.id == deal?.projectId;
          }).map(
            (project) {
              return project.projectUnits
                  ?.where((unit) => unit.id == deal?.unitId)
                  .map((unit) => unit.buildingNumber)
                  .join();
            },
          ).join()
        : "-",
    "Unit type": projects != null
        ? projects.where((project) {
            return project.id == deal?.projectId;
          }).map(
            (project) {
              return project.projectUnits
                  ?.where((unit) => unit.id == deal?.unitId)
                  .map((unit) => unit.unitType)
                  .join();
            },
          ).join()
        : "-",
    "Unit code": projects != null
        ? projects.where((project) {
            return project.id == deal?.projectId;
          }).map(
            (project) {
              return project.projectUnits
                  ?.where((unit) => unit.id == deal?.unitId)
                  .map((unit) => unit.unitCode)
                  .join();
            },
          ).join()
        : "-",
    "Unit number": projects != null
        ? projects.where((project) {
            return project.id == deal?.projectId;
          }).map(
            (project) {
              return project.projectUnits
                  ?.where((unit) => unit.id == deal?.unitId)
                  .map((unit) => unit.unitNumber)
                  .join();
            },
          ).join()
        : "-",
    "Unit reservation status": projects != null
        ? projects.where((project) {
            return project.id == deal?.projectId;
          }).map(
            (project) {
              return project.projectUnits
                  ?.where((unit) => unit.id == deal?.unitId)
                  .map((unit) => unit.reservationStatus)
                  .join();
            },
          ).join()
        : "-",
    "Plan Name": deal?.paymentPlan?.planName ?? "-",
    "Down Payment": deal?.paymentPlan?.downPaymentPercentage.toString() ?? "-",
    "Installment Years": deal?.paymentPlan?.years?.toString() ?? "-",
  };

  final description = {
    "Description": deal?.description ?? "-",
  };

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      children: [
        sectionTitle("User Info"),
        buildFields(userInfo),
        sectionTitle("deal Information"),
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
    "broker name": broker?.personName ?? "-",
    "broker email": broker?.email ?? "-",
    "broker company name": broker?.companyName ?? "-",
    "broker mobile": broker?.mobile ?? "-",
    "broker mobile 2": broker?.mobile2 ?? "-",
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
