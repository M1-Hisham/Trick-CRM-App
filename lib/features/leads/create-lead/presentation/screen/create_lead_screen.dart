import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/widgets/app_text_form_field.dart';
import 'package:trick_crm_app/core/widgets/app_waiting_feature.dart';

import '../../../../../core/cubits/user_cubit.dart';
import '../../../../../core/di/setup-di/dependency_injection.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/resources/resources.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_date_picker_field.dart';
import '../../../../../core/widgets/app_selection_form_field.dart';
import '../../../../auth/login/data/models/login_response.dart';
import '../../../leads/data/models/leads_model.dart';
import '../../data/models/create_lead_request_body.dart';
import '../../logic/cubit/create_lead_cubit.dart';
import '../widgets/top_bar_dialog.dart';

class CreateLeadScreen extends StatefulWidget {
  final LeadsModel leadsModel;
  const CreateLeadScreen({super.key, required this.leadsModel});

  @override
  State<CreateLeadScreen> createState() => _CreateLeadScreenState();
}

class _CreateLeadScreenState extends State<CreateLeadScreen> {
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
                    // UploadClientImage(fun: (pickedFile) {
                    //   if (pickedFile != null) {
                    //     _formData['image'] = File(pickedFile.name);
                    //   }
                    // }),
                    // spacingV(20),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Lead Information",
                            style: R.textStyles.font17PrimaryW600,
                          ),
                          spacingV(20),
                          //Lead Owner
                          AppSelectionFormField(
                            isChange: false,
                            isRequired: true,
                            labelText: "Lead Owner",
                            selections: [
                              {
                                "name": "${userData.name}(You)",
                                "id": userData.id
                              },
                            ],
                            onSaved: (value) {
                              _formData['leadOwnerId'] = value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please select an owner";
                              }
                              return null;
                            },
                          ),
                          spacingV(20),
                          //Assign To
                          AppSelectionFormField(
                            labelText: "Assign To",
                            selections: [
                              {
                                "name": "${userData.name}(You)",
                                "id": userData.id
                              },
                              ...?widget.leadsModel.users != null
                                  ? widget.leadsModel.users
                                      ?.map((e) => {
                                            "name": "${e.name}",
                                            "id": e.id,
                                          })
                                      .toList()
                                  : []
                            ],
                            onSaved: (value) {
                              _formData['assignedToId'] = value;
                            },
                            onChanged: (value) {
                              if (value != null) {
                                setState(() {
                                  _formData['assignedToId'] = value;
                                });
                              }
                            },
                          ),
                          spacingV(20),
                          // Date Picker
                          Visibility(
                            visible: _formData['assignedToId'] != null,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 22),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: AppDatePickerField(
                                      isRequired: true,
                                      onSaved: (value) {
                                        _formData['endTime'] = value;
                                      },
                                    ),
                                  ),
                                  spacingH(20),
                                  Flexible(
                                    child: AppSelectionFormField(
                                        isRequired: true,
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
                                          _formData['endTimeHour'] = value;
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
                            ),
                          ),
                          Text(
                            "Contact Information",
                            style: R.textStyles.font17PrimaryW600,
                          ),
                          spacingV(20),
                          // First Name
                          AppTextFormField(
                            isRequired: true,
                            labelText: "First Name",
                            hintText: "Enter First Name",
                            keyboardType: TextInputType.name,
                            onSaved: (value) {
                              _formData['firstName'] = value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                _scrollToTop();
                                return "Please enter a first name";
                              }
                              return null;
                            },
                          ),
                          spacingV(20),
                          // Last Name
                          AppTextFormField(
                            isRequired: true,
                            labelText: "Last Name",
                            hintText: "Enter Last Name",
                            keyboardType: TextInputType.name,
                            onSaved: (value) {
                              _formData['lastName'] = value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                _scrollToTop();
                                return "Please enter a last name";
                              }
                              return null;
                            },
                          ),
                          spacingV(20),
                          // Email
                          AppTextFormField(
                            isRequired: true,
                            labelText: "Email",
                            hintText: "Enter Email",
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (value) {
                              _formData['email'] = value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                _scrollToTop();
                                return "Please enter a valid email";
                              }

                              return null;
                            },
                          ),
                          spacingV(20),
                          // Title
                          AppTextFormField(
                            labelText: "Title",
                            hintText: "Enter Title",
                            keyboardType: TextInputType.name,
                            onSaved: (value) {
                              _formData['title'] = value;
                            },
                          ),
                          spacingV(20),
                          // Phone Number
                          AppTextFormField(
                            isRequired: true,
                            labelText: "Phone Number",
                            hintText: "Enter Phone Number",
                            keyboardType: TextInputType.phone,
                            onSaved: (value) {
                              _formData['phone'] = value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                _scrollToTop();
                                return "Please enter a valid phone number";
                              }
                              return null;
                            },
                          ),
                          spacingV(20),
                          // Sec. Phone Number
                          AppTextFormField(
                            labelText: "Sec. Phone Number",
                            hintText: "Enter Sec. Phone Number",
                            keyboardType: TextInputType.phone,
                            onSaved: (value) {
                              _formData['secPhone'] = value;
                            },
                          ),
                          spacingV(20),
                          // Company
                          AppTextFormField(
                            labelText: "Company",
                            hintText: "Enter Company",
                            keyboardType: TextInputType.name,
                            onSaved: (value) {
                              _formData['company'] = value;
                            },
                          ),
                          spacingV(20),
                          // Industry
                          AppSelectionFormField(
                            labelText: "Industry",
                            selections: const [
                              'ASP (Application Service Provider)',
                              'Data/Telecom OEM',
                              'ERP (Enterprise Resource Planning)',
                              'Government/Military',
                              'Large Enterprise',
                              'Management ISV',
                              'MSP (Managed Service Provider)',
                              'Network Equipment/Security',
                              'Non-management ISV',
                              'Optical Networking',
                              'Service Provider',
                              'Small/Medium Enterprise',
                              'Storage Equipment',
                              'System Integrator',
                              'Wireless Industry',
                            ],
                            onSaved: (value) {
                              _formData['industry'] = value;
                            },
                          ),
                          spacingV(20),
                          // Rating
                          AppSelectionFormField(
                            labelText: "Rating",
                            selections: const [
                              'Acquired',
                              'Active',
                              'Market Failed',
                              'Project Cancelled',
                              'Shut Down',
                            ],
                            onSaved: (value) {
                              _formData['rating'] = value;
                            },
                          ),
                          spacingV(20),
                          // Annual Revenue
                          AppTextFormField(
                            labelText: "Annual Revenue",
                            hintText: "Enter Annual Revenue",
                            keyboardType: TextInputType.number,
                            onSaved: (value) {
                              _formData['annualRevenue'] = value;
                            },
                            validator: (value) {
                              if (value != null && value.isNotEmpty) {
                                final parsedValue = int.tryParse(value);
                                if (parsedValue == null) {
                                  _scrollToTop();
                                  return "Please enter a valid number";
                                }
                              }
                              return null;
                            },
                          ),
                          spacingV(20),
                          // Website
                          AppTextFormField(
                            labelText: "Website",
                            hintText: "Enter Website",
                            keyboardType: TextInputType.url,
                            onSaved: (value) {
                              _formData['website'] = value;
                            },
                            validator: (value) {
                              if (value != null && value.isNotEmpty) {
                                final isValidUrl =
                                    Uri.tryParse(value)?.hasScheme ?? false;
                                if (!isValidUrl) {
                                  _scrollToTop();
                                  return "Please enter a valid URL";
                                }
                              }
                              return null;
                            },
                          ),
                          spacingV(20),
                          // Lead Source
                          AppSelectionFormField(
                            labelText: "Lead Source",
                            selections: const [
                              'Advertisement',
                              'Cold Call',
                              'Employee Referral',
                              'External Referral',
                              'Online Store',
                              'Twitter',
                              'Facebook',
                              'partner',
                              'Google+',
                              'Public Relations',
                              'Sales Email',
                              'Seminar Partner',
                              'Internal Seminar',
                              'Trade Show',
                              'Web Download',
                              'Web Research',
                              'Chat',
                            ],
                            onSaved: (value) {
                              _formData['leadSource'] = value;
                            },
                          ),
                          spacingV(20),
                          // Lead Status
                          AppSelectionFormField(
                            labelText: "Lead Status",
                            selections: const [
                              'Attempted to Contact',
                              'Contact in Future',
                              'Contacted',
                              'Junk Lead',
                              'Lost Lead',
                              'Not Contacted',
                            ],
                            onSaved: (value) {
                              _formData['leadStatus'] = value;
                            },
                          ),
                          // spacingV(20),
                          // // Secondary Email
                          // AppTextFormField(
                          //   labelText: "Secondary Email",
                          //   hintText: "Enter Secondary Email",
                          //   keyboardType: TextInputType.emailAddress,
                          //   onSaved: (value) {
                          //     _formData['secondaryEmail'] = value;
                          //   },
                          //   validator: (value) {
                          //     if (value != null && value.isNotEmpty) {
                          //       final isValidEmail = RegExp(
                          //               r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                          //           .hasMatch(value);
                          //       if (!isValidEmail) {
                          //         return "Please check your email";
                          //       }
                          //     }
                          //     return null;
                          //   },
                          // ),
                          spacingV(20),
                          Text(
                            "Address Information",
                            style: R.textStyles.font17PrimaryW600,
                          ),
                          spacingV(20),
                          // State
                          AppTextFormField(
                            labelText: "State",
                            hintText: "Enter State",
                            keyboardType: TextInputType.name,
                            onSaved: (value) {
                              _formData['state'] = value;
                            },
                          ),
                          spacingV(20),
                          // Country
                          AppTextFormField(
                            labelText: "Country",
                            hintText: "Enter Country",
                            keyboardType: TextInputType.name,
                            onSaved: (value) {
                              _formData['country'] = value;
                            },
                          ),
                          spacingV(20),
                          // City
                          AppTextFormField(
                            labelText: "City",
                            hintText: "Enter City",
                            keyboardType: TextInputType.name,
                            onSaved: (value) {
                              _formData['city'] = value;
                            },
                          ),
                          spacingV(20),
                          // Description Information
                          Text(
                            "Description Information",
                            style: R.textStyles.font17PrimaryW600,
                          ),
                          spacingV(20),
                          // Description
                          AppTextFormField(
                            labelText: "Description",
                            hintText: "Enter Description",
                            maxLines: 3,
                            keyboardType: TextInputType.multiline,
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
              "Create New Lead",
              "Complete all the fields below the form",
            ),
          ),
        ],
      ),
    );
  }

  void _scrollToTop() {
    scrollController.animateTo(0,
        duration: const Duration(milliseconds: 1400), curve: Curves.easeIn);
  }

  List<Widget> _submitAndCancel(context) {
    return [
      Row(
        children: [
          Expanded(
            child: AppButton(
              icon: SvgPicture.asset(R.icons.add),
              text: "Create",
              onPressed: () => _submitCreateLead(context),
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

  void _submitCreateLead(context) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      log("_formData: $_formData");
      var createLeadRequestBody = CreateLeadRequestBody(
        // image: _formData['Image'],
        userId: int.tryParse(_formData['leadOwnerId']),
        assignedToId: _formData['assignedToId'] != null
            ? int.tryParse(_formData['assignedToId'])
            : null,
        endTime: _formData['endTime'],
        endTimeHour: _formData['endTimeHour'],
        firstName: _formData['firstName'],
        lastName: _formData['lastName'],
        email: _formData['email'],
        jobTitle: _formData['title'],
        mobile: _formData['phone'],
        mobile2: _formData['secPhone'],
        company: _formData['company'],
        industry: _formData['industry'],
        rating: _formData['rating'],
        annualRevenue: _formData['annualRevenue'] != null
            ? int.tryParse(_formData['annualRevenue'])
            : null,
        website: _formData['website'],
        leadSource: _formData['leadSource'],
        leadStatus: _formData['leadStatus'],
        state: _formData['state'],
        country: _formData['country'],
        city: _formData['city'],
        description: _formData['description'],
      );
      final cubit = getIt.get<CreateLeadCubit>();
      appWaitingFeature(context);
      await cubit.createLead(createLeadRequestBody);
      log("createLeadRequestBody: $createLeadRequestBody");
      Get.back();
      Navigator.pop(context, true);
      log("Submit Successfully");
    }
  }
}
