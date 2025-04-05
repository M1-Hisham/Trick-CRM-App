import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/widgets/app_date_picker_field.dart';
import 'package:trick_crm_app/core/widgets/app_selection_form_field.dart';
import 'package:trick_crm_app/core/widgets/app_text_form_field.dart';

import 'package:trick_crm_app/features/meetings/create-meeting/data/model/create_meeting_request_body.dart';
import '../../../../core/cubits/user_cubit.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_waiting_feature.dart';
import '../../../auth/login/data/models/login_response.dart';
import '../../../leads/create-lead/presentation/widgets/top_bar_dialog.dart';
import '../../data/model/meetings_model.dart';
import '../logic/cubit/create_meeting_cubit.dart';

class CreateMeetingScreen extends StatefulWidget {
  final MeetingsModel meetingsModel;
  const CreateMeetingScreen({
    super.key,
    required this.meetingsModel,
  });

  @override
  State<CreateMeetingScreen> createState() => _CreateMeetingScreenState();
}

class _CreateMeetingScreenState extends State<CreateMeetingScreen> {
  final ScrollController scrollController = ScrollController();

  final _formKey = GlobalKey<FormState>();

  final Map<String, dynamic> _formData = {};

  bool isSelected = false;

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
                          //Title
                          AppTextFormField(
                            isRequired: true,
                            hintText: "Enter Title",
                            labelText: "Title",
                            onSaved: (value) {
                              _formData['title'] = value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                _scrollToTop();
                                return "Please enter title";
                              }
                              return null;
                            },
                          ),
                          spacingV(20),
                          //Location
                          AppTextFormField(
                            isRequired: true,
                            hintText: "Enter Location",
                            labelText: "Location",
                            onSaved: (value) {
                              _formData['location'] = value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                _scrollToTop();
                                return "Please enter location";
                              }
                              return null;
                            },
                          ),
                          spacingV(10),
                          _paymentPlanRow(
                            isSelected: isSelected,
                            onChanged: (bool? value) {
                              setState(() {
                                isSelected = !isSelected;
                                if (isSelected) {
                                  _formData['startDate'] = null;
                                  _formData['endDate'] = null;
                                }
                              });
                            },
                          ),
                          spacingV(10),
                          //Meeting Start Date
                          Row(
                            children: [
                              Expanded(
                                child: AppDatePickerField(
                                    hintText: "Start Date",
                                    onSaved: (value) {
                                      _formData['startDate'] = value;
                                    }),
                              ),
                              spacingH(20),
                              Visibility(
                                visible: !isSelected,
                                child: Expanded(
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
                              ),
                            ],
                          ),
                          spacingV(20),
                          //Meeting End Date
                          Row(
                            children: [
                              Expanded(
                                child: AppDatePickerField(
                                    hintText: "End Date",
                                    onSaved: (value) {
                                      _formData['endDate'] = value;
                                    }),
                              ),
                              spacingH(20),
                              Visibility(
                                visible: !isSelected,
                                child: Expanded(
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
                              ),
                            ],
                          ),
                          spacingV(20),
                          //Host
                          AppSelectionFormField(
                              labelText: "Host",
                              isRequired: true,
                              selections: [
                                ...?widget.meetingsModel.hostUsers != null
                                    ? widget.meetingsModel.hostUsers
                                        ?.map((e) => {
                                              "name": "${e.name}",
                                              "id": e.id,
                                            })
                                    : [],
                              ],
                              onSaved: (value) {
                                _formData['hostId'] = value;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  _scrollToTop();
                                  return "Please select host";
                                }
                                return null;
                              }),
                          spacingV(20),
                          // //!Participants
                          AppSelectionFormField(
                            isRequired: true,
                            labelText: "Participants",
                            selections: const [],
                            onSaved: (value) {
                              _formData['participants'] = value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                _scrollToTop();
                                return "Please select participants";
                              }
                              return null;
                            },
                          ),
                          spacingV(20),
                          //Related to
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: AppSelectionFormField(
                              labelText: "Related To",
                              selections: const [
                                "-None-",
                                "Leads",
                                "Clients",
                                "Contacts",
                              ],
                              onSaved: (value) {
                                _formData['relatedTo'] = value;
                              },
                              onChanged: (value) {
                                setState(() {
                                  _formData['relatedTo'] = value;
                                });
                              },
                            ),
                          ),
                          //Lead
                          Visibility(
                            visible: _formData['relatedTo'] == "Leads",
                            child:
                                //Lead
                                Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: AppSelectionFormField(
                                labelText: "Lead",
                                selections: [
                                  ...?widget.meetingsModel.leads != null
                                      ? widget.meetingsModel.leads?.map((e) => {
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
                            visible: _formData['relatedTo'] == "Clients",
                            child: Column(
                              children: [
                                //Client
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: AppSelectionFormField(
                                    labelText: "Client",
                                    selections: [
                                      ...?widget.meetingsModel.clients != null
                                          ? widget.meetingsModel.clients
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
                                        ...?widget.meetingsModel.deals != null
                                            ? widget.meetingsModel.deals
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
                                        ...?widget.meetingsModel.campaigns !=
                                                null
                                            ? widget.meetingsModel.campaigns
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
                            visible: _formData['relatedTo'] == "Contacts",
                            child:
                                //Contact
                                Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: AppSelectionFormField(
                                labelText: "Contact",
                                selections: [
                                  ...?widget.meetingsModel.contacts != null
                                      ? widget.meetingsModel.contacts
                                          ?.map((e) => {
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
              "Create New Meeting",
              "Complete all the fields below the form",
            ),
          ),
        ],
      ),
    );
  }

  Widget _paymentPlanRow({
    required final bool isSelected,
    required final ValueChanged<bool?> onChanged,
  }) {
    return Row(
      children: [
        Checkbox(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          activeColor: R.colors.primaryColor,
          side: const BorderSide(
            color: Color(0xffC8C8C8),
            width: 1,
          ),
          value: isSelected,
          onChanged: onChanged,
        ),
        const Expanded(
          child: Text(
            'All Day',
            style: TextStyle(fontSize: 14),
          ),
        ),
      ],
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
      var createMeetingRequestBody = CreateMeetingRequestBody(
        title: _formData["title"],
        location: _formData["location"],
        hostId: int.parse(_formData["hostId"]),
        participants: [
          "{\"name\":\"sales manager\",\"user_id\":3}",
          "{\"name\":\"developer\",\"user_id\":4}"
        ],
        startTime: _formData["startDate"],
        startTimeHour: _formData["End Time Hour"],
        endTime: _formData["endDate"],
        endTimeHour: _formData["End Time Hour"],
        relatedTo: _formData["relatedTo"],
        relatedToClient: _formData["clientRelatedTo"],
        leadId: _formData["leadId"] != null && _formData["leadId"] != ""
            ? int.parse(_formData["leadId"])
            : null,
        contactId:
            _formData["contactId"] != null && _formData["contactId"] != ""
                ? int.parse(_formData["contactId"])
                : null,
        clientId: _formData["clientId"] != null && _formData["clientId"] != ""
            ? int.parse(_formData["clientId"])
            : null,
        dealId: _formData["dealId"] != null && _formData["dealId"] != ""
            ? int.parse(_formData["dealId"])
            : null,
        compaignId:
            _formData["campaignId"] != null && _formData["campaignId"] != ""
                ? int.parse(_formData["campaignId"])
                : null,
        description: _formData["description"],
      );
      final cubit = getIt.get<CreateMeetingCubit>();
      appWaitingFeature(context);
      await cubit.createMeeting(createMeetingRequestBody);
      Navigator.pop(context);
      Navigator.pop(context, true);
      log("Submit Successfully");
    }
  }
}
