import 'dart:convert';
import 'dart:developer';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/widgets/app_date_picker_field.dart';
import 'package:trick_crm_app/core/widgets/app_selection_form_field.dart';
import 'package:trick_crm_app/core/widgets/app_text_form_field.dart';

import 'package:trick_crm_app/features/meetings/create-meeting/data/model/create_meeting_request_body.dart';
import '../../../../core/cubits/user_cubit.dart';
import '../../../../core/di/setup-di/dependency_injection.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_waiting_feature.dart';
import '../../../auth/login/data/models/login_response.dart';
import '../../../leads/create-lead/presentation/widgets/top_bar_dialog.dart';
import '../../meetings/data/model/meetings_model.dart';
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

  List<Users> selectedParticipants = [];
  late TextEditingController participantsController;

  @override
  void initState() {
    super.initState();
    participantsController = TextEditingController();
  }

  @override
  void dispose() {
    participantsController.dispose();
    super.dispose();
  }

  List<String> encodeParticipants(List<Users> users) {
    return users.map((user) {
      return jsonEncode({
        'name': user.name,
        'user_id': user.id,
      });
    }).toList();
  }

  void _updateParticipantsField() {
    participantsController.text =
        selectedParticipants.map((e) => e.name).join(", ");
    _formData['participants'] = encodeParticipants(selectedParticipants);
  }

  List<String> selectedItems = [];

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
                          _allDaySwitch(
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
                                  ),
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
                                  ),
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
                          FormField<List<Users>>(
                            validator: (value) {
                              if (selectedParticipants.isEmpty) {
                                return 'Please select participants';
                              }
                              return null;
                            },
                            builder: (FormFieldState<List<Users>> field) {
                              return InputDecorator(
                                decoration: InputDecoration(
                                  errorText: field.errorText,
                                  label: RichText(
                                    text: const TextSpan(
                                      text: "Participants",
                                      style: TextStyle(color: Colors.black),
                                      children: [
                                        TextSpan(
                                          text: ' *',
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      ],
                                    ),
                                  ),
                                  labelStyle:
                                      const TextStyle(color: Colors.black),
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 20.w, vertical: 19.h),
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(14)),
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255, 139, 139, 139),
                                    ),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    borderSide: BorderSide(
                                      color: Color(0xFFE8ECF4),
                                    ),
                                  ),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton2<Users>(
                                    dropdownStyleData: DropdownStyleData(
                                      maxHeight: 250,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: R.colors.white,
                                      ),
                                    ),
                                    isDense: true,
                                    isExpanded: true,
                                    hint: Text(
                                      'Select an option',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    items: widget.meetingsModel.users
                                            ?.map((item) {
                                          return DropdownMenuItem<Users>(
                                            value: item,
                                            //disable default onTap to avoid closing menu when selecting an item
                                            enabled: false,
                                            child: StatefulBuilder(
                                              builder: (context, menuSetState) {
                                                final isSelected =
                                                    selectedParticipants
                                                        .contains(item);
                                                return InkWell(
                                                  onTap: () {
                                                    final alreadySelected =
                                                        selectedParticipants
                                                            .any((u) =>
                                                                u.id ==
                                                                item.id);
                                                    if (alreadySelected) {
                                                      selectedParticipants
                                                          .removeWhere((u) =>
                                                              u.id == item.id);
                                                      selectedItems
                                                          .remove(item.name);
                                                    } else {
                                                      selectedParticipants
                                                          .add(item);
                                                      selectedItems
                                                          .add(item.name ?? "");
                                                    }
                                                    _updateParticipantsField();
                                                    setState(() {});
                                                    menuSetState(() {});
                                                  },
                                                  child: Container(
                                                    height: double.infinity,
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 16.0),
                                                    child: Row(
                                                      children: [
                                                        if (isSelected)
                                                          const Icon(Icons
                                                              .check_box_outlined)
                                                        else
                                                          const Icon(Icons
                                                              .check_box_outline_blank),
                                                        const SizedBox(
                                                            width: 16),
                                                        Expanded(
                                                          child: Text(
                                                            item.name ?? "",
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          );
                                        }).toList() ??
                                        [],
                                    //Use last selected item as the current value so if we've limited menu height, it scroll to last item.
                                    value: selectedParticipants.isEmpty
                                        ? null
                                        : selectedParticipants.last,
                                    onChanged: (value) {
                                      setState(() {
                                        _formData['participants'] = value;
                                      });
                                    },
                                    selectedItemBuilder: (context) {
                                      return widget.meetingsModel.users?.map(
                                            (item) {
                                              return Text(
                                                selectedItems.join(', '),
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                maxLines: 1,
                                              );
                                            },
                                          ).toList() ??
                                          [];
                                    },
                                    buttonStyleData:
                                        ButtonStyleData(height: 32.h),
                                    menuItemStyleData: const MenuItemStyleData(
                                      padding: EdgeInsets.zero,
                                    ),
                                  ),
                                ),
                              );
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

  Widget _allDaySwitch({
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
        participants: encodeParticipants(selectedParticipants),
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
