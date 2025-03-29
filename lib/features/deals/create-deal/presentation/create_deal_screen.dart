import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/widgets/app_date_picker_field.dart';
import 'package:trick_crm_app/core/widgets/app_selection_form_field.dart';
import 'package:trick_crm_app/core/widgets/app_text_form_field.dart';

import '../../../../core/cubits/user_cubit.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../auth/login/data/models/login_response.dart';
import '../../../leads/create-lead/presentation/widgets/top_bar_dialog.dart';
import '../../data/model/deals_model.dart';
import '../data/model/create_deal_request_body.dart';
import '../logic/cubit/create_deal_cubit.dart';

class CreateDealScreen extends StatelessWidget {
  final DealsModel dealsModel;
  CreateDealScreen({
    super.key,
    required this.dealsModel,
  });

  final ScrollController scrollController = ScrollController();

  final _formKey = GlobalKey<FormState>();

  final Map<String, dynamic> _formData = {};

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: BlocBuilder<UserCubit, UserData?>(
              bloc: getIt.get<UserCubit>(),
              builder: (context, userData) {
                if (userData == null) {
                  return const Center(child: CircularProgressIndicator());
                }
                return ListView(
                  controller: scrollController,
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(20),
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  children: [
                    spacingV(120),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppSelectionFormField(
                            isRequired: true,
                            labelText: "Deal Owner",
                            selections: [
                              {
                                "name": userData.name,
                                'id': userData.id,
                              },
                              ...?dealsModel.users?.map(
                                (e) => {
                                  "name": e.name,
                                  'id': e.id,
                                },
                              ),
                            ],
                            onSaved: (value) {
                              _formData["dealOwnerId"] = value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                _scrollToTop();
                                return "Deal Owner is required";
                              }
                              return null;
                            },
                          ),
                          spacingV(20),
                          AppTextFormField(
                            isRequired: true,
                            hintText: "Enter Deal Name",
                            labelText: "Deal Name",
                            onSaved: (value) {
                              _formData["dealName"] = value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                _scrollToTop();
                                return "Deal Name is required";
                              }
                              return null;
                            },
                          ),
                          spacingV(30),
                          AppSelectionFormField(
                            isRequired: true,
                            labelText: "Client Name",
                            selections: [
                              ...?dealsModel.clients?.map(
                                (e) => {
                                  "name": e.clientName,
                                  'id': e.id,
                                },
                              ),
                            ],
                            onSaved: (value) {
                              _formData["clientName"] = value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                _scrollToTop();
                                return "Client Name is required";
                              }
                              return null;
                            },
                          ),
                          spacingV(20),
                          AppDatePickerField(
                            hintText: "Closing Date",
                            validator: false,
                            onSaved: (value) {
                              _formData["closingDate"] = value;
                            },
                          ),
                          spacingV(20),
                          AppTextFormField(
                            isRequired: true,
                            keyboardType: TextInputType.number,
                            hintText: "Enter Amount",
                            labelText: "Amount",
                            onSaved: (value) {
                              _formData["amount"] = value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                _scrollToTop();
                                return "Deal Amount is required";
                              }
                              return null;
                            },
                          ),
                          spacingV(30),
                          AppSelectionFormField(
                            labelText: "Lead Source",
                            selections: const [
                              "Advertisment",
                              "Cold Call",
                              "Employee Referral",
                              "External Referral",
                              "Online Store",
                              "Twitter",
                              "Facebook",
                              "Partner",
                              "Google+",
                              "Public Relations",
                              "Sales Email Alias",
                              "Seminar Partner",
                              "Internal Seminar",
                              "Trade Show",
                              "Web Download",
                              "Web Research",
                              "chat",
                            ],
                            onSaved: (value) {
                              _formData["leadSource"] = value;
                            },
                          ),
                          spacingV(20),
                          AppSelectionFormField(
                            labelText: "Borker",
                            selections: [
                              ...?dealsModel.brokers?.map(
                                (e) => {
                                  "name": e.companyName,
                                  'id': e.id,
                                },
                              ),
                            ],
                            onSaved: (value) {
                              _formData["broker"] = value;
                            },
                          ),
                          spacingV(20),
                          AppSelectionFormField(
                            labelText: "Campaign",
                            selections: [
                              ...?dealsModel.campaigns?.map(
                                (e) => {
                                  "name": e.campaignName,
                                  'id': e.id,
                                },
                              ),
                            ],
                            onSaved: (value) {
                              _formData["campaign"] = value;
                            },
                          ),
                          spacingV(20),
                          _selectionFieldProjectAndUnit(),
                          spacingV(20),
                          _selectionFieldReservationStatusAndDownPayment(),
                          AppTextFormField(
                            labelText: "Installment Years",
                            hintText: "Enter Installment Years",
                            keyboardType: TextInputType.number,
                            onSaved: (value) {
                              _formData["installmentYears"] = value;
                            },
                            controller: TextEditingController(
                              text: dealsModel.projects
                                      ?.where((element) =>
                                          element.id == _projectsId())
                                      .expand((project) =>
                                          project.projectDownPayments ?? [])
                                      .map((e) => e.downPayment ?? [])
                                      .where((element) =>
                                          element.id == _unitPaymentPlanId())
                                      .map((e) => e.years)
                                      .toList()
                                      .join(", ") ??
                                  "",
                            ),
                          ),
                          spacingV(20),
                          AppTextFormField(
                            labelText: "Area",
                            hintText: "Enter Area",
                            keyboardType: TextInputType.number,
                            onSaved: (value) {
                              _formData["area"] = value;
                            },
                            controller: TextEditingController(
                              text: dealsModel.projects
                                      ?.where(
                                        (element) =>
                                            element.id == _projectsId(),
                                      )
                                      .expand((project) =>
                                          project.projectUnits ?? [])
                                      .where(
                                        (element) =>
                                            element.id == _projectUnitId(),
                                      )
                                      .map((e) => e.unitArea)
                                      .toList()
                                      .join(", ") ??
                                  "",
                            ),
                          ),
                          spacingV(20),
                          AppTextFormField(
                            labelText: "Description",
                            hintText: "Enter Description",
                            onSaved: (value) {
                              _formData["description"] = value;
                            },
                            maxLines: 3,
                          ),
                        ],
                      ),
                    ),
                    spacingV(20),
                    ..._submitAndCancel(context),
                    spacingV(20),
                  ],
                );
              },
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: topBarDialog(
              "Create New Deal",
              "Complete all the fields below the form",
            ),
          ),
        ],
      ),
    );
  }

  int? _projectsId() {
    return _formData['projectName'] != '' && _formData['projectName'] != null
        ? int.parse(_formData['projectName'])
        : null;
  }

  int? _unitPaymentPlanId() {
    return _formData['unitPaymentPlan'] != '' &&
            _formData['unitPaymentPlan'] != null
        ? int.parse(_formData['unitPaymentPlan'])
        : null;
  }

  int? _projectUnitId() {
    return _formData['unitCode'] != '' && _formData['unitCode'] != null
        ? int.parse(_formData['unitCode'])
        : null;
  }

  Widget _selectionFieldProjectAndUnit() {
    return StatefulBuilder(
      builder: (context, setState) {
        return Column(
          children: [
            InputDecorator(
              decoration: InputDecoration(
                label: RichText(
                  text: TextSpan(
                    text: 'Project Name',
                    style: R.textStyles.font14DimGrayW400.copyWith(
                      color: const Color(0XFF2C2E32),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    children: const [
                      TextSpan(
                        text: ' *',
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
                isDense: true,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20.w, vertical: 19.h),
                hintStyle: R.textStyles.font15RegentGrayW500,
                filled: true,
                fillColor: R.colors.white,
                alignLabelWithHint: true,
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 139, 139, 139),
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 139, 139, 139),
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(
                    color: Color(0xFFE8ECF4),
                  ),
                ),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButtonFormField<String>(
                  menuMaxHeight: 250,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                  ),
                  dropdownColor: R.colors.white,
                  value: _formData["projectName"],
                  isDense: true,
                  hint: Text(
                    "Select an option",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey,
                    ),
                  ),
                  onChanged: (dynamic value) {
                    if (value != null) {
                      setState(() {
                        _formData["projectName"] = value;
                      });
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      _scrollToTop();
                      return "Project Name is required";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _formData["projectName"] = value;
                  },
                  items: [
                    ...?dealsModel.projects?.map(
                      (e) => {
                        "name": e.name,
                        'id': e.id,
                      },
                    ),
                  ].map((dynamic value) {
                    return DropdownMenuItem<String>(
                      value: value['id'].toString(),
                      child: Text(
                        value['name'].toString(),
                        style: TextStyle(
                          fontSize: 14.sp,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            spacingV(20),
            InputDecorator(
              decoration: InputDecoration(
                label: RichText(
                  text: TextSpan(
                    text: 'Unit Code',
                    style: R.textStyles.font14DimGrayW400.copyWith(
                      color: const Color(0XFF2C2E32),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    children: const [
                      TextSpan(
                        text: ' *',
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
                isDense: true,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20.w, vertical: 19.h),
                hintStyle: R.textStyles.font15RegentGrayW500,
                filled: true,
                fillColor: R.colors.white,
                alignLabelWithHint: true,
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 139, 139, 139),
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 139, 139, 139),
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(
                    color: Color(0xFFE8ECF4),
                  ),
                ),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButtonFormField<String>(
                  menuMaxHeight: 250,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                  ),
                  dropdownColor: R.colors.white,
                  value: _formData["unitCode"] != null &&
                          [
                            ...?dealsModel.projects
                                ?.where(
                                    (element) => element.id == _projectsId())
                                .expand((project) => project.projectUnits ?? [])
                                .map((e) => {
                                      "name": e.unitCode,
                                      'id': e.id,
                                    }),
                          ].any((item) =>
                              item['id'].toString() == _formData["unitCode"])
                      ? _formData["unitCode"]
                      : null,
                  isDense: true,
                  hint: Text(
                    "Select an option",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey,
                    ),
                  ),
                  onChanged: (dynamic value) {
                    if (value != null) {
                      setState(() {
                        _formData["unitCode"] = value;
                      });
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      _scrollToTop();
                      return "Unit Code is required";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _formData["unitCode"] = value;
                  },
                  items: [
                    ...?dealsModel.projects
                        ?.where(
                          (element) => element.id == _projectsId(),
                        )
                        .expand((project) => project.projectUnits ?? [])
                        .map(
                          (e) => {
                            "name": e.unitCode,
                            'id': e.id,
                          },
                        ),
                  ].map((dynamic value) {
                    return DropdownMenuItem<String>(
                      value: value['id'].toString(),
                      child: Text(
                        value['name'].toString(),
                        style: TextStyle(
                          fontSize: 14.sp,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            spacingV(20),
            InputDecorator(
              decoration: InputDecoration(
                label: RichText(
                  text: TextSpan(
                    text: 'Unit Payment Plan',
                    style: R.textStyles.font14DimGrayW400.copyWith(
                      color: const Color(0XFF2C2E32),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    children: const [
                      TextSpan(
                        text: ' *',
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
                isDense: true,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20.w, vertical: 19.h),
                hintStyle: R.textStyles.font15RegentGrayW500,
                filled: true,
                fillColor: R.colors.white,
                alignLabelWithHint: true,
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 139, 139, 139),
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 139, 139, 139),
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(
                    color: Color(0xFFE8ECF4),
                  ),
                ),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButtonFormField<String>(
                  menuMaxHeight: 250,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                  ),
                  dropdownColor: R.colors.white,
                  value: _formData["unitPaymentPlan"] != null &&
                          ([
                            ...?dealsModel.projects
                                ?.where(
                                  (element) => element.id == _projectsId(),
                                )
                                .expand((project) =>
                                    project.projectDownPayments ?? [])
                                .map((e) => e.downPayment ?? [])
                                .map(
                                  (e) => {
                                    "name": e.planName,
                                    'id': e.id,
                                  },
                                ),
                          ].map((dynamic value) => DropdownMenuItem<String>(
                                    value: value['id'].toString(),
                                    child: Text(
                                      value['name'].toString(),
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  )))
                              .any((item) =>
                                  item.value == _formData["unitPaymentPlan"])
                      ? _formData["unitPaymentPlan"]
                      : null,
                  isDense: true,
                  hint: Text(
                    "Select an option",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey,
                    ),
                  ),
                  onChanged: (dynamic value) {
                    if (value != null) {
                      setState(() {
                        _formData["unitPaymentPlan"] = value;
                      });
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      _scrollToTop();
                      return "Unit Payment Plan is required";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _formData["unitPaymentPlan"] = value;
                  },
                  items: [
                    ...?dealsModel.projects
                        ?.where(
                          (element) => element.id == _projectsId(),
                        )
                        .expand((project) => project.projectDownPayments ?? [])
                        .map((e) => e.downPayment ?? [])
                        .map(
                          (e) => {
                            "name": e.planName,
                            'id': e.id,
                          },
                        ),
                  ].map((dynamic value) {
                    return DropdownMenuItem<String>(
                      value: value['id'].toString(),
                      child: Text(
                        value['name'].toString(),
                        style: TextStyle(
                          fontSize: 14.sp,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _selectionFieldReservationStatusAndDownPayment() {
    return StatefulBuilder(
      builder: (context, setState) {
        return Column(
          children: [
            InputDecorator(
              decoration: InputDecoration(
                label: RichText(
                  text: TextSpan(
                    text: 'Reservation Status',
                    style: R.textStyles.font14DimGrayW400.copyWith(
                      color: const Color(0XFF2C2E32),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    children: const [
                      TextSpan(
                        text: ' *',
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
                isDense: true,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20.w, vertical: 19.h),
                hintStyle: R.textStyles.font15RegentGrayW500,
                filled: true,
                fillColor: R.colors.white,
                alignLabelWithHint: true,
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 139, 139, 139),
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 139, 139, 139),
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(
                    color: Color(0xFFE8ECF4),
                  ),
                ),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButtonFormField<String>(
                  menuMaxHeight: 250,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                  ),
                  dropdownColor: R.colors.white,
                  value: _formData["reservationStatus"],
                  isDense: true,
                  hint: Text(
                    "Select an option",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey,
                    ),
                  ),
                  onChanged: (dynamic value) {
                    if (value != null) {
                      setState(() {
                        _formData["reservationStatus"] = value;
                      });
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      _scrollToTop();
                      return "Reservation Status is required";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _formData["reservationStatus"] = value;
                  },
                  items: [
                    "EOI",
                    "URF",
                  ].map((dynamic value) {
                    return DropdownMenuItem<String>(
                      value: value.toString(),
                      child: Text(
                        value.toString(),
                        style: TextStyle(
                          fontSize: 14.sp,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            spacingV(20),
            Visibility(
              visible: _formData["reservationStatus"] == "URF",
              child: Column(
                children: [
                  AppTextFormField(
                    isRequired: true,
                    labelText: "Down Payment",
                    hintText: "Enter Down Payment",
                    keyboardType: TextInputType.number,
                    onSaved: (value) {
                      _formData["downPayment"] = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        _scrollToTop();
                        return "Down Payment is required";
                      }
                      return null;
                    },
                  ),
                  spacingV(20),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  void _scrollToTop() {
    scrollController.animateTo(0,
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  List<Widget> _submitAndCancel(context) {
    return [
      Row(
        children: [
          Expanded(
            child: AppButton(
              icon: SvgPicture.asset(R.icons.add),
              text: "Create",
              onPressed: () => _submitCreate(context),
            ),
          ),
          spacingH(10),
          Expanded(
            child: AppButton(
              text: "Cancel",
              textStyle: R.textStyles.font14DimGrayW400.copyWith(
                fontWeight: FontWeight.w500,
              ),
              onPressed: Get.back,
              backgroundColor: R.colors.white,
              borderColor: const Color(0xffC8C8C8),
              overlayColor: R.colors.primaryColor,
            ),
          ),
        ],
      ),
    ];
  }

  void _submitCreate(context) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      log("_formData: $_formData");
      var createDealRequestBody = CreateDealRequestBody(
        dealOwnerId: _formData['dealOwnerId'],
        dealName: _formData['dealName'],
        clientId: int.parse(_formData['clientName']),
        amount: int.parse(_formData['amount']),
        projectId: int.parse(_formData['projectName']),
        unitId: int.parse(_formData['unitCode']),
        closingDate: _formData['closingDate'],
        leadSource: _formData['leadSource'],
        downPaymentId: int.parse(_formData['unitPaymentPlan']),
        downPayment:
            _formData['downPayment'] != '' && _formData['downPayment'] != null
                ? int.parse(_formData['downPayment'])
                : null,
        years: int.parse(_formData['installmentYears']),
        reservationStatus: _formData['reservationStatus'],
        brokerId: _formData['broker'] != '' && _formData['broker'] != null
            ? int.parse(_formData['broker'])
            : null,
        campaignId: _formData['campaign'] != '' && _formData['campaign'] != null
            ? int.parse(_formData['campaign'])
            : null,
        unitArea: _formData['area'] != '' && _formData['area'] != null
            ? double.parse(_formData['area'])
            : null,
        description: _formData['description'],
      );
      final cubit = getIt.get<CreateDealCubit>();
      Get.back();
      await cubit.createDeal(createDealRequestBody);
      log("Submit Successfully");
    }
  }
}
