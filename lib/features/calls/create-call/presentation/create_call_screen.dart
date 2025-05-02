import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/widgets/app_selection_form_field.dart';
import 'package:trick_crm_app/core/widgets/app_text_form_field.dart';
import 'package:trick_crm_app/features/calls/calls/data/model/calls_model.dart';

import '../../../../core/cubits/user_cubit.dart';
import '../../../../core/di/setup-di/dependency_injection.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_date_picker_field.dart';
import '../../../../core/widgets/app_waiting_feature.dart';
import '../../../auth/login/data/models/login_response.dart';
import '../../../leads/create-lead/presentation/widgets/top_bar_dialog.dart';
import '../data/model/create_call_request_body.dart';
import '../logic/cubit/create_call_cubit.dart';

class CreateCallScreen extends StatefulWidget {
  final CallsModel callsModel;
  const CreateCallScreen({
    super.key,
    required this.callsModel,
  });

  @override
  State<CreateCallScreen> createState() => _CreateCallScreenState();
}

class _CreateCallScreenState extends State<CreateCallScreen> {
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
                          //Subject
                          AppTextFormField(
                            isRequired: true,
                            hintText: "Enter Subject",
                            labelText: "Subject",
                            onSaved: (value) {
                              _formData["subject"] = value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                _scrollToTop();
                                return "Please enter subject";
                              }
                              return null;
                            },
                          ),
                          spacingV(20),
                          //Select call to
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: AppSelectionFormField(
                              isRequired: true,
                              labelText: "Select call to",
                              selections: const [
                                "Leads",
                                "Clients",
                                "Contacts",
                              ],
                              onSaved: (value) {
                                _formData["callTo"] = value;
                              },
                              onChanged: (value) {
                                setState(() {
                                  _formData["callTo"] = value;
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  _scrollToTop();
                                  return "Please select call to";
                                }
                                return null;
                              },
                            ),
                          ),
                          //Lead
                          Visibility(
                            visible: _formData["callTo"] == "Leads",
                            child:
                                //Lead
                                Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: AppSelectionFormField(
                                labelText: "Lead",
                                selections: [
                                  ...?widget.callsModel.leads != null
                                      ? widget.callsModel.leads?.map((e) => {
                                            "name": "${e.leadName}",
                                            "id": e.id,
                                          })
                                      : [],
                                ],
                                onSaved: (value) {
                                  _formData['leadId'] = value;
                                },
                              ),
                            ),
                          ),
                          //Client
                          Visibility(
                            visible: _formData["callTo"] == "Clients",
                            child: Column(
                              children: [
                                //Client
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: AppSelectionFormField(
                                    labelText: "Client",
                                    selections: [
                                      ...?widget.callsModel.clients != null
                                          ? widget.callsModel.clients
                                              ?.map((e) => {
                                                    "name": "${e.clientName}",
                                                    "id": e.id,
                                                  })
                                          : [],
                                    ],
                                    onSaved: (value) {
                                      _formData['clientId'] = value;
                                    },
                                  ),
                                ),
                                // Client Related To
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: AppSelectionFormField(
                                    labelText: "Related To",
                                    selections: const [
                                      "-None-",
                                      "Deal",
                                      "Campaigns",
                                    ],
                                    onSaved: (value) {
                                      _formData['clientRelatedTo'] = value;
                                    },
                                    onChanged: (value) {
                                      setState(() {
                                        _formData['clientRelatedTo'] = value;
                                      });
                                    },
                                  ),
                                ),
                                //Deal
                                Visibility(
                                  visible:
                                      _formData['clientRelatedTo'] == "Deal",
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: AppSelectionFormField(
                                      labelText: "Deal",
                                      selections: [
                                        ...?widget.callsModel.deals != null
                                            ? widget.callsModel.deals
                                                ?.map((e) => {
                                                      "name": "${e.dealName}",
                                                      "id": e.id,
                                                    })
                                            : [],
                                      ],
                                      onSaved: (value) {
                                        _formData['dealId'] = value;
                                      },
                                    ),
                                  ),
                                ),
                                //Campaign
                                Visibility(
                                  visible: _formData['clientRelatedTo'] ==
                                      "Campaigns",
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: AppSelectionFormField(
                                      labelText: "Campaign",
                                      selections: [
                                        ...?widget.callsModel.campaigns != null
                                            ? widget.callsModel.campaigns
                                                ?.map((e) => {
                                                      "name":
                                                          "${e.campaignName}",
                                                      "id": e.id,
                                                    })
                                            : [],
                                      ],
                                      onSaved: (value) {
                                        _formData['campaignId'] = value;
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //Contact
                          Visibility(
                            visible: _formData["callTo"] == "Contacts",
                            child:
                                //Contact
                                Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: AppSelectionFormField(
                                labelText: "Contact",
                                selections: [
                                  ...?widget.callsModel.contacts != null
                                      ? widget.callsModel.contacts?.map((e) => {
                                            "name": "${e.contactName}",
                                            "id": e.id,
                                          })
                                      : [],
                                ],
                                onSaved: (value) {
                                  _formData['contactId'] = value;
                                },
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: AppDatePickerField(
                                    hintText: "Call Date",
                                    onSaved: (value) {
                                      _formData['callDate'] = value;
                                    }),
                              ),
                              spacingH(20),
                              Expanded(
                                child: AppSelectionFormField(
                                    labelText: 'Time',
                                    selections: const [
                                      '6:00 AM',
                                      '7:00 AM',
                                      '8:00 AM',
                                      '9:00 AM',
                                      '10:00 AM',
                                      '11:00 AM',
                                      '12:00 PM',
                                      '1:00 PM',
                                      '2:00 PM',
                                      '3:00 PM',
                                      '4:00 PM',
                                      '5:00 PM',
                                      '6:00 PM',
                                      '7:00 PM',
                                      '8:00 PM',
                                      '9:00 PM',
                                      '10:00 PM',
                                      '11:00 PM',
                                      '12:00 AM',
                                    ],
                                    onSaved: (value) {
                                      _formData['End Time Hour'] = value;
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        _scrollToTop();
                                        return 'Please enter a valid time';
                                      }
                                      return null;
                                    }),
                              ),
                            ],
                          ),
                          spacingV(20),
                          //Call Owner
                          AppSelectionFormField(
                            isRequired: true,
                            labelText: "Call Owner",
                            selections: [
                              {
                                "name": "${userData.name}(You)",
                                "id": userData.id,
                              },
                              ...?widget.callsModel.users != null
                                  ? widget.callsModel.users?.map((e) => {
                                        "name": "${e.name}",
                                        "id": e.id,
                                      })
                                  : [],
                            ],
                            onSaved: (value) {
                              _formData['callOwner'] = value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                _scrollToTop();
                                return 'Please enter a valid call owner';
                              }
                              return null;
                            },
                          ),
                          spacingV(20),
                          //Call Purpose
                          AppSelectionFormField(
                            labelText: "Call Purpose",
                            selections: const [
                              "-None-",
                              "Prospecting",
                              "Administrative",
                              "Negotiation",
                              "Demo",
                              "Project",
                              "Desk",
                            ],
                            onSaved: (value) {
                              _formData['callPurpose'] = value;
                            },
                          ),
                          spacingV(20),
                          //Type
                          AppSelectionFormField(
                            labelText: "Type",
                            selections: const ["Outbound", "Inbound"],
                            onSaved: (value) {
                              _formData['type'] = value;
                            },
                          ),
                          spacingV(20),
                          //Call Status
                          AppSelectionFormField(
                            isRequired: true,
                            labelText: "Call Status",
                            selections: const ["Compeleted", "Scheduled"],
                            onSaved: (value) {
                              _formData['callStatus'] = value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                _scrollToTop();
                                return 'Please enter a valid call status';
                              }
                              return null;
                            },
                          ),
                          spacingV(20),
                          //Call Result
                          AppSelectionFormField(
                            labelText: "Call Result",
                            selections: const [
                              "-None-",
                              "Inetersted",
                              "Not Inetersted",
                              "No Response / Busy",
                              "Requested more info",
                              "Requested call back",
                              "Invalid number",
                            ],
                            onSaved: (value) {
                              _formData['callResult'] = value;
                            },
                          ),
                          spacingV(20),
                          //Call Agenda
                          AppTextFormField(
                            hintText: "Enter Call Agenda",
                            labelText: "Call Agenda",
                            onSaved: (value) {
                              _formData['callAgenda'] = value;
                            },
                          ),
                          spacingV(20),
                          //description
                          AppTextFormField(
                            hintText: "Enter Description",
                            labelText: "Description",
                            maxLines: 2,
                            onSaved: (value) {
                              _formData['description'] = value;
                            },
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
              "Create New Call",
              "Complete all the fields below the form",
            ),
          ),
        ],
      ),
    );
  }

  void _scrollToTop() {
    scrollController.animateTo(0,
        duration: const Duration(milliseconds: 1000), curve: Curves.easeIn);
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
      var createCallRequestBody = CreateCallRequestBody(
        subject: _formData["subject"],
        ownerId: int.parse(_formData["callOwner"]),
        callTo: _formData["callTo"],
        callStatus: _formData["callStatus"],
        callType: _formData["type"],
        callPurpose: _formData["callPurpose"],
        startTime: _formData["callDate"],
        startTimeHour: _formData["End Time Hour"],
        relatedToClient: _formData["clientRelatedTo"],
        leadId: _formData["callTo"] == "Leads"
            ? int.parse(_formData["leadId"])
            : null,
        dealId: _formData["callTo"] == "Clients" &&
                _formData["clientRelatedTo"] == "Deal"
            ? int.parse(_formData["dealId"])
            : null,
        campaignId: _formData["callTo"] == "Clients" &&
                _formData["clientRelatedTo"] == "Campaigns"
            ? int.parse(_formData["campaignId"])
            : null,
        contactId: _formData["callTo"] == "Contacts"
            ? int.parse(_formData["contactId"])
            : null,
        clientId: _formData["callTo"] == "Clients"
            ? int.parse(_formData["clientId"])
            : null,
        callResult: _formData["callResult"],
        callAgenda: _formData["callAgenda"],
        description: _formData["description"],
      );
      final cubit = getIt.get<CreateCallCubit>();
      appWaitingFeature(context);
      await cubit.createCall(createCallRequestBody);
      Navigator.pop(context);
      Navigator.pop(context, true);
      log("Submit Successfully");
    }
  }
}
