import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/widgets/app_selection_form_field.dart';
import 'package:trick_crm_app/core/widgets/app_text_form_field.dart';

import '../../../../core/cubits/user_cubit.dart';
import '../../../../core/di/setup-di/dependency_injection.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_waiting_feature.dart';
import '../../../auth/login/data/models/login_response.dart';
import '../../../leads/create-lead/presentation/widgets/top_bar_dialog.dart';
import '../../data/model/brokers_model.dart';
import '../data/model/create_broker_request_body.dart';
import '../logic/cubit/create_broker_cubit.dart';

class CreateBrokerScreen extends StatelessWidget {
  final BrokersModel brokersModel;
  CreateBrokerScreen({
    super.key,
    required this.brokersModel,
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
                            isChange: false,
                            isRequired: true,
                            labelText: "Broker Owner",
                            selections: [
                              {
                                "name": "${userData.name}(You)",
                                "id": userData.id,
                              }
                            ],
                            onSaved: (value) {
                              _formData['brokerOwnerId'] = value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                _scrollToTop();
                                return "Please select broker owner";
                              }
                              return null;
                            },
                          ),
                          spacingV(20),
                          AppSelectionFormField(
                            isRequired: true,
                            labelText: "Assigned To",
                            onSaved: (value) {
                              _formData['assignedToId'] = value;
                            },
                            selections: [
                              {
                                "name": "${userData.name}(You)",
                                "id": userData.id,
                              },
                              ...?brokersModel.users?.map((e) => {
                                    "name": e.name,
                                    "id": e.id,
                                  })
                            ],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                _scrollToTop();
                                return "Please select assigned to";
                              }
                              return null;
                            },
                          ),
                          spacingV(20),
                          AppTextFormField(
                            hintText: "Enter Company Name",
                            labelText: "Company Name",
                            isRequired: true,
                            onSaved: (value) {
                              _formData['companyName'] = value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                _scrollToTop();
                                return "Please enter company name";
                              }
                              return null;
                            },
                          ),
                          spacingV(20),
                          AppTextFormField(
                            hintText: "Enter Person Name",
                            labelText: "Person Name",
                            onSaved: (value) {
                              _formData['personName'] = value;
                            },
                          ),
                          spacingV(20),
                          AppTextFormField(
                            isRequired: true,
                            hintText: "Enter Commercial Register",
                            labelText: "Commercial register",
                            onSaved: (value) {
                              _formData['commercialRegister'] = value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                _scrollToTop();
                                return "Please enter commercial register";
                              }
                              return null;
                            },
                          ),
                          spacingV(20),
                          AppTextFormField(
                            hintText: "Enter Tax Card",
                            labelText: "Tax card",
                            onSaved: (value) {
                              _formData['taxCard'] = value;
                            },
                          ),
                          spacingV(20),
                          AppTextFormField(
                            hintText: "Enter email",
                            labelText: "email",
                            onSaved: (value) {
                              _formData['email'] = value;
                            },
                            keyboardType: TextInputType.emailAddress,
                          ),
                          spacingV(20),
                          AppTextFormField(
                            hintText: "Enter mobile",
                            labelText: "mobile",
                            onSaved: (value) {
                              _formData['mobile'] = value;
                            },
                            keyboardType: TextInputType.phone,
                          ),
                          spacingV(20),
                          AppTextFormField(
                            hintText: "Enter mobile 2",
                            labelText: "mobile 2",
                            onSaved: (value) {
                              _formData['mobile2'] = value;
                            },
                            keyboardType: TextInputType.phone,
                          ),
                          spacingV(20),
                          AppTextFormField(
                            hintText: "Enter address",
                            labelText: "Address",
                            onSaved: (value) {
                              _formData['address'] = value;
                            },
                          ),
                          spacingV(30),
                          AppSelectionFormField(
                            labelText: "Current Status",
                            selections: const [
                              {"name": "Current Broker", "id": 0},
                              {"name": "Ex Broker", "id": 1},
                            ],
                            onSaved: (value) {
                              _formData['currentStatus'] = value;
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
              "Create New Broker",
              "Complete all the fields below the form",
            ),
          ),
        ],
      ),
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
      var createBrokerRequestBody = CreateBrokerRequestBody(
        assignedToId: int.parse(_formData["assignedToId"]),
        companyName: _formData['companyName'],
        commercialRegister: _formData['commercialRegister'],
        isActive: _formData['currentStatus'] == "0" ? false : true,
        email: _formData['email'],
        mobile: _formData['mobile'],
        mobile2: _formData['mobile2'],
        taxCard: _formData['taxCard'],
        address: _formData['address'],
        personName: _formData['personName'],
      );
      final cubit = getIt.get<CreateBrokerCubit>();
      appWaitingFeature(context);
      await cubit.createBroker(createBrokerRequestBody);
      Navigator.pop(context);
      Navigator.pop(context, true);
      log("Submit Successfully");
    }
  }
}
