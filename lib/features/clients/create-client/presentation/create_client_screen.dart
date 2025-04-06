import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/widgets/app_selection_form_field.dart';
import 'package:trick_crm_app/core/widgets/app_text_form_field.dart';
import 'package:trick_crm_app/features/clients/clients/data/model/clients_model.dart';

import '../../../../core/cubits/user_cubit.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_date_picker_field.dart';
import '../../../../core/widgets/app_waiting_feature.dart';
import '../../../auth/login/data/models/login_response.dart';
import '../../../leads/create-lead/presentation/widgets/top_bar_dialog.dart';
import '../data/model/create_client_request_body.dart';
import '../logic/cubit/create_client_cubit.dart';
import 'widget/upload_client_image.dart';

class CreateClientScreen extends StatefulWidget {
  final ClientsModel clientsModel;
  const CreateClientScreen({
    super.key,
    required this.clientsModel,
  });

  @override
  State<CreateClientScreen> createState() => _CreateClientScreenState();
}

class _CreateClientScreenState extends State<CreateClientScreen> {
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
                    UploadClientImage(fun: (pickedFile) {
                      if (pickedFile != null) {
                        _formData['image'] = File(pickedFile.name);
                      }
                    }),
                    spacingV(20),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Owner Information",
                            style: R.textStyles.font17PrimaryW600,
                          ),
                          spacingV(20),
                          AppSelectionFormField(
                            isChange: false,
                            isRequired: true,
                            labelText: "Client Owner",
                            selections: [
                              {
                                "name": "${userData.name}(You)",
                                "id": userData.id
                              },
                            ],
                            onSaved: (value) {
                              _formData['clientOwner'] = value;
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
                              ...?widget.clientsModel.users != null
                                  ? widget.clientsModel.users
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
                                  _formData['assignTo'] = value;
                                });
                              }
                            },
                          ),
                          spacingV(20),
                          Visibility(
                            visible: _formData['assignTo'] != null,
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
                            "Client Information",
                            style: R.textStyles.font17PrimaryW600,
                          ),
                          spacingV(20),
                          //Broker Name
                          AppSelectionFormField(
                            labelText: "Broker name",
                            selections: [
                              ...?widget.clientsModel.brokers != null
                                  ? widget.clientsModel.brokers
                                      ?.map((e) => {
                                            "name": "${e.companyName}",
                                            "id": e.id,
                                          })
                                      .toList()
                                  : []
                            ],
                            onSaved: (value) {
                              _formData['brokerNameId'] = value;
                            },
                          ),
                          spacingV(20),
                          //First Name
                          AppTextFormField(
                            hintText: "Enter First Name",
                            labelText: "First Name",
                            isRequired: true,
                            keyboardType: TextInputType.name,
                            onSaved: (value) {
                              _formData['firstName'] = value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                _scrollToTop();
                                return 'Please enter a valid first name';
                              }
                              return null;
                            },
                          ),
                          spacingV(20),
                          //Last Name
                          AppTextFormField(
                            hintText: "Enter Last Name",
                            labelText: "Last Name",
                            isRequired: true,
                            keyboardType: TextInputType.name,
                            onSaved: (value) {
                              _formData['lastName'] = value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                _scrollToTop();
                                return 'Please enter a valid Last Name';
                              }
                              return null;
                            },
                          ),
                          spacingV(20),
                          //Arabic Name
                          AppTextFormField(
                            hintText: "Enter Arabic Name",
                            labelText: "Arabic Name",
                            isRequired: true,
                            onSaved: (value) {
                              _formData['arabicName'] = value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                _scrollToTop();
                                return 'Please enter a valid Arabic Name';
                              }
                              if (!RegExp(r'^[\u0600-\u06FF\s]+$')
                                  .hasMatch(value)) {
                                _scrollToTop();
                                return 'Please enter the name of the client in Arabic!';
                              }
                              return null;
                            },
                          ),
                          spacingV(20),
                          //National id
                          AppTextFormField(
                            labelText: "National id",
                            hintText: "Enter National id",
                            isRequired: true,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                _scrollToTop();
                                return 'Please enter a valid national id';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _formData['nationalId'] = value;
                            },
                          ),
                          spacingV(20),
                          //Passport id
                          AppTextFormField(
                            isRequired: true,
                            labelText: "Passport id",
                            hintText: "Enter passport id",
                            onSaved: (value) {
                              _formData['passportId'] = value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                _scrollToTop();
                                return 'Please enter a valid passport id';
                              }

                              return null;
                            },
                          ),
                          spacingV(20),
                          //Arabic nationality
                          AppTextFormField(
                              isRequired: true,
                              labelText: "Arabic nationality",
                              hintText: "Enter arabic nationality",
                              keyboardType: TextInputType.name,
                              onSaved: (value) {
                                _formData['arabicNationality'] = value;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  _scrollToTop();
                                  return 'Please enter a valid arabic nationality';
                                }
                                if (!RegExp(r'^[\u0600-\u06FF\s]+$')
                                    .hasMatch(value)) {
                                  _scrollToTop();
                                  return 'Please enter the nationality of the client in Arabic!';
                                }
                                return null;
                              }),
                          spacingV(20),
                          //Arabic address
                          AppTextFormField(
                            isRequired: true,
                            labelText: "Arabic address",
                            hintText: "Enter arabic address",
                            keyboardType: TextInputType.name,
                            onSaved: (value) {
                              _formData['arabicAddress'] = value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                _scrollToTop();
                                return 'Please enter a valid arabic address';
                              }
                              if (!RegExp(r'^[\u0600-\u06FF\s]+$')
                                  .hasMatch(value)) {
                                _scrollToTop();
                                return 'Please enter the address of the client in Arabic!';
                              }
                              return null;
                            },
                          ),
                          spacingV(20),
                          //Email
                          AppTextFormField(
                            isRequired: true,
                            labelText: "Email",
                            hintText: "Enter email",
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (value) {
                              _formData['email'] = value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                _scrollToTop();
                                return 'Please enter a valid email';
                              }
                              if (!RegExp(
                                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                                  .hasMatch(value)) {
                                _scrollToTop();
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                          ),
                          spacingV(20),
                          //Title
                          AppTextFormField(
                            labelText: "Title",
                            hintText: "Enter title",
                            keyboardType: TextInputType.name,
                            onSaved: (value) {
                              _formData['title'] = value;
                            },
                          ),
                          spacingV(20),
                          //Phone Number
                          AppTextFormField(
                            isRequired: true,
                            labelText: "Phone Number",
                            hintText: "Enter phone number",
                            keyboardType: TextInputType.phone,
                            onSaved: (value) {
                              _formData['phoneNumber'] = value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                _scrollToTop();
                                return 'Please enter a valid phone number';
                              }
                              return null;
                            },
                          ),
                          spacingV(20),
                          //Sec. Phone Number
                          AppTextFormField(
                            labelText: "Sec. Phone Number",
                            hintText: "Enter sec. phone number",
                            keyboardType: TextInputType.phone,
                            onSaved: (value) {
                              _formData['secPhoneNumber'] = value;
                            },
                          ),
                          spacingV(20),
                          //Company
                          AppTextFormField(
                            labelText: "Company Name",
                            hintText: "Enter company name",
                            keyboardType: TextInputType.name,
                            onSaved: (value) {
                              _formData['companyName'] = value;
                            },
                          ),
                          spacingV(20),
                          //Lead Source
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
                              _formData['leadSource'] = value;
                            },
                          ),
                          spacingV(20),
                          //Lead Status
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
                          spacingV(20),
                          //Industry
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
                          //Rating
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
                          //Annual Revenue
                          AppTextFormField(
                            labelText: "Annual Revenue",
                            hintText: "Enter annual revenue",
                            keyboardType: TextInputType.number,
                            onSaved: (value) {
                              _formData['annualRevenue'] = value;
                            },
                          ),
                          spacingV(20),
                          //Address Information
                          Text(
                            "Address Information",
                            style: R.textStyles.font17PrimaryW600,
                          ),
                          spacingV(20),
                          //State
                          AppTextFormField(
                            labelText: "State",
                            hintText: "Enter State",
                            onSaved: (value) {
                              _formData['state'] = value;
                            },
                          ),
                          spacingV(20),
                          //Country
                          AppTextFormField(
                            labelText: "Country",
                            hintText: "Enter country",
                            onSaved: (value) {
                              _formData['country'] = value;
                            },
                          ),
                          spacingV(20),
                          //City
                          AppTextFormField(
                            labelText: "City",
                            hintText: "Enter city",
                            onSaved: (value) {
                              _formData['city'] = value;
                            },
                          ),
                          spacingV(20),
                          //Description Information
                          Text(
                            "Description Information",
                            style: R.textStyles.font17PrimaryW600,
                          ),
                          spacingV(20),
                          //Description
                          AppTextFormField(
                            labelText: "Description",
                            hintText: "Enter description",
                            maxLines: 3,
                            onSaved: (value) {
                              _formData['description'] = value;
                            },
                          ),
                          spacingV(20),
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
              "Create New Client",
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
      var createClientRequestBody = CreateClientRequestBody(
        firstName: _formData['firstName'],
        lastName: _formData['lastName'],
        email: _formData['email'],
        mobile: _formData['phoneNumber'],
        arName: _formData['arabicName'],
        nationalId: _formData['nationalId'],
        passportId: _formData['passportId'],
        arNationality: _formData['arabicNationality'],
        arAddress: _formData['arabicAddress'],
        brokerId: _formData['brokerNameId'] != null
            ? int.parse(_formData['brokerNameId'])
            : null,
        assignedToId:
            _formData['assignedToId'] != null && _formData['assignedToId'] != ""
                ? int.parse(_formData['assignedToId'])
                : null,
        // ownerName: _formData['ownerName'],
        endTime: _formData['endTime'],
        endTimeHour: _formData['endTimeHour'],
        description: _formData['description'],
        // image: _formData['image'],
        state: _formData['state'],
        city: _formData['city'],
        country: _formData['country'],
        industry: _formData['industry'],
        annualRevenue: _formData['annualRevenue'] != null &&
                _formData['annualRevenue'] != ""
            ? int.parse(_formData['annualRevenue'])
            : null,
        leadSource: _formData['leadSource'],
        leadStatus: _formData['leadStatus'],
        rating: _formData['rating'],
        mobile2: _formData['secPhoneNumber'],
        jobTitle: _formData['title'],
        company: _formData['companyName'],
        // clientName: _formData['clientOwner'],
      );
      final cubit = getIt.get<CreateClientCubit>();
      appWaitingFeature(context);
      await cubit.createClient(createClientRequestBody);
      Navigator.pop(context);
      Navigator.pop(context, true);
      log("Submit Successfully");
    }
  }
}
