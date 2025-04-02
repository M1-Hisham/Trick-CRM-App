import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/widgets/app_selection_form_field.dart';
import 'package:trick_crm_app/core/widgets/app_text_form_field.dart';

import '../../../../core/cubits/user_cubit.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_date_picker_field.dart';
import '../../../auth/login/data/models/login_response.dart';
import '../../../leads/create-lead/presentation/widgets/top_bar_dialog.dart';
import '../../data/contacts_model.dart';
import '../data/model/create_contact_request_body.dart';
import '../logic/cubit/create_contact_cubit.dart';

class CreateContactScreen extends StatefulWidget {
  final ContactsModel contactsModel;
  const CreateContactScreen({
    super.key,
    required this.contactsModel,
  });

  @override
  State<CreateContactScreen> createState() => _CreateContactScreenState();
}

class _CreateContactScreenState extends State<CreateContactScreen> {
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
                    // UploadContactImage(fun: (pickedFile) {
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
                            "Owner Information",
                            style: R.textStyles.font17PrimaryW600,
                          ),
                          spacingV(20),
                          AppSelectionFormField(
                            isChange: false,
                            isRequired: true,
                            labelText: "Contact Owner",
                            selections: [
                              {
                                "name": "${userData.name}(You)",
                                "id": userData.id
                              },
                            ],
                            onSaved: (value) {
                              _formData['ContactOwner'] = value;
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
                              ...?widget.contactsModel.users != null
                                  ? widget.contactsModel.users
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
                            "Contact Information",
                            style: R.textStyles.font17PrimaryW600,
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
                          //Website
                          AppTextFormField(
                            labelText: "Website",
                            hintText: "Enter website",
                            keyboardType: TextInputType.url,
                            onSaved: (value) {
                              _formData['website'] = value;
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
                          //City
                          AppTextFormField(
                            labelText: "City",
                            hintText: "Enter city",
                            onSaved: (value) {
                              _formData['city'] = value;
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
              "Create New Contact",
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
      var createContactRequestBody = CreateContactRequestBody(
        firstName: _formData['firstName'],
        lastName: _formData['lastName'],
        email: _formData['email'],
        mobile: _formData['phoneNumber'],
        // image: _formData['image'] == null || _formData['image'] == ""
        //     ? null
        //     : _formData['image'].path,
        mobile2: _formData['secPhoneNumber'],
        assignedToId:
            _formData['assignedToId'] == null || _formData['assignedToId'] == ""
                ? null
                : int.parse(_formData['assignedToId']),
        endTime: _formData['endTime'],
        endTimeHour: _formData['endTimeHour'],
        company: _formData['companyName'],
        jobTitle: _formData['title'],
        industry: _formData['industry'],
        rating: _formData['rating'],
        annualRevenue: _formData['annualRevenue'] == null ||
                _formData['annualRevenue'] == ""
            ? null
            : int.parse(_formData['annualRevenue']),
        website: _formData['website'],
        leadSource: _formData['leadSource'],
        state: _formData['state'],
        country: _formData['country'],
        city: _formData['city'],
        description: _formData['description'],
      );
      final cubit = getIt.get<CreateContactCubit>();
      Get.back();
      await cubit.createContact(createContactRequestBody);
      log("Submit Successfully");
      // getIt.get<ContactsCubit>().getData();
    }
  }
}
