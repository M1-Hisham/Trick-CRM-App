import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trick_crm_app/core/api/api_constants.dart';
import 'package:trick_crm_app/core/cubits/base_state.dart';
import 'package:trick_crm_app/core/di/setup-di/dependency_injection.dart';
import 'package:trick_crm_app/core/helpers/loading_shimmer.dart';
import 'package:trick_crm_app/core/helpers/spacing.dart';
import 'package:trick_crm_app/core/widgets/app_bar.dart';
import 'package:trick_crm_app/core/widgets/app_button.dart';
import 'package:trick_crm_app/core/widgets/app_error_message.dart';
import 'package:trick_crm_app/core/widgets/app_text_form_field.dart';
import 'package:trick_crm_app/core/widgets/app_waiting_feature.dart';
import 'package:trick_crm_app/features/profile/Company/company-view/data/model/company_model.dart';
import 'package:trick_crm_app/features/profile/Company/company-view/logic/cubit/company_cubit.dart';

import '../../../../../core/resources/resources.dart';
import '../../update-company/data/model/update_company_request_body.dart';
import '../../update-company/logic/cubit/update_company_cubit.dart';
import 'widget/loading_company_screen.dart';

class CompanyScreen extends StatelessWidget {
  CompanyScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _fromData = {};
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: appBar('Company'),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: BlocBuilder<CompanyCubit, BaseState<CompanyModel>>(
              buildWhen: (previous, current) =>
                  current is Loading || current is Success || current is Error,
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () => loadingShimmer(child: loadingCompanyScreen()),
                  success: (CompanyModel data) {
                    final companyData = data.tenantCompanyData;
                    return Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          spacingV(20),
                          Center(
                            child: CircleAvatar(
                              radius: 110.dg,
                              backgroundColor: R.colors.secGray,
                              backgroundImage: NetworkImage(
                                '${ApiConstants.baseUrl}${companyData?.logo ?? ''}',
                                // '${ApiConstants.baseUrl}/test-TpxSV1npkcefm0Wjao075hbDgOjJjl/tenancy/assets/CompanyLogo/51v8nyxSOYL._SL1500_.jpg',
                              ),
                              onBackgroundImageError: (context, error) {
                                if (error
                                    .toString()
                                    .contains("Failed host lookup")) {
                                  Image.asset(R.icons.imageUserError);
                                }
                                Image.asset(R.icons.imageUserError);
                              },
                            ),
                          ),
                          spacingV(20),
                          Text(
                            companyData?.name ?? 'Company Name',
                            style: R.textStyles.font20ShadowGray29W500,
                          ),
                          spacingV(40),
                          AppTextFormField(
                            initialValue: companyData?.name,
                            hintText: 'Company Name',
                            fillColor: R.colors.gray,
                            onSaved: (value) {
                              _fromData['name'] = value;
                            },
                          ),
                          spacingV(20),
                          AppTextFormField(
                            initialValue: companyData?.email,
                            hintText: 'Email',
                            fillColor: R.colors.gray,
                            onSaved: (value) {
                              _fromData['email'] = value;
                            },
                          ),
                          spacingV(20),
                          AppTextFormField(
                            initialValue: companyData?.phoneNumber.toString(),
                            hintText: 'Phone Number',
                            keyboardType: TextInputType.phone,
                            fillColor: R.colors.gray,
                            onSaved: (value) {
                              _fromData['phone_number'] = value;
                            },
                          ),
                          spacingV(20),
                          AppTextFormField(
                            initialValue: companyData?.website,
                            hintText: 'Website',
                            fillColor: R.colors.gray,
                            onSaved: (value) {
                              _fromData['website'] = value;
                            },
                          ),
                          spacingV(20),
                          AppTextFormField(
                            initialValue: companyData?.industry,
                            hintText: 'Industry',
                            fillColor: R.colors.gray,
                            onSaved: (value) {
                              _fromData['industry'] = value;
                            },
                          ),
                          spacingV(20),
                          AppTextFormField(
                            initialValue: companyData?.address,
                            hintText: 'Address',
                            fillColor: R.colors.gray,
                            onSaved: (value) {
                              _fromData['address'] = value;
                            },
                          ),
                          spacingV(30),
                          AppButton(
                            text: "Save Change",
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                log("_fromData: $_fromData");
                                appWaitingFeature(context);
                                await getIt<UpdateCompanyCubit>().updateCompany(
                                  UpdateCompanyRequestBody(
                                    name: _fromData['name'],
                                    phoneNumber: _fromData['phone_number'] !=
                                                null &&
                                            _fromData['phone_number'] != ''
                                        ? int.parse(_fromData['phone_number'])
                                        : null,
                                    email: _fromData['email'],
                                    address: _fromData['address'],
                                    industry: _fromData['industry'],
                                    website: _fromData['website'],
                                  ),
                                );
                                // ignore: use_build_context_synchronously
                                Navigator.pop(context);
                                // ignore: use_build_context_synchronously
                                context.read<CompanyCubit>().getData();
                              }
                            },
                          ),
                          spacingV(30),
                        ],
                      ),
                    );
                  },
                  error: (error) => appErrorMessage(
                    error,
                    () {
                      context.read<CompanyCubit>().getData();
                    },
                  ),
                  orElse: () => const SizedBox.shrink(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
